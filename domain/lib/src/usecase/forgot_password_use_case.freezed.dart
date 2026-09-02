// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ForgotPasswordInput {
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordInputCopyWith<ForgotPasswordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordInputCopyWith<$Res> {
  factory $ForgotPasswordInputCopyWith(
    ForgotPasswordInput value,
    $Res Function(ForgotPasswordInput) then,
  ) = _$ForgotPasswordInputCopyWithImpl<$Res, ForgotPasswordInput>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordInputCopyWithImpl<$Res, $Val extends ForgotPasswordInput>
    implements $ForgotPasswordInputCopyWith<$Res> {
  _$ForgotPasswordInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordInputImplCopyWith<$Res>
    implements $ForgotPasswordInputCopyWith<$Res> {
  factory _$$ForgotPasswordInputImplCopyWith(
    _$ForgotPasswordInputImpl value,
    $Res Function(_$ForgotPasswordInputImpl) then,
  ) = __$$ForgotPasswordInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordInputImplCopyWithImpl<$Res>
    extends _$ForgotPasswordInputCopyWithImpl<$Res, _$ForgotPasswordInputImpl>
    implements _$$ForgotPasswordInputImplCopyWith<$Res> {
  __$$ForgotPasswordInputImplCopyWithImpl(
    _$ForgotPasswordInputImpl _value,
    $Res Function(_$ForgotPasswordInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ForgotPasswordInputImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ForgotPasswordInputImpl extends _ForgotPasswordInput {
  const _$ForgotPasswordInputImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordInput(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordInputImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordInputImplCopyWith<_$ForgotPasswordInputImpl> get copyWith =>
      __$$ForgotPasswordInputImplCopyWithImpl<_$ForgotPasswordInputImpl>(
        this,
        _$identity,
      );
}

abstract class _ForgotPasswordInput extends ForgotPasswordInput {
  const factory _ForgotPasswordInput({required final String email}) =
      _$ForgotPasswordInputImpl;
  const _ForgotPasswordInput._() : super._();

  @override
  String get email;

  /// Create a copy of ForgotPasswordInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordInputImplCopyWith<_$ForgotPasswordInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordOutput {}

/// @nodoc
abstract class $ForgotPasswordOutputCopyWith<$Res> {
  factory $ForgotPasswordOutputCopyWith(
    ForgotPasswordOutput value,
    $Res Function(ForgotPasswordOutput) then,
  ) = _$ForgotPasswordOutputCopyWithImpl<$Res, ForgotPasswordOutput>;
}

/// @nodoc
class _$ForgotPasswordOutputCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordOutput
>
    implements $ForgotPasswordOutputCopyWith<$Res> {
  _$ForgotPasswordOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ForgotPasswordOutputImplCopyWith<$Res> {
  factory _$$ForgotPasswordOutputImplCopyWith(
    _$ForgotPasswordOutputImpl value,
    $Res Function(_$ForgotPasswordOutputImpl) then,
  ) = __$$ForgotPasswordOutputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForgotPasswordOutputImplCopyWithImpl<$Res>
    extends _$ForgotPasswordOutputCopyWithImpl<$Res, _$ForgotPasswordOutputImpl>
    implements _$$ForgotPasswordOutputImplCopyWith<$Res> {
  __$$ForgotPasswordOutputImplCopyWithImpl(
    _$ForgotPasswordOutputImpl _value,
    $Res Function(_$ForgotPasswordOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordOutput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ForgotPasswordOutputImpl extends _ForgotPasswordOutput {
  const _$ForgotPasswordOutputImpl() : super._();

  @override
  String toString() {
    return 'ForgotPasswordOutput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordOutputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ForgotPasswordOutput extends ForgotPasswordOutput {
  const factory _ForgotPasswordOutput() = _$ForgotPasswordOutputImpl;
  const _ForgotPasswordOutput._() : super._();
}
