// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'records_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecordsListResponse<T> _$RecordsListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _RecordsListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$RecordsListResponse<T> {
  @JsonKey(name: 'records')
  List<T>? get records => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'offset')
  int? get offset => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  int? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev')
  int? get prev => throw _privateConstructorUsedError;

  /// Serializes this RecordsListResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RecordsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordsListResponseCopyWith<T, RecordsListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsListResponseCopyWith<T, $Res> {
  factory $RecordsListResponseCopyWith(
    RecordsListResponse<T> value,
    $Res Function(RecordsListResponse<T>) then,
  ) = _$RecordsListResponseCopyWithImpl<T, $Res, RecordsListResponse<T>>;
  @useResult
  $Res call({
    @JsonKey(name: 'records') List<T>? records,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'offset') int? offset,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'next') int? next,
    @JsonKey(name: 'prev') int? prev,
  });
}

/// @nodoc
class _$RecordsListResponseCopyWithImpl<
  T,
  $Res,
  $Val extends RecordsListResponse<T>
>
    implements $RecordsListResponseCopyWith<T, $Res> {
  _$RecordsListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = freezed,
    Object? page = freezed,
    Object? offset = freezed,
    Object? total = freezed,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(
      _value.copyWith(
            records: freezed == records
                ? _value.records
                : records // ignore: cast_nullable_to_non_nullable
                      as List<T>?,
            page: freezed == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int?,
            offset: freezed == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int?,
            next: freezed == next
                ? _value.next
                : next // ignore: cast_nullable_to_non_nullable
                      as int?,
            prev: freezed == prev
                ? _value.prev
                : prev // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecordsListResponseImplCopyWith<T, $Res>
    implements $RecordsListResponseCopyWith<T, $Res> {
  factory _$$RecordsListResponseImplCopyWith(
    _$RecordsListResponseImpl<T> value,
    $Res Function(_$RecordsListResponseImpl<T>) then,
  ) = __$$RecordsListResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'records') List<T>? records,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'offset') int? offset,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'next') int? next,
    @JsonKey(name: 'prev') int? prev,
  });
}

/// @nodoc
class __$$RecordsListResponseImplCopyWithImpl<T, $Res>
    extends
        _$RecordsListResponseCopyWithImpl<T, $Res, _$RecordsListResponseImpl<T>>
    implements _$$RecordsListResponseImplCopyWith<T, $Res> {
  __$$RecordsListResponseImplCopyWithImpl(
    _$RecordsListResponseImpl<T> _value,
    $Res Function(_$RecordsListResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of RecordsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = freezed,
    Object? page = freezed,
    Object? offset = freezed,
    Object? total = freezed,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(
      _$RecordsListResponseImpl<T>(
        records: freezed == records
            ? _value._records
            : records // ignore: cast_nullable_to_non_nullable
                  as List<T>?,
        page: freezed == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int?,
        offset: freezed == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int?,
        next: freezed == next
            ? _value.next
            : next // ignore: cast_nullable_to_non_nullable
                  as int?,
        prev: freezed == prev
            ? _value.prev
            : prev // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$RecordsListResponseImpl<T> extends _RecordsListResponse<T> {
  const _$RecordsListResponseImpl({
    @JsonKey(name: 'records') final List<T>? records,
    @JsonKey(name: 'page') this.page,
    @JsonKey(name: 'offset') this.offset,
    @JsonKey(name: 'total') this.total,
    @JsonKey(name: 'next') this.next,
    @JsonKey(name: 'prev') this.prev,
  }) : _records = records,
       super._();

  factory _$RecordsListResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$RecordsListResponseImplFromJson(json, fromJsonT);

  final List<T>? _records;
  @override
  @JsonKey(name: 'records')
  List<T>? get records {
    final value = _records;
    if (value == null) return null;
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'page')
  final int? page;
  @override
  @JsonKey(name: 'offset')
  final int? offset;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'next')
  final int? next;
  @override
  @JsonKey(name: 'prev')
  final int? prev;

  @override
  String toString() {
    return 'RecordsListResponse<$T>(records: $records, page: $page, offset: $offset, total: $total, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsListResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_records),
    page,
    offset,
    total,
    next,
    prev,
  );

  /// Create a copy of RecordsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordsListResponseImplCopyWith<T, _$RecordsListResponseImpl<T>>
  get copyWith =>
      __$$RecordsListResponseImplCopyWithImpl<T, _$RecordsListResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$RecordsListResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _RecordsListResponse<T> extends RecordsListResponse<T> {
  const factory _RecordsListResponse({
    @JsonKey(name: 'records') final List<T>? records,
    @JsonKey(name: 'page') final int? page,
    @JsonKey(name: 'offset') final int? offset,
    @JsonKey(name: 'total') final int? total,
    @JsonKey(name: 'next') final int? next,
    @JsonKey(name: 'prev') final int? prev,
  }) = _$RecordsListResponseImpl<T>;
  const _RecordsListResponse._() : super._();

  factory _RecordsListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$RecordsListResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'records')
  List<T>? get records;
  @override
  @JsonKey(name: 'page')
  int? get page;
  @override
  @JsonKey(name: 'offset')
  int? get offset;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'next')
  int? get next;
  @override
  @JsonKey(name: 'prev')
  int? get prev;

  /// Create a copy of RecordsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordsListResponseImplCopyWith<T, _$RecordsListResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
