import 'package:resources/resources.dart';
import 'package:shared/shared.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    return switch (appException.appExceptionType) {
      AppExceptionType.remote =>
        switch ((appException as RemoteException).kind) {
          RemoteExceptionKind.badCertificate =>
            'Không thể thiết lập kết nối bảo mật.',
          RemoteExceptionKind.noInternet => S.current.noInternetException,
          RemoteExceptionKind.network => S.current.canNotConnectToHost,
          RemoteExceptionKind.serverDefined =>
            appException.generalServerMessage ??
                'Máy chủ không thể xử lý yêu cầu.',
          RemoteExceptionKind.serverUndefined =>
            appException.generalServerMessage ??
                'Đã xảy ra lỗi. Vui lòng thử lại sau.',
          RemoteExceptionKind.timeout => S.current.timeoutException,
          RemoteExceptionKind.cancellation => 'Thao tác đã được hủy.',
          RemoteExceptionKind.unknown =>
            appException.generalServerMessage ??
                'Đã xảy ra lỗi. Vui lòng thử lại sau.',
          RemoteExceptionKind.refreshTokenFailed => S.current.tokenExpired,
          RemoteExceptionKind.decodeError =>
            appException.generalServerMessage ??
                'Dữ liệu nhận từ máy chủ không hợp lệ.',
        },
      AppExceptionType.parse => 'Không thể đọc dữ liệu nhận được.',
      AppExceptionType.uncaught => 'Đã xảy ra lỗi. Vui lòng thử lại sau.',
      AppExceptionType.validation =>
        switch ((appException as ValidationException).kind) {
          ValidationExceptionKind.emptyEmail => S.current.emptyEmail,
          ValidationExceptionKind.invalidEmail => S.current.invalidEmail,
          ValidationExceptionKind.invalidPassword => S.current.invalidPassword,
          ValidationExceptionKind.invalidUserName => S.current.invalidUserName,
          ValidationExceptionKind.invalidPhoneNumber =>
            S.current.invalidPhoneNumber,
          ValidationExceptionKind.invalidDateTime => S.current.invalidDateTime,
          ValidationExceptionKind.passwordsAreNotMatch =>
            S.current.passwordsAreNotMatch,
          ValidationExceptionKind.noItemSelected => S.current.noItemSelected,
        },
      AppExceptionType.remoteConfig =>
        'Không thể tải cấu hình ứng dụng. Vui lòng thử lại.',
    };
  }
}
