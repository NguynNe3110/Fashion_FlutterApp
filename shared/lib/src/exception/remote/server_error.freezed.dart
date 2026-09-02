// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ServerError {
  /// server-defined status code
  int? get generalServerStatusCode => throw _privateConstructorUsedError;

  /// server-defined error id
  String? get generalServerErrorId => throw _privateConstructorUsedError;

  /// server-defined message
  String? get generalMessage => throw _privateConstructorUsedError;
  List<ServerErrorDetail> get errors => throw _privateConstructorUsedError;

  /// Create a copy of ServerError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerErrorCopyWith<ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
    ServerError value,
    $Res Function(ServerError) then,
  ) = _$ServerErrorCopyWithImpl<$Res, ServerError>;
  @useResult
  $Res call({
    int? generalServerStatusCode,
    String? generalServerErrorId,
    String? generalMessage,
    List<ServerErrorDetail> errors,
  });
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res, $Val extends ServerError>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalServerStatusCode = freezed,
    Object? generalServerErrorId = freezed,
    Object? generalMessage = freezed,
    Object? errors = null,
  }) {
    return _then(
      _value.copyWith(
            generalServerStatusCode: freezed == generalServerStatusCode
                ? _value.generalServerStatusCode
                : generalServerStatusCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            generalServerErrorId: freezed == generalServerErrorId
                ? _value.generalServerErrorId
                : generalServerErrorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            generalMessage: freezed == generalMessage
                ? _value.generalMessage
                : generalMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            errors: null == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<ServerErrorDetail>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $ServerErrorCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
    _$ServerErrorImpl value,
    $Res Function(_$ServerErrorImpl) then,
  ) = __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? generalServerStatusCode,
    String? generalServerErrorId,
    String? generalMessage,
    List<ServerErrorDetail> errors,
  });
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$ServerErrorCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
    _$ServerErrorImpl _value,
    $Res Function(_$ServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalServerStatusCode = freezed,
    Object? generalServerErrorId = freezed,
    Object? generalMessage = freezed,
    Object? errors = null,
  }) {
    return _then(
      _$ServerErrorImpl(
        generalServerStatusCode: freezed == generalServerStatusCode
            ? _value.generalServerStatusCode
            : generalServerStatusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        generalServerErrorId: freezed == generalServerErrorId
            ? _value.generalServerErrorId
            : generalServerErrorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        generalMessage: freezed == generalMessage
            ? _value.generalMessage
            : generalMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        errors: null == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<ServerErrorDetail>,
      ),
    );
  }
}

/// @nodoc

class _$ServerErrorImpl extends _ServerError {
  const _$ServerErrorImpl({
    this.generalServerStatusCode,
    this.generalServerErrorId,
    this.generalMessage,
    final List<ServerErrorDetail> errors = ServerError.defaultErrors,
  }) : _errors = errors,
       super._();

  /// server-defined status code
  @override
  final int? generalServerStatusCode;

  /// server-defined error id
  @override
  final String? generalServerErrorId;

  /// server-defined message
  @override
  final String? generalMessage;
  final List<ServerErrorDetail> _errors;
  @override
  @JsonKey()
  List<ServerErrorDetail> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'ServerError(generalServerStatusCode: $generalServerStatusCode, generalServerErrorId: $generalServerErrorId, generalMessage: $generalMessage, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(
                  other.generalServerStatusCode,
                  generalServerStatusCode,
                ) ||
                other.generalServerStatusCode == generalServerStatusCode) &&
            (identical(other.generalServerErrorId, generalServerErrorId) ||
                other.generalServerErrorId == generalServerErrorId) &&
            (identical(other.generalMessage, generalMessage) ||
                other.generalMessage == generalMessage) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    generalServerStatusCode,
    generalServerErrorId,
    generalMessage,
    const DeepCollectionEquality().hash(_errors),
  );

  /// Create a copy of ServerError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);
}

abstract class _ServerError extends ServerError {
  const factory _ServerError({
    final int? generalServerStatusCode,
    final String? generalServerErrorId,
    final String? generalMessage,
    final List<ServerErrorDetail> errors,
  }) = _$ServerErrorImpl;
  const _ServerError._() : super._();

  /// server-defined status code
  @override
  int? get generalServerStatusCode;

  /// server-defined error id
  @override
  String? get generalServerErrorId;

  /// server-defined message
  @override
  String? get generalMessage;
  @override
  List<ServerErrorDetail> get errors;

  /// Create a copy of ServerError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
