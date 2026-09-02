// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginInput {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of LoginInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginInputCopyWith<LoginInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInputCopyWith<$Res> {
  factory $LoginInputCopyWith(
    LoginInput value,
    $Res Function(LoginInput) then,
  ) = _$LoginInputCopyWithImpl<$Res, LoginInput>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginInputCopyWithImpl<$Res, $Val extends LoginInput>
    implements $LoginInputCopyWith<$Res> {
  _$LoginInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginInputImplCopyWith<$Res>
    implements $LoginInputCopyWith<$Res> {
  factory _$$LoginInputImplCopyWith(
    _$LoginInputImpl value,
    $Res Function(_$LoginInputImpl) then,
  ) = __$$LoginInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginInputImplCopyWithImpl<$Res>
    extends _$LoginInputCopyWithImpl<$Res, _$LoginInputImpl>
    implements _$$LoginInputImplCopyWith<$Res> {
  __$$LoginInputImplCopyWithImpl(
    _$LoginInputImpl _value,
    $Res Function(_$LoginInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginInputImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginInputImpl extends _LoginInput {
  const _$LoginInputImpl({required this.email, required this.password})
    : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginInput(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginInputImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginInputImplCopyWith<_$LoginInputImpl> get copyWith =>
      __$$LoginInputImplCopyWithImpl<_$LoginInputImpl>(this, _$identity);
}

abstract class _LoginInput extends LoginInput {
  const factory _LoginInput({
    required final String email,
    required final String password,
  }) = _$LoginInputImpl;
  const _LoginInput._() : super._();

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginInputImplCopyWith<_$LoginInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginOutput {}

/// @nodoc
abstract class $LoginOutputCopyWith<$Res> {
  factory $LoginOutputCopyWith(
    LoginOutput value,
    $Res Function(LoginOutput) then,
  ) = _$LoginOutputCopyWithImpl<$Res, LoginOutput>;
}

/// @nodoc
class _$LoginOutputCopyWithImpl<$Res, $Val extends LoginOutput>
    implements $LoginOutputCopyWith<$Res> {
  _$LoginOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginOutputImplCopyWith<$Res> {
  factory _$$LoginOutputImplCopyWith(
    _$LoginOutputImpl value,
    $Res Function(_$LoginOutputImpl) then,
  ) = __$$LoginOutputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginOutputImplCopyWithImpl<$Res>
    extends _$LoginOutputCopyWithImpl<$Res, _$LoginOutputImpl>
    implements _$$LoginOutputImplCopyWith<$Res> {
  __$$LoginOutputImplCopyWithImpl(
    _$LoginOutputImpl _value,
    $Res Function(_$LoginOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginOutputImpl extends _LoginOutput {
  const _$LoginOutputImpl() : super._();

  @override
  String toString() {
    return 'LoginOutput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginOutputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _LoginOutput extends LoginOutput {
  const factory _LoginOutput() = _$LoginOutputImpl;
  const _LoginOutput._() : super._();
}
