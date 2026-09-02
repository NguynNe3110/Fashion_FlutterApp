import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../app.dart';

part 'common_event.freezed.dart';

abstract class CommonEvent extends BaseBlocEvent {
  const CommonEvent();
}

@freezed
sealed class ExceptionEmitted extends CommonEvent with _$ExceptionEmitted {
  const ExceptionEmitted._();
  const factory ExceptionEmitted({
    required AppExceptionWrapper appExceptionWrapper,
  }) = _ExceptionEmitted;
}

@freezed
sealed class LoadingVisibilityEmitted extends CommonEvent
    with _$LoadingVisibilityEmitted {
  const LoadingVisibilityEmitted._();
  const factory LoadingVisibilityEmitted({
    required bool isLoading,
  }) = _LoadingVisibilityEmitted;
}

@freezed
sealed class ForceLogoutButtonPressed extends CommonEvent
    with _$ForceLogoutButtonPressed {
  const ForceLogoutButtonPressed._();
  const factory ForceLogoutButtonPressed() = _ForceLogoutButtonPressed;
}
