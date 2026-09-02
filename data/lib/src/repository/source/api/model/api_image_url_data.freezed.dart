// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_image_url_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiImageUrlData _$ApiImageUrlDataFromJson(Map<String, dynamic> json) {
  return _ApiImageUrlData.fromJson(json);
}

/// @nodoc
mixin _$ApiImageUrlData {
  @JsonKey(name: 'origin')
  String? get origin => throw _privateConstructorUsedError;
  @JsonKey(name: 'sm')
  String? get sm => throw _privateConstructorUsedError;
  @JsonKey(name: 'md')
  String? get md => throw _privateConstructorUsedError;
  @JsonKey(name: 'lg')
  String? get lg => throw _privateConstructorUsedError;

  /// Serializes this ApiImageUrlData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiImageUrlData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiImageUrlDataCopyWith<ApiImageUrlData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiImageUrlDataCopyWith<$Res> {
  factory $ApiImageUrlDataCopyWith(
    ApiImageUrlData value,
    $Res Function(ApiImageUrlData) then,
  ) = _$ApiImageUrlDataCopyWithImpl<$Res, ApiImageUrlData>;
  @useResult
  $Res call({
    @JsonKey(name: 'origin') String? origin,
    @JsonKey(name: 'sm') String? sm,
    @JsonKey(name: 'md') String? md,
    @JsonKey(name: 'lg') String? lg,
  });
}

/// @nodoc
class _$ApiImageUrlDataCopyWithImpl<$Res, $Val extends ApiImageUrlData>
    implements $ApiImageUrlDataCopyWith<$Res> {
  _$ApiImageUrlDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiImageUrlData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = freezed,
    Object? sm = freezed,
    Object? md = freezed,
    Object? lg = freezed,
  }) {
    return _then(
      _value.copyWith(
            origin: freezed == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                      as String?,
            sm: freezed == sm
                ? _value.sm
                : sm // ignore: cast_nullable_to_non_nullable
                      as String?,
            md: freezed == md
                ? _value.md
                : md // ignore: cast_nullable_to_non_nullable
                      as String?,
            lg: freezed == lg
                ? _value.lg
                : lg // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiImageUrlDataImplCopyWith<$Res>
    implements $ApiImageUrlDataCopyWith<$Res> {
  factory _$$ApiImageUrlDataImplCopyWith(
    _$ApiImageUrlDataImpl value,
    $Res Function(_$ApiImageUrlDataImpl) then,
  ) = __$$ApiImageUrlDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'origin') String? origin,
    @JsonKey(name: 'sm') String? sm,
    @JsonKey(name: 'md') String? md,
    @JsonKey(name: 'lg') String? lg,
  });
}

/// @nodoc
class __$$ApiImageUrlDataImplCopyWithImpl<$Res>
    extends _$ApiImageUrlDataCopyWithImpl<$Res, _$ApiImageUrlDataImpl>
    implements _$$ApiImageUrlDataImplCopyWith<$Res> {
  __$$ApiImageUrlDataImplCopyWithImpl(
    _$ApiImageUrlDataImpl _value,
    $Res Function(_$ApiImageUrlDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiImageUrlData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = freezed,
    Object? sm = freezed,
    Object? md = freezed,
    Object? lg = freezed,
  }) {
    return _then(
      _$ApiImageUrlDataImpl(
        origin: freezed == origin
            ? _value.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as String?,
        sm: freezed == sm
            ? _value.sm
            : sm // ignore: cast_nullable_to_non_nullable
                  as String?,
        md: freezed == md
            ? _value.md
            : md // ignore: cast_nullable_to_non_nullable
                  as String?,
        lg: freezed == lg
            ? _value.lg
            : lg // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiImageUrlDataImpl extends _ApiImageUrlData {
  const _$ApiImageUrlDataImpl({
    @JsonKey(name: 'origin') this.origin,
    @JsonKey(name: 'sm') this.sm,
    @JsonKey(name: 'md') this.md,
    @JsonKey(name: 'lg') this.lg,
  }) : super._();

  factory _$ApiImageUrlDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiImageUrlDataImplFromJson(json);

  @override
  @JsonKey(name: 'origin')
  final String? origin;
  @override
  @JsonKey(name: 'sm')
  final String? sm;
  @override
  @JsonKey(name: 'md')
  final String? md;
  @override
  @JsonKey(name: 'lg')
  final String? lg;

  @override
  String toString() {
    return 'ApiImageUrlData(origin: $origin, sm: $sm, md: $md, lg: $lg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiImageUrlDataImpl &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.sm, sm) || other.sm == sm) &&
            (identical(other.md, md) || other.md == md) &&
            (identical(other.lg, lg) || other.lg == lg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, origin, sm, md, lg);

  /// Create a copy of ApiImageUrlData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiImageUrlDataImplCopyWith<_$ApiImageUrlDataImpl> get copyWith =>
      __$$ApiImageUrlDataImplCopyWithImpl<_$ApiImageUrlDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiImageUrlDataImplToJson(this);
  }
}

abstract class _ApiImageUrlData extends ApiImageUrlData {
  const factory _ApiImageUrlData({
    @JsonKey(name: 'origin') final String? origin,
    @JsonKey(name: 'sm') final String? sm,
    @JsonKey(name: 'md') final String? md,
    @JsonKey(name: 'lg') final String? lg,
  }) = _$ApiImageUrlDataImpl;
  const _ApiImageUrlData._() : super._();

  factory _ApiImageUrlData.fromJson(Map<String, dynamic> json) =
      _$ApiImageUrlDataImpl.fromJson;

  @override
  @JsonKey(name: 'origin')
  String? get origin;
  @override
  @JsonKey(name: 'sm')
  String? get sm;
  @override
  @JsonKey(name: 'md')
  String? get md;
  @override
  @JsonKey(name: 'lg')
  String? get lg;

  /// Create a copy of ApiImageUrlData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiImageUrlDataImplCopyWith<_$ApiImageUrlDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
