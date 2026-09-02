// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ItemDetailPageInitiated {
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of ItemDetailPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemDetailPageInitiatedCopyWith<ItemDetailPageInitiated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDetailPageInitiatedCopyWith<$Res> {
  factory $ItemDetailPageInitiatedCopyWith(
    ItemDetailPageInitiated value,
    $Res Function(ItemDetailPageInitiated) then,
  ) = _$ItemDetailPageInitiatedCopyWithImpl<$Res, ItemDetailPageInitiated>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ItemDetailPageInitiatedCopyWithImpl<
  $Res,
  $Val extends ItemDetailPageInitiated
>
    implements $ItemDetailPageInitiatedCopyWith<$Res> {
  _$ItemDetailPageInitiatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemDetailPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ItemDetailPageInitiatedImplCopyWith<$Res>
    implements $ItemDetailPageInitiatedCopyWith<$Res> {
  factory _$$ItemDetailPageInitiatedImplCopyWith(
    _$ItemDetailPageInitiatedImpl value,
    $Res Function(_$ItemDetailPageInitiatedImpl) then,
  ) = __$$ItemDetailPageInitiatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ItemDetailPageInitiatedImplCopyWithImpl<$Res>
    extends
        _$ItemDetailPageInitiatedCopyWithImpl<
          $Res,
          _$ItemDetailPageInitiatedImpl
        >
    implements _$$ItemDetailPageInitiatedImplCopyWith<$Res> {
  __$$ItemDetailPageInitiatedImplCopyWithImpl(
    _$ItemDetailPageInitiatedImpl _value,
    $Res Function(_$ItemDetailPageInitiatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemDetailPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$ItemDetailPageInitiatedImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ItemDetailPageInitiatedImpl extends _ItemDetailPageInitiated {
  const _$ItemDetailPageInitiatedImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'ItemDetailPageInitiated(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDetailPageInitiatedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ItemDetailPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDetailPageInitiatedImplCopyWith<_$ItemDetailPageInitiatedImpl>
  get copyWith =>
      __$$ItemDetailPageInitiatedImplCopyWithImpl<
        _$ItemDetailPageInitiatedImpl
      >(this, _$identity);
}

abstract class _ItemDetailPageInitiated extends ItemDetailPageInitiated {
  const factory _ItemDetailPageInitiated({required final int id}) =
      _$ItemDetailPageInitiatedImpl;
  const _ItemDetailPageInitiated._() : super._();

  @override
  int get id;

  /// Create a copy of ItemDetailPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemDetailPageInitiatedImplCopyWith<_$ItemDetailPageInitiatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
