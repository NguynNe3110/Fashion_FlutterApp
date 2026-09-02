// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MockDataImpl _$$MockDataImplFromJson(Map<String, dynamic> json) =>
    _$MockDataImpl(
      id: (json['uid'] as num?)?.toInt(),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$MockDataImplToJson(_$MockDataImpl instance) =>
    <String, dynamic>{'uid': instance.id, 'email': instance.email};

_$MockData2Impl _$$MockData2ImplFromJson(Map<String, dynamic> json) =>
    _$MockData2Impl(
      mockData: json['mock_data'] == null
          ? null
          : MockData.fromJson(json['mock_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MockData2ImplToJson(_$MockData2Impl instance) =>
    <String, dynamic>{'mock_data': instance.mockData};
