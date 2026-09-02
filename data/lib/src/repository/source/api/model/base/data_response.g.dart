// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataResponseImpl<T> _$$DataResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$DataResponseImpl<T>(
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DataResponseImplToJson<T>(
  _$DataResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': _$nullableGenericToJson(instance.data, toJsonT),
  'meta': instance.meta,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_$DataListResponseImpl<T> _$$DataListResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$DataListResponseImpl<T>(
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DataListResponseImplToJson<T>(
  _$DataListResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data?.map(toJsonT).toList(),
  'meta': instance.meta,
};

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
  pageInfo: json['pagy_info'] == null
      ? null
      : PageInfo.fromJson(json['pagy_info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{'pagy_info': instance.pageInfo};

_$PageInfoImpl _$$PageInfoImplFromJson(Map<String, dynamic> json) =>
    _$PageInfoImpl(next: (json['next'] as num?)?.toInt());

Map<String, dynamic> _$$PageInfoImplToJson(_$PageInfoImpl instance) =>
    <String, dynamic>{'next': instance.next};
