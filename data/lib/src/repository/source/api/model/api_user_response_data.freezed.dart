// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_user_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiUserResponseData _$ApiUserResponseDataFromJson(Map<String, dynamic> json) {
  return _ApiUserResponseData.fromJson(json);
}

/// @nodoc
mixin _$ApiUserResponseData {
  @JsonKey(name: 'user')
  ApiUserData? get userData => throw _privateConstructorUsedError;

  /// Serializes this ApiUserResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiUserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiUserResponseDataCopyWith<ApiUserResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiUserResponseDataCopyWith<$Res> {
  factory $ApiUserResponseDataCopyWith(
    ApiUserResponseData value,
    $Res Function(ApiUserResponseData) then,
  ) = _$ApiUserResponseDataCopyWithImpl<$Res, ApiUserResponseData>;
  @useResult
  $Res call({@JsonKey(name: 'user') ApiUserData? userData});

  $ApiUserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$ApiUserResponseDataCopyWithImpl<$Res, $Val extends ApiUserResponseData>
    implements $ApiUserResponseDataCopyWith<$Res> {
  _$ApiUserResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiUserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userData = freezed}) {
    return _then(
      _value.copyWith(
            userData: freezed == userData
                ? _value.userData
                : userData // ignore: cast_nullable_to_non_nullable
                      as ApiUserData?,
          )
          as $Val,
    );
  }

  /// Create a copy of ApiUserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiUserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $ApiUserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiUserResponseDataImplCopyWith<$Res>
    implements $ApiUserResponseDataCopyWith<$Res> {
  factory _$$ApiUserResponseDataImplCopyWith(
    _$ApiUserResponseDataImpl value,
    $Res Function(_$ApiUserResponseDataImpl) then,
  ) = __$$ApiUserResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user') ApiUserData? userData});

  @override
  $ApiUserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$ApiUserResponseDataImplCopyWithImpl<$Res>
    extends _$ApiUserResponseDataCopyWithImpl<$Res, _$ApiUserResponseDataImpl>
    implements _$$ApiUserResponseDataImplCopyWith<$Res> {
  __$$ApiUserResponseDataImplCopyWithImpl(
    _$ApiUserResponseDataImpl _value,
    $Res Function(_$ApiUserResponseDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiUserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userData = freezed}) {
    return _then(
      _$ApiUserResponseDataImpl(
        userData: freezed == userData
            ? _value.userData
            : userData // ignore: cast_nullable_to_non_nullable
                  as ApiUserData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiUserResponseDataImpl extends _ApiUserResponseData {
  const _$ApiUserResponseDataImpl({@JsonKey(name: 'user') this.userData})
    : super._();

  factory _$ApiUserResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiUserResponseDataImplFromJson(json);

  @override
  @JsonKey(name: 'user')
  final ApiUserData? userData;

  @override
  String toString() {
    return 'ApiUserResponseData(userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiUserResponseDataImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userData);

  /// Create a copy of ApiUserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiUserResponseDataImplCopyWith<_$ApiUserResponseDataImpl> get copyWith =>
      __$$ApiUserResponseDataImplCopyWithImpl<_$ApiUserResponseDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiUserResponseDataImplToJson(this);
  }
}

abstract class _ApiUserResponseData extends ApiUserResponseData {
  const factory _ApiUserResponseData({
    @JsonKey(name: 'user') final ApiUserData? userData,
  }) = _$ApiUserResponseDataImpl;
  const _ApiUserResponseData._() : super._();

  factory _ApiUserResponseData.fromJson(Map<String, dynamic> json) =
      _$ApiUserResponseDataImpl.fromJson;

  @override
  @JsonKey(name: 'user')
  ApiUserData? get userData;

  /// Create a copy of ApiUserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiUserResponseDataImplCopyWith<_$ApiUserResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
