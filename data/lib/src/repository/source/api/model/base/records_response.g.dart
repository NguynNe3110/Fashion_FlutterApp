// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordsListResponseImpl<T> _$$RecordsListResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$RecordsListResponseImpl<T>(
  records: (json['records'] as List<dynamic>?)?.map(fromJsonT).toList(),
  page: (json['page'] as num?)?.toInt(),
  offset: (json['offset'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  next: (json['next'] as num?)?.toInt(),
  prev: (json['prev'] as num?)?.toInt(),
);

Map<String, dynamic> _$$RecordsListResponseImplToJson<T>(
  _$RecordsListResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'records': instance.records?.map(toJsonT).toList(),
  'page': instance.page,
  'offset': instance.offset,
  'total': instance.total,
  'next': instance.next,
  'prev': instance.prev,
};
