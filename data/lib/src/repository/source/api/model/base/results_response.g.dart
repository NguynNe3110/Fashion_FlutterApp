// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultsListResponseImpl<T> _$$ResultsListResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$ResultsListResponseImpl<T>(
  results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
);

Map<String, dynamic> _$$ResultsListResponseImplToJson<T>(
  _$ResultsListResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'results': instance.results?.map(toJsonT).toList()};
