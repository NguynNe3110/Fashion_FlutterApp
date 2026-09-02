// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mock_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MockData _$MockDataFromJson(Map<String, dynamic> json) {
  return _MockData.fromJson(json);
}

/// @nodoc
mixin _$MockData {
  @JsonKey(name: 'uid')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this MockData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MockData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MockDataCopyWith<MockData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MockDataCopyWith<$Res> {
  factory $MockDataCopyWith(MockData value, $Res Function(MockData) then) =
      _$MockDataCopyWithImpl<$Res, MockData>;
  @useResult
  $Res call({
    @JsonKey(name: 'uid') int? id,
    @JsonKey(name: 'email') String? email,
  });
}

/// @nodoc
class _$MockDataCopyWithImpl<$Res, $Val extends MockData>
    implements $MockDataCopyWith<$Res> {
  _$MockDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MockData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? email = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MockDataImplCopyWith<$Res>
    implements $MockDataCopyWith<$Res> {
  factory _$$MockDataImplCopyWith(
    _$MockDataImpl value,
    $Res Function(_$MockDataImpl) then,
  ) = __$$MockDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'uid') int? id,
    @JsonKey(name: 'email') String? email,
  });
}

/// @nodoc
class __$$MockDataImplCopyWithImpl<$Res>
    extends _$MockDataCopyWithImpl<$Res, _$MockDataImpl>
    implements _$$MockDataImplCopyWith<$Res> {
  __$$MockDataImplCopyWithImpl(
    _$MockDataImpl _value,
    $Res Function(_$MockDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MockData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? email = freezed}) {
    return _then(
      _$MockDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MockDataImpl extends _MockData {
  const _$MockDataImpl({
    @JsonKey(name: 'uid') this.id,
    @JsonKey(name: 'email') this.email,
  }) : super._();

  factory _$MockDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MockDataImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final int? id;
  @override
  @JsonKey(name: 'email')
  final String? email;

  @override
  String toString() {
    return 'MockData(id: $id, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MockDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email);

  /// Create a copy of MockData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MockDataImplCopyWith<_$MockDataImpl> get copyWith =>
      __$$MockDataImplCopyWithImpl<_$MockDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MockDataImplToJson(this);
  }
}

abstract class _MockData extends MockData {
  const factory _MockData({
    @JsonKey(name: 'uid') final int? id,
    @JsonKey(name: 'email') final String? email,
  }) = _$MockDataImpl;
  const _MockData._() : super._();

  factory _MockData.fromJson(Map<String, dynamic> json) =
      _$MockDataImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  int? get id;
  @override
  @JsonKey(name: 'email')
  String? get email;

  /// Create a copy of MockData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MockDataImplCopyWith<_$MockDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MockData2 _$MockData2FromJson(Map<String, dynamic> json) {
  return _MockData2.fromJson(json);
}

/// @nodoc
mixin _$MockData2 {
  @JsonKey(name: 'mock_data')
  MockData? get mockData => throw _privateConstructorUsedError;

  /// Serializes this MockData2 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MockData2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MockData2CopyWith<MockData2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MockData2CopyWith<$Res> {
  factory $MockData2CopyWith(MockData2 value, $Res Function(MockData2) then) =
      _$MockData2CopyWithImpl<$Res, MockData2>;
  @useResult
  $Res call({@JsonKey(name: 'mock_data') MockData? mockData});

  $MockDataCopyWith<$Res>? get mockData;
}

/// @nodoc
class _$MockData2CopyWithImpl<$Res, $Val extends MockData2>
    implements $MockData2CopyWith<$Res> {
  _$MockData2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MockData2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mockData = freezed}) {
    return _then(
      _value.copyWith(
            mockData: freezed == mockData
                ? _value.mockData
                : mockData // ignore: cast_nullable_to_non_nullable
                      as MockData?,
          )
          as $Val,
    );
  }

  /// Create a copy of MockData2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MockDataCopyWith<$Res>? get mockData {
    if (_value.mockData == null) {
      return null;
    }

    return $MockDataCopyWith<$Res>(_value.mockData!, (value) {
      return _then(_value.copyWith(mockData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MockData2ImplCopyWith<$Res>
    implements $MockData2CopyWith<$Res> {
  factory _$$MockData2ImplCopyWith(
    _$MockData2Impl value,
    $Res Function(_$MockData2Impl) then,
  ) = __$$MockData2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'mock_data') MockData? mockData});

  @override
  $MockDataCopyWith<$Res>? get mockData;
}

/// @nodoc
class __$$MockData2ImplCopyWithImpl<$Res>
    extends _$MockData2CopyWithImpl<$Res, _$MockData2Impl>
    implements _$$MockData2ImplCopyWith<$Res> {
  __$$MockData2ImplCopyWithImpl(
    _$MockData2Impl _value,
    $Res Function(_$MockData2Impl) _then,
  ) : super(_value, _then);

  /// Create a copy of MockData2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mockData = freezed}) {
    return _then(
      _$MockData2Impl(
        mockData: freezed == mockData
            ? _value.mockData
            : mockData // ignore: cast_nullable_to_non_nullable
                  as MockData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MockData2Impl extends _MockData2 {
  const _$MockData2Impl({@JsonKey(name: 'mock_data') this.mockData})
    : super._();

  factory _$MockData2Impl.fromJson(Map<String, dynamic> json) =>
      _$$MockData2ImplFromJson(json);

  @override
  @JsonKey(name: 'mock_data')
  final MockData? mockData;

  @override
  String toString() {
    return 'MockData2(mockData: $mockData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MockData2Impl &&
            (identical(other.mockData, mockData) ||
                other.mockData == mockData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mockData);

  /// Create a copy of MockData2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MockData2ImplCopyWith<_$MockData2Impl> get copyWith =>
      __$$MockData2ImplCopyWithImpl<_$MockData2Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MockData2ImplToJson(this);
  }
}

abstract class _MockData2 extends MockData2 {
  const factory _MockData2({
    @JsonKey(name: 'mock_data') final MockData? mockData,
  }) = _$MockData2Impl;
  const _MockData2._() : super._();

  factory _MockData2.fromJson(Map<String, dynamic> json) =
      _$MockData2Impl.fromJson;

  @override
  @JsonKey(name: 'mock_data')
  MockData? get mockData;

  /// Create a copy of MockData2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MockData2ImplCopyWith<_$MockData2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
