// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiUserDataImpl _$$ApiUserDataImplFromJson(Map<String, dynamic> json) =>
    _$ApiUserDataImpl(
      id: (json['uid'] as num?)?.toInt(),
      email: json['email'] as String?,
      birthday: json['birthday'] as String?,
      money: json['money'] as String?,
      avatar: json['avatar'] == null
          ? null
          : ApiImageUrlData.fromJson(json['avatar'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => ApiImageUrlData.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: (json['sex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApiUserDataImplToJson(_$ApiUserDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.id,
      'email': instance.email,
      'birthday': instance.birthday,
      'money': instance.money,
      'avatar': instance.avatar,
      'photos': instance.photos,
      'sex': instance.gender,
    };
