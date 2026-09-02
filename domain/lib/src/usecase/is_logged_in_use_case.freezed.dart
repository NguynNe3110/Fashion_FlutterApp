// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_logged_in_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$IsLoggedInInput {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(TResult Function() $default) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_IsLoggedInInput value) $default,
  ) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsLoggedInInputCopyWith<$Res> {
  factory $IsLoggedInInputCopyWith(
    IsLoggedInInput value,
    $Res Function(IsLoggedInInput) then,
  ) = _$IsLoggedInInputCopyWithImpl<$Res, IsLoggedInInput>;
}

/// @nodoc
class _$IsLoggedInInputCopyWithImpl<$Res, $Val extends IsLoggedInInput>
    implements $IsLoggedInInputCopyWith<$Res> {
  _$IsLoggedInInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IsLoggedInInput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IsLoggedInInputImplCopyWith<$Res> {
  factory _$$IsLoggedInInputImplCopyWith(
    _$IsLoggedInInputImpl value,
    $Res Function(_$IsLoggedInInputImpl) then,
  ) = __$$IsLoggedInInputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoggedInInputImplCopyWithImpl<$Res>
    extends _$IsLoggedInInputCopyWithImpl<$Res, _$IsLoggedInInputImpl>
    implements _$$IsLoggedInInputImplCopyWith<$Res> {
  __$$IsLoggedInInputImplCopyWithImpl(
    _$IsLoggedInInputImpl _value,
    $Res Function(_$IsLoggedInInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IsLoggedInInput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsLoggedInInputImpl extends _IsLoggedInInput {
  const _$IsLoggedInInputImpl() : super._();

  @override
  String toString() {
    return 'IsLoggedInInput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsLoggedInInputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(TResult Function() $default) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_IsLoggedInInput value) $default,
  ) {
    return $default(this);
  }
}

abstract class _IsLoggedInInput extends IsLoggedInInput {
  const factory _IsLoggedInInput() = _$IsLoggedInInputImpl;
  const _IsLoggedInInput._() : super._();
}

/// @nodoc
mixin _$IsLoggedInOutput {
  bool get isLoggedIn => throw _privateConstructorUsedError;

  /// Create a copy of IsLoggedInOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IsLoggedInOutputCopyWith<IsLoggedInOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsLoggedInOutputCopyWith<$Res> {
  factory $IsLoggedInOutputCopyWith(
    IsLoggedInOutput value,
    $Res Function(IsLoggedInOutput) then,
  ) = _$IsLoggedInOutputCopyWithImpl<$Res, IsLoggedInOutput>;
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class _$IsLoggedInOutputCopyWithImpl<$Res, $Val extends IsLoggedInOutput>
    implements $IsLoggedInOutputCopyWith<$Res> {
  _$IsLoggedInOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IsLoggedInOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoggedIn = null}) {
    return _then(
      _value.copyWith(
            isLoggedIn: null == isLoggedIn
                ? _value.isLoggedIn
                : isLoggedIn // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IsLoggedInOutputImplCopyWith<$Res>
    implements $IsLoggedInOutputCopyWith<$Res> {
  factory _$$IsLoggedInOutputImplCopyWith(
    _$IsLoggedInOutputImpl value,
    $Res Function(_$IsLoggedInOutputImpl) then,
  ) = __$$IsLoggedInOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class __$$IsLoggedInOutputImplCopyWithImpl<$Res>
    extends _$IsLoggedInOutputCopyWithImpl<$Res, _$IsLoggedInOutputImpl>
    implements _$$IsLoggedInOutputImplCopyWith<$Res> {
  __$$IsLoggedInOutputImplCopyWithImpl(
    _$IsLoggedInOutputImpl _value,
    $Res Function(_$IsLoggedInOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IsLoggedInOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoggedIn = null}) {
    return _then(
      _$IsLoggedInOutputImpl(
        isLoggedIn: null == isLoggedIn
            ? _value.isLoggedIn
            : isLoggedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$IsLoggedInOutputImpl extends _IsLoggedInOutput {
  const _$IsLoggedInOutputImpl({this.isLoggedIn = false}) : super._();

  @override
  @JsonKey()
  final bool isLoggedIn;

  @override
  String toString() {
    return 'IsLoggedInOutput(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoggedInOutputImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn);

  /// Create a copy of IsLoggedInOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoggedInOutputImplCopyWith<_$IsLoggedInOutputImpl> get copyWith =>
      __$$IsLoggedInOutputImplCopyWithImpl<_$IsLoggedInOutputImpl>(
        this,
        _$identity,
      );
}

abstract class _IsLoggedInOutput extends IsLoggedInOutput {
  const factory _IsLoggedInOutput({final bool isLoggedIn}) =
      _$IsLoggedInOutputImpl;
  const _IsLoggedInOutput._() : super._();

  @override
  bool get isLoggedIn;

  /// Create a copy of IsLoggedInOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsLoggedInOutputImplCopyWith<_$IsLoggedInOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
