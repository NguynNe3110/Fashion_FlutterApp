// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiUserResponseDataImpl _$$ApiUserResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$ApiUserResponseDataImpl(
  userData: json['user'] == null
      ? null
      : ApiUserData.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ApiUserResponseDataImplToJson(
  _$ApiUserResponseDataImpl instance,
) => <String, dynamic>{'user': instance.userData};
