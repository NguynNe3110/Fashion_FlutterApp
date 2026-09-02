// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DataResponse<T> _$DataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _DataResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DataResponse<T> {
  @JsonKey(name: 'data')
  T? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this DataResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataResponseCopyWith<T, DataResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResponseCopyWith<T, $Res> {
  factory $DataResponseCopyWith(
    DataResponse<T> value,
    $Res Function(DataResponse<T>) then,
  ) = _$DataResponseCopyWithImpl<T, $Res, DataResponse<T>>;
  @useResult
  $Res call({
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'meta') Meta? meta,
  });

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$DataResponseCopyWithImpl<T, $Res, $Val extends DataResponse<T>>
    implements $DataResponseCopyWith<T, $Res> {
  _$DataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed, Object? meta = freezed}) {
    return _then(
      _value.copyWith(
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as T?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as Meta?,
          )
          as $Val,
    );
  }

  /// Create a copy of DataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataResponseImplCopyWith<T, $Res>
    implements $DataResponseCopyWith<T, $Res> {
  factory _$$DataResponseImplCopyWith(
    _$DataResponseImpl<T> value,
    $Res Function(_$DataResponseImpl<T>) then,
  ) = __$$DataResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'meta') Meta? meta,
  });

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$DataResponseImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$DataResponseImpl<T>>
    implements _$$DataResponseImplCopyWith<T, $Res> {
  __$$DataResponseImplCopyWithImpl(
    _$DataResponseImpl<T> _value,
    $Res Function(_$DataResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed, Object? meta = freezed}) {
    return _then(
      _$DataResponseImpl<T>(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as Meta?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DataResponseImpl<T> extends _DataResponse<T>
    with DiagnosticableTreeMixin {
  const _$DataResponseImpl({
    @JsonKey(name: 'data') this.data,
    @JsonKey(name: 'meta') this.meta,
  }) : super._();

  factory _$DataResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$DataResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'data')
  final T? data;
  @override
  @JsonKey(name: 'meta')
  final Meta? meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataResponse<$T>(data: $data, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataResponse<$T>'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), meta);

  /// Create a copy of DataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataResponseImplCopyWith<T, _$DataResponseImpl<T>> get copyWith =>
      __$$DataResponseImplCopyWithImpl<T, _$DataResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DataResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _DataResponse<T> extends DataResponse<T> {
  const factory _DataResponse({
    @JsonKey(name: 'data') final T? data,
    @JsonKey(name: 'meta') final Meta? meta,
  }) = _$DataResponseImpl<T>;
  const _DataResponse._() : super._();

  factory _DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$DataResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'data')
  T? get data;
  @override
  @JsonKey(name: 'meta')
  Meta? get meta;

  /// Create a copy of DataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataResponseImplCopyWith<T, _$DataResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

DataListResponse<T> _$DataListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _DataListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DataListResponse<T> {
  @JsonKey(name: 'data')
  List<T>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this DataListResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DataListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataListResponseCopyWith<T, DataListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataListResponseCopyWith<T, $Res> {
  factory $DataListResponseCopyWith(
    DataListResponse<T> value,
    $Res Function(DataListResponse<T>) then,
  ) = _$DataListResponseCopyWithImpl<T, $Res, DataListResponse<T>>;
  @useResult
  $Res call({
    @JsonKey(name: 'data') List<T>? data,
    @JsonKey(name: 'meta') Meta? meta,
  });

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$DataListResponseCopyWithImpl<T, $Res, $Val extends DataListResponse<T>>
    implements $DataListResponseCopyWith<T, $Res> {
  _$DataListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed, Object? meta = freezed}) {
    return _then(
      _value.copyWith(
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<T>?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as Meta?,
          )
          as $Val,
    );
  }

  /// Create a copy of DataListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataListResponseImplCopyWith<T, $Res>
    implements $DataListResponseCopyWith<T, $Res> {
  factory _$$DataListResponseImplCopyWith(
    _$DataListResponseImpl<T> value,
    $Res Function(_$DataListResponseImpl<T>) then,
  ) = __$$DataListResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'data') List<T>? data,
    @JsonKey(name: 'meta') Meta? meta,
  });

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$DataListResponseImplCopyWithImpl<T, $Res>
    extends _$DataListResponseCopyWithImpl<T, $Res, _$DataListResponseImpl<T>>
    implements _$$DataListResponseImplCopyWith<T, $Res> {
  __$$DataListResponseImplCopyWithImpl(
    _$DataListResponseImpl<T> _value,
    $Res Function(_$DataListResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of DataListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed, Object? meta = freezed}) {
    return _then(
      _$DataListResponseImpl<T>(
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<T>?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as Meta?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DataListResponseImpl<T> extends _DataListResponse<T>
    with DiagnosticableTreeMixin {
  const _$DataListResponseImpl({
    @JsonKey(name: 'data') final List<T>? data,
    @JsonKey(name: 'meta') this.meta,
  }) : _data = data,
       super._();

  factory _$DataListResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$DataListResponseImplFromJson(json, fromJsonT);

  final List<T>? _data;
  @override
  @JsonKey(name: 'data')
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'meta')
  final Meta? meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataListResponse<$T>(data: $data, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataListResponse<$T>'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataListResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    meta,
  );

  /// Create a copy of DataListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataListResponseImplCopyWith<T, _$DataListResponseImpl<T>> get copyWith =>
      __$$DataListResponseImplCopyWithImpl<T, _$DataListResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DataListResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _DataListResponse<T> extends DataListResponse<T> {
  const factory _DataListResponse({
    @JsonKey(name: 'data') final List<T>? data,
    @JsonKey(name: 'meta') final Meta? meta,
  }) = _$DataListResponseImpl<T>;
  const _DataListResponse._() : super._();

  factory _DataListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$DataListResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'data')
  List<T>? get data;
  @override
  @JsonKey(name: 'meta')
  Meta? get meta;

  /// Create a copy of DataListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataListResponseImplCopyWith<T, _$DataListResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'pagy_info')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({@JsonKey(name: 'pagy_info') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageInfo = freezed}) {
    return _then(
      _value.copyWith(
            pageInfo: freezed == pageInfo
                ? _value.pageInfo
                : pageInfo // ignore: cast_nullable_to_non_nullable
                      as PageInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
    _$MetaImpl value,
    $Res Function(_$MetaImpl) then,
  ) = __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pagy_info') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
    : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageInfo = freezed}) {
    return _then(
      _$MetaImpl(
        pageInfo: freezed == pageInfo
            ? _value.pageInfo
            : pageInfo // ignore: cast_nullable_to_non_nullable
                  as PageInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl extends _Meta with DiagnosticableTreeMixin {
  _$MetaImpl({@JsonKey(name: 'pagy_info') this.pageInfo}) : super._();

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: 'pagy_info')
  final PageInfo? pageInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Meta(pageInfo: $pageInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Meta'))
      ..add(DiagnosticsProperty('pageInfo', pageInfo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageInfo);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(this);
  }
}

abstract class _Meta extends Meta {
  factory _Meta({@JsonKey(name: 'pagy_info') final PageInfo? pageInfo}) =
      _$MetaImpl;
  _Meta._() : super._();

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: 'pagy_info')
  PageInfo? get pageInfo;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return _PageInfo.fromJson(json);
}

/// @nodoc
mixin _$PageInfo {
  @JsonKey(name: 'next')
  int? get next => throw _privateConstructorUsedError;

  /// Serializes this PageInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageInfoCopyWith<PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInfoCopyWith<$Res> {
  factory $PageInfoCopyWith(PageInfo value, $Res Function(PageInfo) then) =
      _$PageInfoCopyWithImpl<$Res, PageInfo>;
  @useResult
  $Res call({@JsonKey(name: 'next') int? next});
}

/// @nodoc
class _$PageInfoCopyWithImpl<$Res, $Val extends PageInfo>
    implements $PageInfoCopyWith<$Res> {
  _$PageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _value.copyWith(
            next: freezed == next
                ? _value.next
                : next // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PageInfoImplCopyWith<$Res>
    implements $PageInfoCopyWith<$Res> {
  factory _$$PageInfoImplCopyWith(
    _$PageInfoImpl value,
    $Res Function(_$PageInfoImpl) then,
  ) = __$$PageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'next') int? next});
}

/// @nodoc
class __$$PageInfoImplCopyWithImpl<$Res>
    extends _$PageInfoCopyWithImpl<$Res, _$PageInfoImpl>
    implements _$$PageInfoImplCopyWith<$Res> {
  __$$PageInfoImplCopyWithImpl(
    _$PageInfoImpl _value,
    $Res Function(_$PageInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? next = freezed}) {
    return _then(
      _$PageInfoImpl(
        next: freezed == next
            ? _value.next
            : next // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PageInfoImpl extends _PageInfo with DiagnosticableTreeMixin {
  _$PageInfoImpl({@JsonKey(name: 'next') this.next}) : super._();

  factory _$PageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageInfoImplFromJson(json);

  @override
  @JsonKey(name: 'next')
  final int? next;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PageInfo(next: $next)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PageInfo'))
      ..add(DiagnosticsProperty('next', next));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageInfoImpl &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  /// Create a copy of PageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageInfoImplCopyWith<_$PageInfoImpl> get copyWith =>
      __$$PageInfoImplCopyWithImpl<_$PageInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageInfoImplToJson(this);
  }
}

abstract class _PageInfo extends PageInfo {
  factory _PageInfo({@JsonKey(name: 'next') final int? next}) = _$PageInfoImpl;
  _PageInfo._() : super._();

  factory _PageInfo.fromJson(Map<String, dynamic> json) =
      _$PageInfoImpl.fromJson;

  @override
  @JsonKey(name: 'next')
  int? get next;

  /// Create a copy of PageInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageInfoImplCopyWith<_$PageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
