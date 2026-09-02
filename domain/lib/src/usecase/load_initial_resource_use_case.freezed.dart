// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_initial_resource_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoadInitialResourceInput {}

/// @nodoc
abstract class $LoadInitialResourceInputCopyWith<$Res> {
  factory $LoadInitialResourceInputCopyWith(
    LoadInitialResourceInput value,
    $Res Function(LoadInitialResourceInput) then,
  ) = _$LoadInitialResourceInputCopyWithImpl<$Res, LoadInitialResourceInput>;
}

/// @nodoc
class _$LoadInitialResourceInputCopyWithImpl<
  $Res,
  $Val extends LoadInitialResourceInput
>
    implements $LoadInitialResourceInputCopyWith<$Res> {
  _$LoadInitialResourceInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoadInitialResourceInput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadInitialResourceInputImplCopyWith<$Res> {
  factory _$$LoadInitialResourceInputImplCopyWith(
    _$LoadInitialResourceInputImpl value,
    $Res Function(_$LoadInitialResourceInputImpl) then,
  ) = __$$LoadInitialResourceInputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInitialResourceInputImplCopyWithImpl<$Res>
    extends
        _$LoadInitialResourceInputCopyWithImpl<
          $Res,
          _$LoadInitialResourceInputImpl
        >
    implements _$$LoadInitialResourceInputImplCopyWith<$Res> {
  __$$LoadInitialResourceInputImplCopyWithImpl(
    _$LoadInitialResourceInputImpl _value,
    $Res Function(_$LoadInitialResourceInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoadInitialResourceInput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadInitialResourceInputImpl extends _LoadInitialResourceInput {
  const _$LoadInitialResourceInputImpl() : super._();

  @override
  String toString() {
    return 'LoadInitialResourceInput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInitialResourceInputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _LoadInitialResourceInput extends LoadInitialResourceInput {
  const factory _LoadInitialResourceInput() = _$LoadInitialResourceInputImpl;
  const _LoadInitialResourceInput._() : super._();
}

/// @nodoc
mixin _$LoadInitialResourceOutput {
  List<InitialAppRoute> get initialRoutes => throw _privateConstructorUsedError;

  /// Create a copy of LoadInitialResourceOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoadInitialResourceOutputCopyWith<LoadInitialResourceOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadInitialResourceOutputCopyWith<$Res> {
  factory $LoadInitialResourceOutputCopyWith(
    LoadInitialResourceOutput value,
    $Res Function(LoadInitialResourceOutput) then,
  ) = _$LoadInitialResourceOutputCopyWithImpl<$Res, LoadInitialResourceOutput>;
  @useResult
  $Res call({List<InitialAppRoute> initialRoutes});
}

/// @nodoc
class _$LoadInitialResourceOutputCopyWithImpl<
  $Res,
  $Val extends LoadInitialResourceOutput
>
    implements $LoadInitialResourceOutputCopyWith<$Res> {
  _$LoadInitialResourceOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoadInitialResourceOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? initialRoutes = null}) {
    return _then(
      _value.copyWith(
            initialRoutes: null == initialRoutes
                ? _value.initialRoutes
                : initialRoutes // ignore: cast_nullable_to_non_nullable
                      as List<InitialAppRoute>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadInitialResourceOutputImplCopyWith<$Res>
    implements $LoadInitialResourceOutputCopyWith<$Res> {
  factory _$$LoadInitialResourceOutputImplCopyWith(
    _$LoadInitialResourceOutputImpl value,
    $Res Function(_$LoadInitialResourceOutputImpl) then,
  ) = __$$LoadInitialResourceOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InitialAppRoute> initialRoutes});
}

/// @nodoc
class __$$LoadInitialResourceOutputImplCopyWithImpl<$Res>
    extends
        _$LoadInitialResourceOutputCopyWithImpl<
          $Res,
          _$LoadInitialResourceOutputImpl
        >
    implements _$$LoadInitialResourceOutputImplCopyWith<$Res> {
  __$$LoadInitialResourceOutputImplCopyWithImpl(
    _$LoadInitialResourceOutputImpl _value,
    $Res Function(_$LoadInitialResourceOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoadInitialResourceOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? initialRoutes = null}) {
    return _then(
      _$LoadInitialResourceOutputImpl(
        initialRoutes: null == initialRoutes
            ? _value._initialRoutes
            : initialRoutes // ignore: cast_nullable_to_non_nullable
                  as List<InitialAppRoute>,
      ),
    );
  }
}

/// @nodoc

class _$LoadInitialResourceOutputImpl extends _LoadInitialResourceOutput {
  const _$LoadInitialResourceOutputImpl({
    final List<InitialAppRoute> initialRoutes = const [InitialAppRoute.main],
  }) : _initialRoutes = initialRoutes,
       super._();

  final List<InitialAppRoute> _initialRoutes;
  @override
  @JsonKey()
  List<InitialAppRoute> get initialRoutes {
    if (_initialRoutes is EqualUnmodifiableListView) return _initialRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialRoutes);
  }

  @override
  String toString() {
    return 'LoadInitialResourceOutput(initialRoutes: $initialRoutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInitialResourceOutputImpl &&
            const DeepCollectionEquality().equals(
              other._initialRoutes,
              _initialRoutes,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_initialRoutes),
  );

  /// Create a copy of LoadInitialResourceOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInitialResourceOutputImplCopyWith<_$LoadInitialResourceOutputImpl>
  get copyWith =>
      __$$LoadInitialResourceOutputImplCopyWithImpl<
        _$LoadInitialResourceOutputImpl
      >(this, _$identity);
}

abstract class _LoadInitialResourceOutput extends LoadInitialResourceOutput {
  const factory _LoadInitialResourceOutput({
    final List<InitialAppRoute> initialRoutes,
  }) = _$LoadInitialResourceOutputImpl;
  const _LoadInitialResourceOutput._() : super._();

  @override
  List<InitialAppRoute> get initialRoutes;

  /// Create a copy of LoadInitialResourceOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInitialResourceOutputImplCopyWith<_$LoadInitialResourceOutputImpl>
  get copyWith => throw _privateConstructorUsedError;
}
