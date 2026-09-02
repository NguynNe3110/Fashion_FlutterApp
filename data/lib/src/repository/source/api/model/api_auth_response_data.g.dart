// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_auth_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiAuthResponseDataImpl _$$ApiAuthResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$ApiAuthResponseDataImpl(
  accessToken: json['access_token'] as String?,
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  username: json['username'] as String?,
  name: json['name'] as String?,
  gender: json['gender'] as String?,
  ageRange: json['age_range'] as String?,
);

Map<String, dynamic> _$$ApiAuthResponseDataImplToJson(
  _$ApiAuthResponseDataImpl instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'id': instance.id,
  'email': instance.email,
  'username': instance.username,
  'name': instance.name,
  'gender': instance.gender,
  'age_range': instance.ageRange,
};
