// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiNotificationDataImpl _$$ApiNotificationDataImplFromJson(
  Map<String, dynamic> json,
) => _$ApiNotificationDataImpl(
  notificationId: json['notification_id'] as String?,
  image: json['image'] as String?,
  title: json['title'] as String?,
  message: json['message'] as String?,
  notificationType: json['notification_type'] as String?,
);

Map<String, dynamic> _$$ApiNotificationDataImplToJson(
  _$ApiNotificationDataImpl instance,
) => <String, dynamic>{
  'notification_id': instance.notificationId,
  'image': instance.image,
  'title': instance.title,
  'message': instance.message,
  'notification_type': instance.notificationType,
};
