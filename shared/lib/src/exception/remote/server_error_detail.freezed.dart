// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_error_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ServerErrorDetail {
  String? get detail => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  /// server-defined error code
  String? get serverErrorId => throw _privateConstructorUsedError;

  /// server-defined status code
  int? get serverStatusCode => throw _privateConstructorUsedError;

  /// server-defined message
  String? get message => throw _privateConstructorUsedError;

  /// server-defined field
  String? get field => throw _privateConstructorUsedError;

  /// Create a copy of ServerErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerErrorDetailCopyWith<ServerErrorDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerErrorDetailCopyWith<$Res> {
  factory $ServerErrorDetailCopyWith(
    ServerErrorDetail value,
    $Res Function(ServerErrorDetail) then,
  ) = _$ServerErrorDetailCopyWithImpl<$Res, ServerErrorDetail>;
  @useResult
  $Res call({
    String? detail,
    String? path,
    String? serverErrorId,
    int? serverStatusCode,
    String? message,
    String? field,
  });
}

/// @nodoc
class _$ServerErrorDetailCopyWithImpl<$Res, $Val extends ServerErrorDetail>
    implements $ServerErrorDetailCopyWith<$Res> {
  _$ServerErrorDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = freezed,
    Object? path = freezed,
    Object? serverErrorId = freezed,
    Object? serverStatusCode = freezed,
    Object? message = freezed,
    Object? field = freezed,
  }) {
    return _then(
      _value.copyWith(
            detail: freezed == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as String?,
            path: freezed == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String?,
            serverErrorId: freezed == serverErrorId
                ? _value.serverErrorId
                : serverErrorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            serverStatusCode: freezed == serverStatusCode
                ? _value.serverStatusCode
                : serverStatusCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            field: freezed == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServerErrorDetailImplCopyWith<$Res>
    implements $ServerErrorDetailCopyWith<$Res> {
  factory _$$ServerErrorDetailImplCopyWith(
    _$ServerErrorDetailImpl value,
    $Res Function(_$ServerErrorDetailImpl) then,
  ) = __$$ServerErrorDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? detail,
    String? path,
    String? serverErrorId,
    int? serverStatusCode,
    String? message,
    String? field,
  });
}

/// @nodoc
class __$$ServerErrorDetailImplCopyWithImpl<$Res>
    extends _$ServerErrorDetailCopyWithImpl<$Res, _$ServerErrorDetailImpl>
    implements _$$ServerErrorDetailImplCopyWith<$Res> {
  __$$ServerErrorDetailImplCopyWithImpl(
    _$ServerErrorDetailImpl _value,
    $Res Function(_$ServerErrorDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = freezed,
    Object? path = freezed,
    Object? serverErrorId = freezed,
    Object? serverStatusCode = freezed,
    Object? message = freezed,
    Object? field = freezed,
  }) {
    return _then(
      _$ServerErrorDetailImpl(
        detail: freezed == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as String?,
        path: freezed == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String?,
        serverErrorId: freezed == serverErrorId
            ? _value.serverErrorId
            : serverErrorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        serverStatusCode: freezed == serverStatusCode
            ? _value.serverStatusCode
            : serverStatusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        field: freezed == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ServerErrorDetailImpl extends _ServerErrorDetail {
  const _$ServerErrorDetailImpl({
    this.detail,
    this.path,
    this.serverErrorId,
    this.serverStatusCode,
    this.message,
    this.field,
  }) : super._();

  @override
  final String? detail;
  @override
  final String? path;

  /// server-defined error code
  @override
  final String? serverErrorId;

  /// server-defined status code
  @override
  final int? serverStatusCode;

  /// server-defined message
  @override
  final String? message;

  /// server-defined field
  @override
  final String? field;

  @override
  String toString() {
    return 'ServerErrorDetail(detail: $detail, path: $path, serverErrorId: $serverErrorId, serverStatusCode: $serverStatusCode, message: $message, field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorDetailImpl &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.serverErrorId, serverErrorId) ||
                other.serverErrorId == serverErrorId) &&
            (identical(other.serverStatusCode, serverStatusCode) ||
                other.serverStatusCode == serverStatusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    detail,
    path,
    serverErrorId,
    serverStatusCode,
    message,
    field,
  );

  /// Create a copy of ServerErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorDetailImplCopyWith<_$ServerErrorDetailImpl> get copyWith =>
      __$$ServerErrorDetailImplCopyWithImpl<_$ServerErrorDetailImpl>(
        this,
        _$identity,
      );
}

abstract class _ServerErrorDetail extends ServerErrorDetail {
  const factory _ServerErrorDetail({
    final String? detail,
    final String? path,
    final String? serverErrorId,
    final int? serverStatusCode,
    final String? message,
    final String? field,
  }) = _$ServerErrorDetailImpl;
  const _ServerErrorDetail._() : super._();

  @override
  String? get detail;
  @override
  String? get path;

  /// server-defined error code
  @override
  String? get serverErrorId;

  /// server-defined status code
  @override
  int? get serverStatusCode;

  /// server-defined message
  @override
  String? get message;

  /// server-defined field
  @override
  String? get field;

  /// Create a copy of ServerErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorDetailImplCopyWith<_$ServerErrorDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
