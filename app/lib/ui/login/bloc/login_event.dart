import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'login_event.freezed.dart';

abstract class LoginEvent extends BaseBlocEvent {
  const LoginEvent();
}

@freezed
sealed class EmailTextFieldChanged extends LoginEvent
    with _$EmailTextFieldChanged {
  const EmailTextFieldChanged._();
  const factory EmailTextFieldChanged({
    required String email,
  }) = _EmailTextFieldChanged;
}

@freezed
sealed class PasswordTextFieldChanged extends LoginEvent
    with _$PasswordTextFieldChanged {
  const PasswordTextFieldChanged._();
  const factory PasswordTextFieldChanged({
    required String password,
  }) = _PasswordTextFieldChanged;
}

@freezed
sealed class EyeIconPressed extends LoginEvent with _$EyeIconPressed {
  const EyeIconPressed._();
  const factory EyeIconPressed() = _EyeIconPressed;
}

@freezed
sealed class LoginButtonPressed extends LoginEvent with _$LoginButtonPressed {
  const LoginButtonPressed._();
  const factory LoginButtonPressed() = _LoginButtonPressed;
}

@freezed
sealed class FakeLoginButtonPressed extends LoginEvent
    with _$FakeLoginButtonPressed {
  const FakeLoginButtonPressed._();
  const factory FakeLoginButtonPressed() = _FakeLoginButtonPressed;
}
