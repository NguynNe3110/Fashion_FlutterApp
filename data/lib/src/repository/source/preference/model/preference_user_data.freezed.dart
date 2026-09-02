// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PreferenceUserData _$PreferenceUserDataFromJson(Map<String, dynamic> json) {
  return _PreferenceUserData.fromJson(json);
}

/// @nodoc
mixin _$PreferenceUserData {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;

  /// Serializes this PreferenceUserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferenceUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferenceUserDataCopyWith<PreferenceUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceUserDataCopyWith<$Res> {
  factory $PreferenceUserDataCopyWith(
    PreferenceUserData value,
    $Res Function(PreferenceUserData) then,
  ) = _$PreferenceUserDataCopyWithImpl<$Res, PreferenceUserData>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'email') String email,
  });
}

/// @nodoc
class _$PreferenceUserDataCopyWithImpl<$Res, $Val extends PreferenceUserData>
    implements $PreferenceUserDataCopyWith<$Res> {
  _$PreferenceUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferenceUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? email = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$PreferenceUserDataImplCopyWith<$Res>
    implements $PreferenceUserDataCopyWith<$Res> {
  factory _$$PreferenceUserDataImplCopyWith(
    _$PreferenceUserDataImpl value,
    $Res Function(_$PreferenceUserDataImpl) then,
  ) = __$$PreferenceUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'email') String email,
  });
}

/// @nodoc
class __$$PreferenceUserDataImplCopyWithImpl<$Res>
    extends _$PreferenceUserDataCopyWithImpl<$Res, _$PreferenceUserDataImpl>
    implements _$$PreferenceUserDataImplCopyWith<$Res> {
  __$$PreferenceUserDataImplCopyWithImpl(
    _$PreferenceUserDataImpl _value,
    $Res Function(_$PreferenceUserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreferenceUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? email = null}) {
    return _then(
      _$PreferenceUserDataImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceUserDataImpl extends _PreferenceUserData {
  const _$PreferenceUserDataImpl({
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'email') required this.email,
  }) : super._();

  factory _$PreferenceUserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceUserDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'email')
  final String email;

  @override
  String toString() {
    return 'PreferenceUserData(id: $id, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceUserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email);

  /// Create a copy of PreferenceUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceUserDataImplCopyWith<_$PreferenceUserDataImpl> get copyWith =>
      __$$PreferenceUserDataImplCopyWithImpl<_$PreferenceUserDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceUserDataImplToJson(this);
  }
}

abstract class _PreferenceUserData extends PreferenceUserData {
  const factory _PreferenceUserData({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'email') required final String email,
  }) = _$PreferenceUserDataImpl;
  const _PreferenceUserData._() : super._();

  factory _PreferenceUserData.fromJson(Map<String, dynamic> json) =
      _$PreferenceUserDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'email')
  String get email;

  /// Create a copy of PreferenceUserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferenceUserDataImplCopyWith<_$PreferenceUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
