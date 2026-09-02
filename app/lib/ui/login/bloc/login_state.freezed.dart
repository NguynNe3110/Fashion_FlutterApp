// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isLoginButtonEnabled => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  String get onPageError => throw _privateConstructorUsedError;
  bool get showLoginButtonLoading => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
    LoginState value,
    $Res Function(LoginState) then,
  ) = _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({
    String email,
    String password,
    bool isLoginButtonEnabled,
    bool obscureText,
    String onPageError,
    bool showLoginButtonLoading,
  });
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isLoginButtonEnabled = null,
    Object? obscureText = null,
    Object? onPageError = null,
    Object? showLoginButtonLoading = null,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            isLoginButtonEnabled: null == isLoginButtonEnabled
                ? _value.isLoginButtonEnabled
                : isLoginButtonEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            obscureText: null == obscureText
                ? _value.obscureText
                : obscureText // ignore: cast_nullable_to_non_nullable
                      as bool,
            onPageError: null == onPageError
                ? _value.onPageError
                : onPageError // ignore: cast_nullable_to_non_nullable
                      as String,
            showLoginButtonLoading: null == showLoginButtonLoading
                ? _value.showLoginButtonLoading
                : showLoginButtonLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
    _$LoginStateImpl value,
    $Res Function(_$LoginStateImpl) then,
  ) = __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    bool isLoginButtonEnabled,
    bool obscureText,
    String onPageError,
    bool showLoginButtonLoading,
  });
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
    _$LoginStateImpl _value,
    $Res Function(_$LoginStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isLoginButtonEnabled = null,
    Object? obscureText = null,
    Object? onPageError = null,
    Object? showLoginButtonLoading = null,
  }) {
    return _then(
      _$LoginStateImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        isLoginButtonEnabled: null == isLoginButtonEnabled
            ? _value.isLoginButtonEnabled
            : isLoginButtonEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        obscureText: null == obscureText
            ? _value.obscureText
            : obscureText // ignore: cast_nullable_to_non_nullable
                  as bool,
        onPageError: null == onPageError
            ? _value.onPageError
            : onPageError // ignore: cast_nullable_to_non_nullable
                  as String,
        showLoginButtonLoading: null == showLoginButtonLoading
            ? _value.showLoginButtonLoading
            : showLoginButtonLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState {
  const _$LoginStateImpl({
    this.email = '',
    this.password = '',
    this.isLoginButtonEnabled = false,
    this.obscureText = false,
    this.onPageError = '',
    this.showLoginButtonLoading = false,
  }) : super._();

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool isLoginButtonEnabled;
  @override
  @JsonKey()
  final bool obscureText;
  @override
  @JsonKey()
  final String onPageError;
  @override
  @JsonKey()
  final bool showLoginButtonLoading;

  @override
  String toString() {
    return 'LoginState(email: $email, password: $password, isLoginButtonEnabled: $isLoginButtonEnabled, obscureText: $obscureText, onPageError: $onPageError, showLoginButtonLoading: $showLoginButtonLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLoginButtonEnabled, isLoginButtonEnabled) ||
                other.isLoginButtonEnabled == isLoginButtonEnabled) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.onPageError, onPageError) ||
                other.onPageError == onPageError) &&
            (identical(other.showLoginButtonLoading, showLoginButtonLoading) ||
                other.showLoginButtonLoading == showLoginButtonLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    password,
    isLoginButtonEnabled,
    obscureText,
    onPageError,
    showLoginButtonLoading,
  );

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  const factory _LoginState({
    final String email,
    final String password,
    final bool isLoginButtonEnabled,
    final bool obscureText,
    final String onPageError,
    final bool showLoginButtonLoading,
  }) = _$LoginStateImpl;
  const _LoginState._() : super._();

  @override
  String get email;
  @override
  String get password;
  @override
  bool get isLoginButtonEnabled;
  @override
  bool get obscureText;
  @override
  String get onPageError;
  @override
  bool get showLoginButtonLoading;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
