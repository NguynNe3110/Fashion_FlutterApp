// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_refresh_token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiRefreshTokenData _$ApiRefreshTokenDataFromJson(Map<String, dynamic> json) {
  return _ApiRefreshTokenData.fromJson(json);
}

/// @nodoc
mixin _$ApiRefreshTokenData {
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;

  /// Serializes this ApiRefreshTokenData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiRefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiRefreshTokenDataCopyWith<ApiRefreshTokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiRefreshTokenDataCopyWith<$Res> {
  factory $ApiRefreshTokenDataCopyWith(
    ApiRefreshTokenData value,
    $Res Function(ApiRefreshTokenData) then,
  ) = _$ApiRefreshTokenDataCopyWithImpl<$Res, ApiRefreshTokenData>;
  @useResult
  $Res call({@JsonKey(name: 'access_token') String? accessToken});
}

/// @nodoc
class _$ApiRefreshTokenDataCopyWithImpl<$Res, $Val extends ApiRefreshTokenData>
    implements $ApiRefreshTokenDataCopyWith<$Res> {
  _$ApiRefreshTokenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiRefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = freezed}) {
    return _then(
      _value.copyWith(
            accessToken: freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiRefreshTokenDataImplCopyWith<$Res>
    implements $ApiRefreshTokenDataCopyWith<$Res> {
  factory _$$ApiRefreshTokenDataImplCopyWith(
    _$ApiRefreshTokenDataImpl value,
    $Res Function(_$ApiRefreshTokenDataImpl) then,
  ) = __$$ApiRefreshTokenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'access_token') String? accessToken});
}

/// @nodoc
class __$$ApiRefreshTokenDataImplCopyWithImpl<$Res>
    extends _$ApiRefreshTokenDataCopyWithImpl<$Res, _$ApiRefreshTokenDataImpl>
    implements _$$ApiRefreshTokenDataImplCopyWith<$Res> {
  __$$ApiRefreshTokenDataImplCopyWithImpl(
    _$ApiRefreshTokenDataImpl _value,
    $Res Function(_$ApiRefreshTokenDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiRefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = freezed}) {
    return _then(
      _$ApiRefreshTokenDataImpl(
        accessToken: freezed == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiRefreshTokenDataImpl extends _ApiRefreshTokenData {
  const _$ApiRefreshTokenDataImpl({
    @JsonKey(name: 'access_token') this.accessToken,
  }) : super._();

  factory _$ApiRefreshTokenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiRefreshTokenDataImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;

  @override
  String toString() {
    return 'ApiRefreshTokenData(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiRefreshTokenDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  /// Create a copy of ApiRefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiRefreshTokenDataImplCopyWith<_$ApiRefreshTokenDataImpl> get copyWith =>
      __$$ApiRefreshTokenDataImplCopyWithImpl<_$ApiRefreshTokenDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiRefreshTokenDataImplToJson(this);
  }
}

abstract class _ApiRefreshTokenData extends ApiRefreshTokenData {
  const factory _ApiRefreshTokenData({
    @JsonKey(name: 'access_token') final String? accessToken,
  }) = _$ApiRefreshTokenDataImpl;
  const _ApiRefreshTokenData._() : super._();

  factory _ApiRefreshTokenData.fromJson(Map<String, dynamic> json) =
      _$ApiRefreshTokenDataImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;

  /// Create a copy of ApiRefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiRefreshTokenDataImplCopyWith<_$ApiRefreshTokenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
