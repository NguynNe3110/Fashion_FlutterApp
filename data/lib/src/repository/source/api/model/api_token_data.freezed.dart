// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiTokenData _$ApiTokenDataFromJson(Map<String, dynamic> json) {
  return _ApiTokenData.fromJson(json);
}

/// @nodoc
mixin _$ApiTokenData {
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this ApiTokenData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiTokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiTokenDataCopyWith<ApiTokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiTokenDataCopyWith<$Res> {
  factory $ApiTokenDataCopyWith(
    ApiTokenData value,
    $Res Function(ApiTokenData) then,
  ) = _$ApiTokenDataCopyWithImpl<$Res, ApiTokenData>;
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  });
}

/// @nodoc
class _$ApiTokenDataCopyWithImpl<$Res, $Val extends ApiTokenData>
    implements $ApiTokenDataCopyWith<$Res> {
  _$ApiTokenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiTokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = freezed, Object? refreshToken = freezed}) {
    return _then(
      _value.copyWith(
            accessToken: freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            refreshToken: freezed == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiTokenDataImplCopyWith<$Res>
    implements $ApiTokenDataCopyWith<$Res> {
  factory _$$ApiTokenDataImplCopyWith(
    _$ApiTokenDataImpl value,
    $Res Function(_$ApiTokenDataImpl) then,
  ) = __$$ApiTokenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  });
}

/// @nodoc
class __$$ApiTokenDataImplCopyWithImpl<$Res>
    extends _$ApiTokenDataCopyWithImpl<$Res, _$ApiTokenDataImpl>
    implements _$$ApiTokenDataImplCopyWith<$Res> {
  __$$ApiTokenDataImplCopyWithImpl(
    _$ApiTokenDataImpl _value,
    $Res Function(_$ApiTokenDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiTokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = freezed, Object? refreshToken = freezed}) {
    return _then(
      _$ApiTokenDataImpl(
        accessToken: freezed == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        refreshToken: freezed == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiTokenDataImpl extends _ApiTokenData {
  const _$ApiTokenDataImpl({
    @JsonKey(name: 'access_token') this.accessToken,
    @JsonKey(name: 'refresh_token') this.refreshToken,
  }) : super._();

  factory _$ApiTokenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiTokenDataImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @override
  String toString() {
    return 'ApiTokenData(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiTokenDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of ApiTokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiTokenDataImplCopyWith<_$ApiTokenDataImpl> get copyWith =>
      __$$ApiTokenDataImplCopyWithImpl<_$ApiTokenDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiTokenDataImplToJson(this);
  }
}

abstract class _ApiTokenData extends ApiTokenData {
  const factory _ApiTokenData({
    @JsonKey(name: 'access_token') final String? accessToken,
    @JsonKey(name: 'refresh_token') final String? refreshToken,
  }) = _$ApiTokenDataImpl;
  const _ApiTokenData._() : super._();

  factory _ApiTokenData.fromJson(Map<String, dynamic> json) =
      _$ApiTokenDataImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;

  /// Create a copy of ApiTokenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiTokenDataImplCopyWith<_$ApiTokenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
