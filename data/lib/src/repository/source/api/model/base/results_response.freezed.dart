// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResultsListResponse<T> _$ResultsListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _ResultsListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResultsListResponse<T> {
  @JsonKey(name: 'results')
  List<T>? get results => throw _privateConstructorUsedError;

  /// Serializes this ResultsListResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ResultsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultsListResponseCopyWith<T, ResultsListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsListResponseCopyWith<T, $Res> {
  factory $ResultsListResponseCopyWith(
    ResultsListResponse<T> value,
    $Res Function(ResultsListResponse<T>) then,
  ) = _$ResultsListResponseCopyWithImpl<T, $Res, ResultsListResponse<T>>;
  @useResult
  $Res call({@JsonKey(name: 'results') List<T>? results});
}

/// @nodoc
class _$ResultsListResponseCopyWithImpl<
  T,
  $Res,
  $Val extends ResultsListResponse<T>
>
    implements $ResultsListResponseCopyWith<T, $Res> {
  _$ResultsListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = freezed}) {
    return _then(
      _value.copyWith(
            results: freezed == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<T>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultsListResponseImplCopyWith<T, $Res>
    implements $ResultsListResponseCopyWith<T, $Res> {
  factory _$$ResultsListResponseImplCopyWith(
    _$ResultsListResponseImpl<T> value,
    $Res Function(_$ResultsListResponseImpl<T>) then,
  ) = __$$ResultsListResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'results') List<T>? results});
}

/// @nodoc
class __$$ResultsListResponseImplCopyWithImpl<T, $Res>
    extends
        _$ResultsListResponseCopyWithImpl<T, $Res, _$ResultsListResponseImpl<T>>
    implements _$$ResultsListResponseImplCopyWith<T, $Res> {
  __$$ResultsListResponseImplCopyWithImpl(
    _$ResultsListResponseImpl<T> _value,
    $Res Function(_$ResultsListResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = freezed}) {
    return _then(
      _$ResultsListResponseImpl<T>(
        results: freezed == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<T>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResultsListResponseImpl<T> extends _ResultsListResponse<T> {
  const _$ResultsListResponseImpl({
    @JsonKey(name: 'results') final List<T>? results,
  }) : _results = results,
       super._();

  factory _$ResultsListResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$ResultsListResponseImplFromJson(json, fromJsonT);

  final List<T>? _results;
  @override
  @JsonKey(name: 'results')
  List<T>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultsListResponse<$T>(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultsListResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  /// Create a copy of ResultsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultsListResponseImplCopyWith<T, _$ResultsListResponseImpl<T>>
  get copyWith =>
      __$$ResultsListResponseImplCopyWithImpl<T, _$ResultsListResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResultsListResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ResultsListResponse<T> extends ResultsListResponse<T> {
  const factory _ResultsListResponse({
    @JsonKey(name: 'results') final List<T>? results,
  }) = _$ResultsListResponseImpl<T>;
  const _ResultsListResponse._() : super._();

  factory _ResultsListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$ResultsListResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'results')
  List<T>? get results;

  /// Create a copy of ResultsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultsListResponseImplCopyWith<T, _$ResultsListResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
