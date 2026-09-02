// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MainPageInitiated {
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of MainPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainPageInitiatedCopyWith<MainPageInitiated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageInitiatedCopyWith<$Res> {
  factory $MainPageInitiatedCopyWith(
    MainPageInitiated value,
    $Res Function(MainPageInitiated) then,
  ) = _$MainPageInitiatedCopyWithImpl<$Res, MainPageInitiated>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$MainPageInitiatedCopyWithImpl<$Res, $Val extends MainPageInitiated>
    implements $MainPageInitiatedCopyWith<$Res> {
  _$MainPageInitiatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainPageInitiated
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
abstract class _$$MainPageInitiatedImplCopyWith<$Res>
    implements $MainPageInitiatedCopyWith<$Res> {
  factory _$$MainPageInitiatedImplCopyWith(
    _$MainPageInitiatedImpl value,
    $Res Function(_$MainPageInitiatedImpl) then,
  ) = __$$MainPageInitiatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$MainPageInitiatedImplCopyWithImpl<$Res>
    extends _$MainPageInitiatedCopyWithImpl<$Res, _$MainPageInitiatedImpl>
    implements _$$MainPageInitiatedImplCopyWith<$Res> {
  __$$MainPageInitiatedImplCopyWithImpl(
    _$MainPageInitiatedImpl _value,
    $Res Function(_$MainPageInitiatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MainPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$MainPageInitiatedImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$MainPageInitiatedImpl extends _MainPageInitiated {
  const _$MainPageInitiatedImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'MainPageInitiated(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageInitiatedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MainPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPageInitiatedImplCopyWith<_$MainPageInitiatedImpl> get copyWith =>
      __$$MainPageInitiatedImplCopyWithImpl<_$MainPageInitiatedImpl>(
        this,
        _$identity,
      );
}

abstract class _MainPageInitiated extends MainPageInitiated {
  const factory _MainPageInitiated({required final int id}) =
      _$MainPageInitiatedImpl;
  const _MainPageInitiated._() : super._();

  @override
  int get id;

  /// Create a copy of MainPageInitiated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageInitiatedImplCopyWith<_$MainPageInitiatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
