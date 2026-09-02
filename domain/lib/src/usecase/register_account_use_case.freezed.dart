// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_account_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterAccountInput {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;

  /// Create a copy of RegisterAccountInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterAccountInputCopyWith<RegisterAccountInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterAccountInputCopyWith<$Res> {
  factory $RegisterAccountInputCopyWith(
    RegisterAccountInput value,
    $Res Function(RegisterAccountInput) then,
  ) = _$RegisterAccountInputCopyWithImpl<$Res, RegisterAccountInput>;
  @useResult
  $Res call({String username, String email, String password, Gender gender});
}

/// @nodoc
class _$RegisterAccountInputCopyWithImpl<
  $Res,
  $Val extends RegisterAccountInput
>
    implements $RegisterAccountInputCopyWith<$Res> {
  _$RegisterAccountInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterAccountInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
  }) {
    return _then(
      _value.copyWith(
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterAccountInputImplCopyWith<$Res>
    implements $RegisterAccountInputCopyWith<$Res> {
  factory _$$RegisterAccountInputImplCopyWith(
    _$RegisterAccountInputImpl value,
    $Res Function(_$RegisterAccountInputImpl) then,
  ) = __$$RegisterAccountInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String email, String password, Gender gender});
}

/// @nodoc
class __$$RegisterAccountInputImplCopyWithImpl<$Res>
    extends _$RegisterAccountInputCopyWithImpl<$Res, _$RegisterAccountInputImpl>
    implements _$$RegisterAccountInputImplCopyWith<$Res> {
  __$$RegisterAccountInputImplCopyWithImpl(
    _$RegisterAccountInputImpl _value,
    $Res Function(_$RegisterAccountInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterAccountInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
  }) {
    return _then(
      _$RegisterAccountInputImpl(
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender,
      ),
    );
  }
}

/// @nodoc

class _$RegisterAccountInputImpl extends _RegisterAccountInput {
  const _$RegisterAccountInputImpl({
    required this.username,
    required this.email,
    required this.password,
    required this.gender,
  }) : super._();

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final Gender gender;

  @override
  String toString() {
    return 'RegisterAccountInput(username: $username, email: $email, password: $password, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterAccountInputImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password, gender);

  /// Create a copy of RegisterAccountInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterAccountInputImplCopyWith<_$RegisterAccountInputImpl>
  get copyWith =>
      __$$RegisterAccountInputImplCopyWithImpl<_$RegisterAccountInputImpl>(
        this,
        _$identity,
      );
}

abstract class _RegisterAccountInput extends RegisterAccountInput {
  const factory _RegisterAccountInput({
    required final String username,
    required final String email,
    required final String password,
    required final Gender gender,
  }) = _$RegisterAccountInputImpl;
  const _RegisterAccountInput._() : super._();

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  Gender get gender;

  /// Create a copy of RegisterAccountInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterAccountInputImplCopyWith<_$RegisterAccountInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterAccountOutput {}

/// @nodoc
abstract class $RegisterAccountOutputCopyWith<$Res> {
  factory $RegisterAccountOutputCopyWith(
    RegisterAccountOutput value,
    $Res Function(RegisterAccountOutput) then,
  ) = _$RegisterAccountOutputCopyWithImpl<$Res, RegisterAccountOutput>;
}

/// @nodoc
class _$RegisterAccountOutputCopyWithImpl<
  $Res,
  $Val extends RegisterAccountOutput
>
    implements $RegisterAccountOutputCopyWith<$Res> {
  _$RegisterAccountOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterAccountOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RegisterAccountOutputImplCopyWith<$Res> {
  factory _$$RegisterAccountOutputImplCopyWith(
    _$RegisterAccountOutputImpl value,
    $Res Function(_$RegisterAccountOutputImpl) then,
  ) = __$$RegisterAccountOutputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterAccountOutputImplCopyWithImpl<$Res>
    extends
        _$RegisterAccountOutputCopyWithImpl<$Res, _$RegisterAccountOutputImpl>
    implements _$$RegisterAccountOutputImplCopyWith<$Res> {
  __$$RegisterAccountOutputImplCopyWithImpl(
    _$RegisterAccountOutputImpl _value,
    $Res Function(_$RegisterAccountOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterAccountOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterAccountOutputImpl extends _RegisterAccountOutput {
  const _$RegisterAccountOutputImpl() : super._();

  @override
  String toString() {
    return 'RegisterAccountOutput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterAccountOutputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _RegisterAccountOutput extends RegisterAccountOutput {
  const factory _RegisterAccountOutput() = _$RegisterAccountOutputImpl;
  const _RegisterAccountOutput._() : super._();
}
