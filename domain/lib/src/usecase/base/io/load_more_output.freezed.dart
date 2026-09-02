// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_more_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoadMoreOutput<T> {
  List<T> get data => throw _privateConstructorUsedError;
  Object? get otherData => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isRefreshSuccess => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;

  /// Create a copy of LoadMoreOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoadMoreOutputCopyWith<T, LoadMoreOutput<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadMoreOutputCopyWith<T, $Res> {
  factory $LoadMoreOutputCopyWith(
    LoadMoreOutput<T> value,
    $Res Function(LoadMoreOutput<T>) then,
  ) = _$LoadMoreOutputCopyWithImpl<T, $Res, LoadMoreOutput<T>>;
  @useResult
  $Res call({
    List<T> data,
    Object? otherData,
    int page,
    bool isRefreshSuccess,
    int offset,
    bool isLastPage,
  });
}

/// @nodoc
class _$LoadMoreOutputCopyWithImpl<T, $Res, $Val extends LoadMoreOutput<T>>
    implements $LoadMoreOutputCopyWith<T, $Res> {
  _$LoadMoreOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoadMoreOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? otherData = freezed,
    Object? page = null,
    Object? isRefreshSuccess = null,
    Object? offset = null,
    Object? isLastPage = null,
  }) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<T>,
            otherData: freezed == otherData ? _value.otherData : otherData,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            isRefreshSuccess: null == isRefreshSuccess
                ? _value.isRefreshSuccess
                : isRefreshSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
            offset: null == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int,
            isLastPage: null == isLastPage
                ? _value.isLastPage
                : isLastPage // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadMoreOutputImplCopyWith<T, $Res>
    implements $LoadMoreOutputCopyWith<T, $Res> {
  factory _$$LoadMoreOutputImplCopyWith(
    _$LoadMoreOutputImpl<T> value,
    $Res Function(_$LoadMoreOutputImpl<T>) then,
  ) = __$$LoadMoreOutputImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    List<T> data,
    Object? otherData,
    int page,
    bool isRefreshSuccess,
    int offset,
    bool isLastPage,
  });
}

/// @nodoc
class __$$LoadMoreOutputImplCopyWithImpl<T, $Res>
    extends _$LoadMoreOutputCopyWithImpl<T, $Res, _$LoadMoreOutputImpl<T>>
    implements _$$LoadMoreOutputImplCopyWith<T, $Res> {
  __$$LoadMoreOutputImplCopyWithImpl(
    _$LoadMoreOutputImpl<T> _value,
    $Res Function(_$LoadMoreOutputImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of LoadMoreOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? otherData = freezed,
    Object? page = null,
    Object? isRefreshSuccess = null,
    Object? offset = null,
    Object? isLastPage = null,
  }) {
    return _then(
      _$LoadMoreOutputImpl<T>(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        otherData: freezed == otherData ? _value.otherData : otherData,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        isRefreshSuccess: null == isRefreshSuccess
            ? _value.isRefreshSuccess
            : isRefreshSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
        isLastPage: null == isLastPage
            ? _value.isLastPage
            : isLastPage // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoadMoreOutputImpl<T> extends _LoadMoreOutput<T> {
  const _$LoadMoreOutputImpl({
    required final List<T> data,
    this.otherData = null,
    this.page = PagingConstants.initialPage,
    this.isRefreshSuccess = false,
    this.offset = 0,
    this.isLastPage = false,
  }) : _data = data,
       super._();

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final Object? otherData;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool isRefreshSuccess;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final bool isLastPage;

  @override
  String toString() {
    return 'LoadMoreOutput<$T>(data: $data, otherData: $otherData, page: $page, isRefreshSuccess: $isRefreshSuccess, offset: $offset, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreOutputImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.otherData, otherData) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isRefreshSuccess, isRefreshSuccess) ||
                other.isRefreshSuccess == isRefreshSuccess) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    const DeepCollectionEquality().hash(otherData),
    page,
    isRefreshSuccess,
    offset,
    isLastPage,
  );

  /// Create a copy of LoadMoreOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreOutputImplCopyWith<T, _$LoadMoreOutputImpl<T>> get copyWith =>
      __$$LoadMoreOutputImplCopyWithImpl<T, _$LoadMoreOutputImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _LoadMoreOutput<T> extends LoadMoreOutput<T> {
  const factory _LoadMoreOutput({
    required final List<T> data,
    final Object? otherData,
    final int page,
    final bool isRefreshSuccess,
    final int offset,
    final bool isLastPage,
  }) = _$LoadMoreOutputImpl<T>;
  const _LoadMoreOutput._() : super._();

  @override
  List<T> get data;
  @override
  Object? get otherData;
  @override
  int get page;
  @override
  bool get isRefreshSuccess;
  @override
  int get offset;
  @override
  bool get isLastPage;

  /// Create a copy of LoadMoreOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreOutputImplCopyWith<T, _$LoadMoreOutputImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
