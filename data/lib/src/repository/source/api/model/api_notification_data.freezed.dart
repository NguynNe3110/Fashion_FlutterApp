// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_notification_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiNotificationData _$ApiNotificationDataFromJson(Map<String, dynamic> json) {
  return _ApiNotificationData.fromJson(json);
}

/// @nodoc
mixin _$ApiNotificationData {
  @JsonKey(name: 'notification_id')
  String? get notificationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_type')
  String? get notificationType => throw _privateConstructorUsedError;

  /// Serializes this ApiNotificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiNotificationDataCopyWith<ApiNotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiNotificationDataCopyWith<$Res> {
  factory $ApiNotificationDataCopyWith(
    ApiNotificationData value,
    $Res Function(ApiNotificationData) then,
  ) = _$ApiNotificationDataCopyWithImpl<$Res, ApiNotificationData>;
  @useResult
  $Res call({
    @JsonKey(name: 'notification_id') String? notificationId,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'notification_type') String? notificationType,
  });
}

/// @nodoc
class _$ApiNotificationDataCopyWithImpl<$Res, $Val extends ApiNotificationData>
    implements $ApiNotificationDataCopyWith<$Res> {
  _$ApiNotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? notificationType = freezed,
  }) {
    return _then(
      _value.copyWith(
            notificationId: freezed == notificationId
                ? _value.notificationId
                : notificationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            notificationType: freezed == notificationType
                ? _value.notificationType
                : notificationType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiNotificationDataImplCopyWith<$Res>
    implements $ApiNotificationDataCopyWith<$Res> {
  factory _$$ApiNotificationDataImplCopyWith(
    _$ApiNotificationDataImpl value,
    $Res Function(_$ApiNotificationDataImpl) then,
  ) = __$$ApiNotificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'notification_id') String? notificationId,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'notification_type') String? notificationType,
  });
}

/// @nodoc
class __$$ApiNotificationDataImplCopyWithImpl<$Res>
    extends _$ApiNotificationDataCopyWithImpl<$Res, _$ApiNotificationDataImpl>
    implements _$$ApiNotificationDataImplCopyWith<$Res> {
  __$$ApiNotificationDataImplCopyWithImpl(
    _$ApiNotificationDataImpl _value,
    $Res Function(_$ApiNotificationDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? notificationType = freezed,
  }) {
    return _then(
      _$ApiNotificationDataImpl(
        notificationId: freezed == notificationId
            ? _value.notificationId
            : notificationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        notificationType: freezed == notificationType
            ? _value.notificationType
            : notificationType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiNotificationDataImpl extends _ApiNotificationData {
  const _$ApiNotificationDataImpl({
    @JsonKey(name: 'notification_id') this.notificationId,
    @JsonKey(name: 'image') this.image,
    @JsonKey(name: 'title') this.title,
    @JsonKey(name: 'message') this.message,
    @JsonKey(name: 'notification_type') this.notificationType,
  }) : super._();

  factory _$ApiNotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiNotificationDataImplFromJson(json);

  @override
  @JsonKey(name: 'notification_id')
  final String? notificationId;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'notification_type')
  final String? notificationType;

  @override
  String toString() {
    return 'ApiNotificationData(notificationId: $notificationId, image: $image, title: $title, message: $message, notificationType: $notificationType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiNotificationDataImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    notificationId,
    image,
    title,
    message,
    notificationType,
  );

  /// Create a copy of ApiNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiNotificationDataImplCopyWith<_$ApiNotificationDataImpl> get copyWith =>
      __$$ApiNotificationDataImplCopyWithImpl<_$ApiNotificationDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiNotificationDataImplToJson(this);
  }
}

abstract class _ApiNotificationData extends ApiNotificationData {
  const factory _ApiNotificationData({
    @JsonKey(name: 'notification_id') final String? notificationId,
    @JsonKey(name: 'image') final String? image,
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'message') final String? message,
    @JsonKey(name: 'notification_type') final String? notificationType,
  }) = _$ApiNotificationDataImpl;
  const _ApiNotificationData._() : super._();

  factory _ApiNotificationData.fromJson(Map<String, dynamic> json) =
      _$ApiNotificationDataImpl.fromJson;

  @override
  @JsonKey(name: 'notification_id')
  String? get notificationId;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'notification_type')
  String? get notificationType;

  /// Create a copy of ApiNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiNotificationDataImplCopyWith<_$ApiNotificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
