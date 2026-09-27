import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S>
    with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDelegate<
  E extends BaseBlocEvent,
  S extends BaseBlocState
>
    extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  // khai báo để nhận (sẽ được inject từ pageState)
  late final AppNavigator navigator;
  late final AppBloc appBloc;
  late final ExceptionHandler exceptionHandler;
  late final ExceptionMessageMapper exceptionMessageMapper;
  late final DisposeBag disposeBag;
  late final CommonBloc _commonBloc;

  set commonBloc(CommonBloc commonBloc) {
    _commonBloc = commonBloc;
  }

  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      Log.e(
        'Cannot machine_learning new event $event because $runtimeType was closed',
      );
    }
  }

  Future<void> addException(AppExceptionWrapper appExceptionWrapper) async {
    commonBloc.add(ExceptionEmitted(appExceptionWrapper: appExceptionWrapper));

    return appExceptionWrapper
        .exceptionCompleter
        ?.future; // đoạn này khá khó hiểu
  }

  void showLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: false));
  }

  Future<void> runBlocCatching({
    required Future<void> Function() action, // hàm thực thi
    Future<void> Function()? doOnRetry, // chạy khi user bấm nút retry ở dialog (nếu k gọi thì runBloc tự gọi lại để retry)
    Future<void> Function(AppException)? doOnError, // chạy khi gặp lỗi, (nếu lỗi thì chạy để revert lại)
    Future<void> Function()? doOnSubscribe, //  để  reset state cũ, set state trước khi fetch (show shimmer loading)
    Future<void> Function()? doOnSuccessOrError, // chạy ngay khi action end, để tắt bộ đếm tg, để log tg  hoàn thành task
    Future<void> Function()? doOnEventCompleted, // chay ở khối finally, để giải phóng bộ  nhớ, biến tạm
    bool handleLoading = true, // overlay loading (T = tự động hiện )
    bool handleError = true, // tự động bắt và hiển thị báo lỗi (dialog/toast)
    bool handleRetry = true, // cấu hình xem lỗi này có cho phép người dùng bấm nút thử lại trên dialog k
    bool Function(AppException)? forceHandleError, // func nhận AppException trả về bool (nếu tra về true, nó bắt buộc hiển thị dialog)
    String? overrideErrorMessage,// dùng để ghi đè tbao lỗi, ví dụ be trả về tb qua kĩ thuật thì ghi  đè cho dễ hiểu
    int? maxRetries, //số lần tự động cho phép retry tối đa (mỗi lần retry đệ quy sẽ -1)
  }) async {
    assert(maxRetries == null || maxRetries > 0, 'maxRetries must be positive');
    Completer<void>? recursion;
    try {
      await doOnSubscribe?.call();
      if (handleLoading) {
        showLoading();
      }

      await action.call();

      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
    } on AppException catch (e) {
      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
      await doOnError?.call(e);

      if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
        await addException(
          AppExceptionWrapper(
            // có liên quan đến phần trên
            appException: e,
            doOnRetry:
                doOnRetry ??
                (handleRetry && maxRetries != 1
                    ? () async {
                        recursion = Completer();
                        await runBlocCatching(
                          action: action,
                          doOnEventCompleted: doOnEventCompleted,
                          doOnSubscribe: doOnSubscribe,
                          doOnSuccessOrError: doOnSuccessOrError,
                          doOnError: doOnError,
                          doOnRetry: doOnRetry,
                          forceHandleError: forceHandleError,
                          handleError: handleError,
                          handleLoading: handleLoading,
                          handleRetry: handleRetry,
                          overrideErrorMessage: overrideErrorMessage,
                          maxRetries: maxRetries?.minus(1),
                        );
                        recursion?.complete();
                      }
                    : null),
            exceptionCompleter: Completer<void>(),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      await recursion?.future;
      await doOnEventCompleted?.call();
    }
  }

  bool _forceHandleError(AppException appException) {
    return appException is RemoteException &&
        appException.kind == RemoteExceptionKind.refreshTokenFailed;
  }
}
