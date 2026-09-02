// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiUserData _$ApiUserDataFromJson(Map<String, dynamic> json) {
  return _ApiUserData.fromJson(json);
}

/// @nodoc
mixin _$ApiUserData {
  @JsonKey(name: 'uid')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthday')
  String? get birthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'money')
  String? get money => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  ApiImageUrlData? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'photos')
  List<ApiImageUrlData>? get photos => throw _privateConstructorUsedError;
  @JsonKey(name: 'sex')
  int? get gender => throw _privateConstructorUsedError;

  /// Serializes this ApiUserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiUserDataCopyWith<ApiUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiUserDataCopyWith<$Res> {
  factory $ApiUserDataCopyWith(
    ApiUserData value,
    $Res Function(ApiUserData) then,
  ) = _$ApiUserDataCopyWithImpl<$Res, ApiUserData>;
  @useResult
  $Res call({
    @JsonKey(name: 'uid') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'birthday') String? birthday,
    @JsonKey(name: 'money') String? money,
    @JsonKey(name: 'avatar') ApiImageUrlData? avatar,
    @JsonKey(name: 'photos') List<ApiImageUrlData>? photos,
    @JsonKey(name: 'sex') int? gender,
  });

  $ApiImageUrlDataCopyWith<$Res>? get avatar;
}

/// @nodoc
class _$ApiUserDataCopyWithImpl<$Res, $Val extends ApiUserData>
    implements $ApiUserDataCopyWith<$Res> {
  _$ApiUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? birthday = freezed,
    Object? money = freezed,
    Object? avatar = freezed,
    Object? photos = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            birthday: freezed == birthday
                ? _value.birthday
                : birthday // ignore: cast_nullable_to_non_nullable
                      as String?,
            money: freezed == money
                ? _value.money
                : money // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as ApiImageUrlData?,
            photos: freezed == photos
                ? _value.photos
                : photos // ignore: cast_nullable_to_non_nullable
                      as List<ApiImageUrlData>?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of ApiUserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiImageUrlDataCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $ApiImageUrlDataCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiUserDataImplCopyWith<$Res>
    implements $ApiUserDataCopyWith<$Res> {
  factory _$$ApiUserDataImplCopyWith(
    _$ApiUserDataImpl value,
    $Res Function(_$ApiUserDataImpl) then,
  ) = __$$ApiUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'uid') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'birthday') String? birthday,
    @JsonKey(name: 'money') String? money,
    @JsonKey(name: 'avatar') ApiImageUrlData? avatar,
    @JsonKey(name: 'photos') List<ApiImageUrlData>? photos,
    @JsonKey(name: 'sex') int? gender,
  });

  @override
  $ApiImageUrlDataCopyWith<$Res>? get avatar;
}

/// @nodoc
class __$$ApiUserDataImplCopyWithImpl<$Res>
    extends _$ApiUserDataCopyWithImpl<$Res, _$ApiUserDataImpl>
    implements _$$ApiUserDataImplCopyWith<$Res> {
  __$$ApiUserDataImplCopyWithImpl(
    _$ApiUserDataImpl _value,
    $Res Function(_$ApiUserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? birthday = freezed,
    Object? money = freezed,
    Object? avatar = freezed,
    Object? photos = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$ApiUserDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        birthday: freezed == birthday
            ? _value.birthday
            : birthday // ignore: cast_nullable_to_non_nullable
                  as String?,
        money: freezed == money
            ? _value.money
            : money // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as ApiImageUrlData?,
        photos: freezed == photos
            ? _value._photos
            : photos // ignore: cast_nullable_to_non_nullable
                  as List<ApiImageUrlData>?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiUserDataImpl extends _ApiUserData {
  const _$ApiUserDataImpl({
    @JsonKey(name: 'uid') this.id,
    @JsonKey(name: 'email') this.email,
    @JsonKey(name: 'birthday') this.birthday,
    @JsonKey(name: 'money') this.money,
    @JsonKey(name: 'avatar') this.avatar,
    @JsonKey(name: 'photos') final List<ApiImageUrlData>? photos,
    @JsonKey(name: 'sex') this.gender,
  }) : _photos = photos,
       super._();

  factory _$ApiUserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiUserDataImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final int? id;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'birthday')
  final String? birthday;
  @override
  @JsonKey(name: 'money')
  final String? money;
  @override
  @JsonKey(name: 'avatar')
  final ApiImageUrlData? avatar;
  final List<ApiImageUrlData>? _photos;
  @override
  @JsonKey(name: 'photos')
  List<ApiImageUrlData>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'sex')
  final int? gender;

  @override
  String toString() {
    return 'ApiUserData(id: $id, email: $email, birthday: $birthday, money: $money, avatar: $avatar, photos: $photos, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiUserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    birthday,
    money,
    avatar,
    const DeepCollectionEquality().hash(_photos),
    gender,
  );

  /// Create a copy of ApiUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiUserDataImplCopyWith<_$ApiUserDataImpl> get copyWith =>
      __$$ApiUserDataImplCopyWithImpl<_$ApiUserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiUserDataImplToJson(this);
  }
}

abstract class _ApiUserData extends ApiUserData {
  const factory _ApiUserData({
    @JsonKey(name: 'uid') final int? id,
    @JsonKey(name: 'email') final String? email,
    @JsonKey(name: 'birthday') final String? birthday,
    @JsonKey(name: 'money') final String? money,
    @JsonKey(name: 'avatar') final ApiImageUrlData? avatar,
    @JsonKey(name: 'photos') final List<ApiImageUrlData>? photos,
    @JsonKey(name: 'sex') final int? gender,
  }) = _$ApiUserDataImpl;
  const _ApiUserData._() : super._();

  factory _ApiUserData.fromJson(Map<String, dynamic> json) =
      _$ApiUserDataImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  int? get id;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'birthday')
  String? get birthday;
  @override
  @JsonKey(name: 'money')
  String? get money;
  @override
  @JsonKey(name: 'avatar')
  ApiImageUrlData? get avatar;
  @override
  @JsonKey(name: 'photos')
  List<ApiImageUrlData>? get photos;
  @override
  @JsonKey(name: 'sex')
  int? get gender;

  /// Create a copy of ApiUserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiUserDataImplCopyWith<_$ApiUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
