import 'dart:math';

import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseExceptionMapper extends ExceptionMapper<RemoteException> {

  @override
  RemoteException map(Object? exception) {
      if (exception is RemoteException) {
        return exception;
      }

      //query error
      if (exception is PostgrestException) {
        final statusCode = int.tryParse(exception.code ?? '');
        return RemoteException(
          kind: RemoteExceptionKind.serverDefined,
          httpErrorCode: statusCode,
          serverError: ServerError(
            generalServerStatusCode: statusCode,
            generalMessage: exception.message,
          ),
          rootException: exception,
        );
      }

    //auth error
    if (exception is AuthException) {
      return RemoteException(
        kind: RemoteExceptionKind.serverDefined,
        serverError: ServerError(generalMessage: exception.message),
        rootException: exception,
      );
    }

    // up-down load file
    if (exception is StorageException) {
      final statusCode = int.tryParse(exception.statusCode?.toString() ?? '');
      return RemoteException(
        kind: RemoteExceptionKind.serverDefined,
        httpErrorCode: statusCode,
        serverError: ServerError(
          generalServerStatusCode: statusCode,
          generalMessage: exception.message,
        ),
        rootException: exception,
      );
    }

      // chua dang nhap
      if (exception is PostgrestException && exception.code == '401') {
        return RemoteException(
          kind: RemoteExceptionKind.refreshTokenFailed, // ✅ Force logout
          httpErrorCode: 401,
          serverError: ServerError(
            generalServerStatusCode: 401,
            generalMessage: 'Unauthorized',
          ),
          rootException: exception,
        );
      }

    //supabase_flutter k hỗ trợ export ra lỗi của realtime, --> xử lý = unknow
    return RemoteException(kind: RemoteExceptionKind.unknown, rootException: exception);
  }
}
