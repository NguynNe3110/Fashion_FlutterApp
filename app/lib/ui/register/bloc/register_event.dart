import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'register_event.freezed.dart';

abstract class RegisterEvent extends BaseBlocEvent {
  const RegisterEvent();
}

@freezed
class NameTextFieldChanged extends RegisterEvent with _$NameTextFieldChanged {
  const factory NameTextFieldChanged({required String name}) =
      _NameTextFieldChanged;
}

@freezed
class EmailTextFieldRegisterChanged extends RegisterEvent
    with _$EmailTextFieldRegisterChanged {
  const factory EmailTextFieldRegisterChanged({required String email}) =
      _EmailTextFieldRegisterChanged;
}

@freezed
class PasswordTextFieldRegisterChanged extends RegisterEvent
    with _$PasswordTextFieldRegisterChanged {
  const factory PasswordTextFieldRegisterChanged({required String password}) =
      _PasswordTextFieldRegisterChanged;
}

@freezed
class ConfirmPasswordTextFieldChanged extends RegisterEvent
    with _$ConfirmPasswordTextFieldChanged {
  const factory ConfirmPasswordTextFieldChanged({
    required String confirmPassword,
  }) = _ConfirmPasswordTextFieldChanged;
}

@freezed
class EyeIconRegisterPressed extends RegisterEvent
    with _$EyeIconRegisterPressed {
  const factory EyeIconRegisterPressed() = _EyeIconRegisterPressed;
}

@freezed
class ConfirmEyeIconPressed extends RegisterEvent with _$ConfirmEyeIconPressed {
  const factory ConfirmEyeIconPressed() = _ConfirmEyeIconPressed;
}

@freezed
class TermsCheckboxToggled extends RegisterEvent with _$TermsCheckboxToggled {
  const factory TermsCheckboxToggled({required bool isAccepted}) =
      _TermsCheckboxToggled;
}

@freezed
class RegisterButtonPressed extends RegisterEvent with _$RegisterButtonPressed {
  const factory RegisterButtonPressed() = _RegisterButtonPressed;
}
