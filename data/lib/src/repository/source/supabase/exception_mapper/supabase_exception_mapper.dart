import 'dart:async';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseExceptionMapper extends ExceptionMapper<RemoteException> {
  @override
  RemoteException map(Object? exception) {
    if (exception is RemoteException) return exception;

    if (exception is SocketException) {
      return RemoteException(
        kind: RemoteExceptionKind.network,
        rootException: exception,
      );
    }
    if (exception is TimeoutException) {
      return RemoteException(
        kind: RemoteExceptionKind.timeout,
        rootException: exception,
      );
    }
    if (exception is AuthException) return _mapAuth(exception);
    if (exception is PostgrestException) return _mapPostgrest(exception);
    if (exception is StorageException) return _mapStorage(exception);
    if (exception is FormatException || exception is TypeError) {
      return RemoteException(
        kind: RemoteExceptionKind.decodeError,
        serverError: const ServerError(
          generalMessage: 'Dữ liệu nhận từ máy chủ không đúng định dạng.',
        ),
        rootException: exception,
      );
    }

    return RemoteException(
      kind: RemoteExceptionKind.serverUndefined,
      serverError: const ServerError(
        generalMessage: 'Đã xảy ra lỗi. Vui lòng thử lại sau.',
      ),
      rootException: exception,
    );
  }

  RemoteException _mapAuth(AuthException exception) {
    final statusCode = int.tryParse(exception.statusCode ?? '');
    final code = exception.code?.toLowerCase();
    final rawMessage = exception.message.toLowerCase();

    if (exception is AuthRetryableFetchException) {
      return RemoteException(
        kind: RemoteExceptionKind.network,
        httpErrorCode: statusCode,
        rootException: exception,
      );
    }

    const expiredSessionCodes = {
      'bad_jwt',
      'invalid_jwt',
      'session_not_found',
      'refresh_token_not_found',
      'refresh_token_already_used',
    };
    if (exception is AuthSessionMissingException ||
        expiredSessionCodes.contains(code) ||
        rawMessage.contains('jwt expired')) {
      return RemoteException(
        kind: RemoteExceptionKind.refreshTokenFailed,
        httpErrorCode: statusCode,
        rootException: exception,
      );
    }

    final message = switch (code) {
      'invalid_credentials' => 'Email hoặc mật khẩu không chính xác.',
      'email_not_confirmed' =>
        'Email chưa được xác nhận. Vui lòng kiểm tra hộp thư.',
      'user_already_exists' => 'Email này đã được đăng ký.',
      'email_exists' => 'Email này đã được đăng ký.',
      'weak_password' => 'Mật khẩu chưa đáp ứng yêu cầu bảo mật.',
      'over_email_send_rate_limit' =>
        'Bạn thao tác quá nhanh. Vui lòng thử lại sau ít phút.',
      'over_request_rate_limit' =>
        'Bạn thao tác quá nhanh. Vui lòng thử lại sau ít phút.',
      'signup_disabled' => 'Đăng ký tài khoản hiện đang tạm khóa.',
      _ =>
        exception.message.isEmpty
            ? 'Không thể xác thực tài khoản. Vui lòng thử lại.'
            : exception.message,
    };

    return RemoteException(
      kind: RemoteExceptionKind.serverDefined,
      httpErrorCode: statusCode,
      serverError: ServerError(
        generalServerStatusCode: statusCode,
        generalServerErrorId: exception.code,
        generalMessage: message,
      ),
      rootException: exception,
    );
  }

  RemoteException _mapPostgrest(PostgrestException exception) {
    final code = exception.code;
    final messageLower = exception.message.toLowerCase();
    if (code == '401' ||
        code == 'PGRST301' ||
        messageLower.contains('jwt expired')) {
      return RemoteException(
        kind: RemoteExceptionKind.refreshTokenFailed,
        httpErrorCode: 401,
        rootException: exception,
      );
    }

    final message = switch (code) {
      '23505' => 'Dữ liệu này đã tồn tại.',
      '23503' => 'Dữ liệu liên quan không còn tồn tại.',
      '23514' => 'Dữ liệu không đáp ứng điều kiện hợp lệ.',
      '42501' => 'Bạn không có quyền thực hiện thao tác này.',
      'PGRST116' => 'Không tìm thấy dữ liệu yêu cầu.',
      _ =>
        exception.message.isEmpty
            ? 'Máy chủ không thể xử lý yêu cầu.'
            : exception.message,
    };

    return RemoteException(
      kind: RemoteExceptionKind.serverDefined,
      serverError: ServerError(
        generalServerErrorId: code,
        generalMessage: message,
      ),
      rootException: exception,
    );
  }

  RemoteException _mapStorage(StorageException exception) {
    final statusCode = int.tryParse(exception.statusCode ?? '');
    if (statusCode == 401) {
      return RemoteException(
        kind: RemoteExceptionKind.refreshTokenFailed,
        httpErrorCode: statusCode,
        rootException: exception,
      );
    }

    return RemoteException(
      kind: RemoteExceptionKind.serverDefined,
      httpErrorCode: statusCode,
      serverError: ServerError(
        generalServerStatusCode: statusCode,
        generalServerErrorId: exception.error,
        generalMessage: statusCode == 403
            ? 'Bạn không có quyền truy cập tệp này.'
            : exception.message,
      ),
      rootException: exception,
    );
  }
}
