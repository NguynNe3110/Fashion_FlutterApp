// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiTokenDataImpl _$$ApiTokenDataImplFromJson(Map<String, dynamic> json) =>
    _$ApiTokenDataImpl(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$$ApiTokenDataImplToJson(_$ApiTokenDataImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
