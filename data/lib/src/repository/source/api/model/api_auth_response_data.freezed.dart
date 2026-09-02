// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_auth_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiAuthResponseData _$ApiAuthResponseDataFromJson(Map<String, dynamic> json) {
  return _ApiAuthResponseData.fromJson(json);
}

/// @nodoc
mixin _$ApiAuthResponseData {
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_range')
  String? get ageRange => throw _privateConstructorUsedError;

  /// Serializes this ApiAuthResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiAuthResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiAuthResponseDataCopyWith<ApiAuthResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiAuthResponseDataCopyWith<$Res> {
  factory $ApiAuthResponseDataCopyWith(
    ApiAuthResponseData value,
    $Res Function(ApiAuthResponseData) then,
  ) = _$ApiAuthResponseDataCopyWithImpl<$Res, ApiAuthResponseData>;
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'age_range') String? ageRange,
  });
}

/// @nodoc
class _$ApiAuthResponseDataCopyWithImpl<$Res, $Val extends ApiAuthResponseData>
    implements $ApiAuthResponseDataCopyWith<$Res> {
  _$ApiAuthResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiAuthResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? id = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? ageRange = freezed,
  }) {
    return _then(
      _value.copyWith(
            accessToken: freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            ageRange: freezed == ageRange
                ? _value.ageRange
                : ageRange // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiAuthResponseDataImplCopyWith<$Res>
    implements $ApiAuthResponseDataCopyWith<$Res> {
  factory _$$ApiAuthResponseDataImplCopyWith(
    _$ApiAuthResponseDataImpl value,
    $Res Function(_$ApiAuthResponseDataImpl) then,
  ) = __$$ApiAuthResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'age_range') String? ageRange,
  });
}

/// @nodoc
class __$$ApiAuthResponseDataImplCopyWithImpl<$Res>
    extends _$ApiAuthResponseDataCopyWithImpl<$Res, _$ApiAuthResponseDataImpl>
    implements _$$ApiAuthResponseDataImplCopyWith<$Res> {
  __$$ApiAuthResponseDataImplCopyWithImpl(
    _$ApiAuthResponseDataImpl _value,
    $Res Function(_$ApiAuthResponseDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiAuthResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? id = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? ageRange = freezed,
  }) {
    return _then(
      _$ApiAuthResponseDataImpl(
        accessToken: freezed == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        ageRange: freezed == ageRange
            ? _value.ageRange
            : ageRange // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiAuthResponseDataImpl extends _ApiAuthResponseData {
  const _$ApiAuthResponseDataImpl({
    @JsonKey(name: 'access_token') this.accessToken,
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'email') this.email,
    @JsonKey(name: 'username') this.username,
    @JsonKey(name: 'name') this.name,
    @JsonKey(name: 'gender') this.gender,
    @JsonKey(name: 'age_range') this.ageRange,
  }) : super._();

  factory _$ApiAuthResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiAuthResponseDataImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'age_range')
  final String? ageRange;

  @override
  String toString() {
    return 'ApiAuthResponseData(accessToken: $accessToken, id: $id, email: $email, username: $username, name: $name, gender: $gender, ageRange: $ageRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiAuthResponseDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.ageRange, ageRange) ||
                other.ageRange == ageRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accessToken,
    id,
    email,
    username,
    name,
    gender,
    ageRange,
  );

  /// Create a copy of ApiAuthResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiAuthResponseDataImplCopyWith<_$ApiAuthResponseDataImpl> get copyWith =>
      __$$ApiAuthResponseDataImplCopyWithImpl<_$ApiAuthResponseDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiAuthResponseDataImplToJson(this);
  }
}

abstract class _ApiAuthResponseData extends ApiAuthResponseData {
  const factory _ApiAuthResponseData({
    @JsonKey(name: 'access_token') final String? accessToken,
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'email') final String? email,
    @JsonKey(name: 'username') final String? username,
    @JsonKey(name: 'name') final String? name,
    @JsonKey(name: 'gender') final String? gender,
    @JsonKey(name: 'age_range') final String? ageRange,
  }) = _$ApiAuthResponseDataImpl;
  const _ApiAuthResponseData._() : super._();

  factory _ApiAuthResponseData.fromJson(Map<String, dynamic> json) =
      _$ApiAuthResponseDataImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'age_range')
  String? get ageRange;

  /// Create a copy of ApiAuthResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiAuthResponseDataImplCopyWith<_$ApiAuthResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
