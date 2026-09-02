// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popup_button.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PopupButton {
  String? get text => throw _privateConstructorUsedError;
  Func0<void>? get onPressed => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Create a copy of PopupButton
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopupButtonCopyWith<PopupButton> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopupButtonCopyWith<$Res> {
  factory $PopupButtonCopyWith(
    PopupButton value,
    $Res Function(PopupButton) then,
  ) = _$PopupButtonCopyWithImpl<$Res, PopupButton>;
  @useResult
  $Res call({String? text, Func0<void>? onPressed, bool isDefault});
}

/// @nodoc
class _$PopupButtonCopyWithImpl<$Res, $Val extends PopupButton>
    implements $PopupButtonCopyWith<$Res> {
  _$PopupButtonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopupButton
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? onPressed = freezed,
    Object? isDefault = null,
  }) {
    return _then(
      _value.copyWith(
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            onPressed: freezed == onPressed
                ? _value.onPressed
                : onPressed // ignore: cast_nullable_to_non_nullable
                      as Func0<void>?,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PopupButtonImplCopyWith<$Res>
    implements $PopupButtonCopyWith<$Res> {
  factory _$$PopupButtonImplCopyWith(
    _$PopupButtonImpl value,
    $Res Function(_$PopupButtonImpl) then,
  ) = __$$PopupButtonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, Func0<void>? onPressed, bool isDefault});
}

/// @nodoc
class __$$PopupButtonImplCopyWithImpl<$Res>
    extends _$PopupButtonCopyWithImpl<$Res, _$PopupButtonImpl>
    implements _$$PopupButtonImplCopyWith<$Res> {
  __$$PopupButtonImplCopyWithImpl(
    _$PopupButtonImpl _value,
    $Res Function(_$PopupButtonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PopupButton
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? onPressed = freezed,
    Object? isDefault = null,
  }) {
    return _then(
      _$PopupButtonImpl(
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        onPressed: freezed == onPressed
            ? _value.onPressed
            : onPressed // ignore: cast_nullable_to_non_nullable
                  as Func0<void>?,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$PopupButtonImpl extends _PopupButton {
  const _$PopupButtonImpl({this.text, this.onPressed, this.isDefault = false})
    : super._();

  @override
  final String? text;
  @override
  final Func0<void>? onPressed;
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'PopupButton(text: $text, onPressed: $onPressed, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopupButtonImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, onPressed, isDefault);

  /// Create a copy of PopupButton
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopupButtonImplCopyWith<_$PopupButtonImpl> get copyWith =>
      __$$PopupButtonImplCopyWithImpl<_$PopupButtonImpl>(this, _$identity);
}

abstract class _PopupButton extends PopupButton {
  const factory _PopupButton({
    final String? text,
    final Func0<void>? onPressed,
    final bool isDefault,
  }) = _$PopupButtonImpl;
  const _PopupButton._() : super._();

  @override
  String? get text;
  @override
  Func0<void>? get onPressed;
  @override
  bool get isDefault;

  /// Create a copy of PopupButton
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopupButtonImplCopyWith<_$PopupButtonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
