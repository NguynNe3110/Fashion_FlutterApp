// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResetPasswordInput {
  String get token => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordInputCopyWith<ResetPasswordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordInputCopyWith<$Res> {
  factory $ResetPasswordInputCopyWith(
    ResetPasswordInput value,
    $Res Function(ResetPasswordInput) then,
  ) = _$ResetPasswordInputCopyWithImpl<$Res, ResetPasswordInput>;
  @useResult
  $Res call({
    String token,
    String email,
    String password,
    String confirmPassword,
  });
}

/// @nodoc
class _$ResetPasswordInputCopyWithImpl<$Res, $Val extends ResetPasswordInput>
    implements $ResetPasswordInputCopyWith<$Res> {
  _$ResetPasswordInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            confirmPassword: null == confirmPassword
                ? _value.confirmPassword
                : confirmPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPasswordInputImplCopyWith<$Res>
    implements $ResetPasswordInputCopyWith<$Res> {
  factory _$$ResetPasswordInputImplCopyWith(
    _$ResetPasswordInputImpl value,
    $Res Function(_$ResetPasswordInputImpl) then,
  ) = __$$ResetPasswordInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String token,
    String email,
    String password,
    String confirmPassword,
  });
}

/// @nodoc
class __$$ResetPasswordInputImplCopyWithImpl<$Res>
    extends _$ResetPasswordInputCopyWithImpl<$Res, _$ResetPasswordInputImpl>
    implements _$$ResetPasswordInputImplCopyWith<$Res> {
  __$$ResetPasswordInputImplCopyWithImpl(
    _$ResetPasswordInputImpl _value,
    $Res Function(_$ResetPasswordInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _$ResetPasswordInputImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        confirmPassword: null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetPasswordInputImpl extends _ResetPasswordInput {
  const _$ResetPasswordInputImpl({
    required this.token,
    required this.email,
    required this.password,
    required this.confirmPassword,
  }) : super._();

  @override
  final String token;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ResetPasswordInput(token: $token, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordInputImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, token, email, password, confirmPassword);

  /// Create a copy of ResetPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordInputImplCopyWith<_$ResetPasswordInputImpl> get copyWith =>
      __$$ResetPasswordInputImplCopyWithImpl<_$ResetPasswordInputImpl>(
        this,
        _$identity,
      );
}

abstract class _ResetPasswordInput extends ResetPasswordInput {
  const factory _ResetPasswordInput({
    required final String token,
    required final String email,
    required final String password,
    required final String confirmPassword,
  }) = _$ResetPasswordInputImpl;
  const _ResetPasswordInput._() : super._();

  @override
  String get token;
  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;

  /// Create a copy of ResetPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordInputImplCopyWith<_$ResetPasswordInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResetPasswordOutput {}

/// @nodoc
abstract class $ResetPasswordOutputCopyWith<$Res> {
  factory $ResetPasswordOutputCopyWith(
    ResetPasswordOutput value,
    $Res Function(ResetPasswordOutput) then,
  ) = _$ResetPasswordOutputCopyWithImpl<$Res, ResetPasswordOutput>;
}

/// @nodoc
class _$ResetPasswordOutputCopyWithImpl<$Res, $Val extends ResetPasswordOutput>
    implements $ResetPasswordOutputCopyWith<$Res> {
  _$ResetPasswordOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResetPasswordOutputImplCopyWith<$Res> {
  factory _$$ResetPasswordOutputImplCopyWith(
    _$ResetPasswordOutputImpl value,
    $Res Function(_$ResetPasswordOutputImpl) then,
  ) = __$$ResetPasswordOutputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetPasswordOutputImplCopyWithImpl<$Res>
    extends _$ResetPasswordOutputCopyWithImpl<$Res, _$ResetPasswordOutputImpl>
    implements _$$ResetPasswordOutputImplCopyWith<$Res> {
  __$$ResetPasswordOutputImplCopyWithImpl(
    _$ResetPasswordOutputImpl _value,
    $Res Function(_$ResetPasswordOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetPasswordOutputImpl extends _ResetPasswordOutput {
  const _$ResetPasswordOutputImpl() : super._();

  @override
  String toString() {
    return 'ResetPasswordOutput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordOutputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ResetPasswordOutput extends ResetPasswordOutput {
  const factory _ResetPasswordOutput() = _$ResetPasswordOutputImpl;
  const _ResetPasswordOutput._() : super._();
}
