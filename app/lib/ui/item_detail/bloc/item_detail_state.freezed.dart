// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ItemDetailState {
  String get id => throw _privateConstructorUsedError;

  /// Create a copy of ItemDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemDetailStateCopyWith<ItemDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDetailStateCopyWith<$Res> {
  factory $ItemDetailStateCopyWith(
    ItemDetailState value,
    $Res Function(ItemDetailState) then,
  ) = _$ItemDetailStateCopyWithImpl<$Res, ItemDetailState>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ItemDetailStateCopyWithImpl<$Res, $Val extends ItemDetailState>
    implements $ItemDetailStateCopyWith<$Res> {
  _$ItemDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemDetailState
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
abstract class _$$ItemDetailStateImplCopyWith<$Res>
    implements $ItemDetailStateCopyWith<$Res> {
  factory _$$ItemDetailStateImplCopyWith(
    _$ItemDetailStateImpl value,
    $Res Function(_$ItemDetailStateImpl) then,
  ) = __$$ItemDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ItemDetailStateImplCopyWithImpl<$Res>
    extends _$ItemDetailStateCopyWithImpl<$Res, _$ItemDetailStateImpl>
    implements _$$ItemDetailStateImplCopyWith<$Res> {
  __$$ItemDetailStateImplCopyWithImpl(
    _$ItemDetailStateImpl _value,
    $Res Function(_$ItemDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$ItemDetailStateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ItemDetailStateImpl extends _ItemDetailState {
  const _$ItemDetailStateImpl({this.id = ''}) : super._();

  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'ItemDetailState(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDetailStateImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ItemDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDetailStateImplCopyWith<_$ItemDetailStateImpl> get copyWith =>
      __$$ItemDetailStateImplCopyWithImpl<_$ItemDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ItemDetailState extends ItemDetailState {
  const factory _ItemDetailState({final String id}) = _$ItemDetailStateImpl;
  const _ItemDetailState._() : super._();

  @override
  String get id;

  /// Create a copy of ItemDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemDetailStateImplCopyWith<_$ItemDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
