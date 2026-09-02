// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchPageInitiated {
  String get id => throw _privateConstructorUsedError;

  /// Create a copy of SearchPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchPageInitiatedCopyWith<SearchPageInitiated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageInitiatedCopyWith<$Res> {
  factory $SearchPageInitiatedCopyWith(
    SearchPageInitiated value,
    $Res Function(SearchPageInitiated) then,
  ) = _$SearchPageInitiatedCopyWithImpl<$Res, SearchPageInitiated>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$SearchPageInitiatedCopyWithImpl<$Res, $Val extends SearchPageInitiated>
    implements $SearchPageInitiatedCopyWith<$Res> {
  _$SearchPageInitiatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchPageInitiatedImplCopyWith<$Res>
    implements $SearchPageInitiatedCopyWith<$Res> {
  factory _$$SearchPageInitiatedImplCopyWith(
    _$SearchPageInitiatedImpl value,
    $Res Function(_$SearchPageInitiatedImpl) then,
  ) = __$$SearchPageInitiatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$SearchPageInitiatedImplCopyWithImpl<$Res>
    extends _$SearchPageInitiatedCopyWithImpl<$Res, _$SearchPageInitiatedImpl>
    implements _$$SearchPageInitiatedImplCopyWith<$Res> {
  __$$SearchPageInitiatedImplCopyWithImpl(
    _$SearchPageInitiatedImpl _value,
    $Res Function(_$SearchPageInitiatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$SearchPageInitiatedImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchPageInitiatedImpl extends _SearchPageInitiated {
  const _$SearchPageInitiatedImpl({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'SearchPageInitiated(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPageInitiatedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SearchPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPageInitiatedImplCopyWith<_$SearchPageInitiatedImpl> get copyWith =>
      __$$SearchPageInitiatedImplCopyWithImpl<_$SearchPageInitiatedImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchPageInitiated extends SearchPageInitiated {
  const factory _SearchPageInitiated({required final String id}) =
      _$SearchPageInitiatedImpl;
  const _SearchPageInitiated._() : super._();

  @override
  String get id;

  /// Create a copy of SearchPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchPageInitiatedImplCopyWith<_$SearchPageInitiatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
