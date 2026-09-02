// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  LoadMoreOutput<User> get users => throw _privateConstructorUsedError;
  bool get isShimmerLoading => throw _privateConstructorUsedError;
  AppException? get loadUsersException => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    LoadMoreOutput<User> users,
    bool isShimmerLoading,
    AppException? loadUsersException,
  });

  $LoadMoreOutputCopyWith<User, $Res> get users;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? isShimmerLoading = null,
    Object? loadUsersException = freezed,
  }) {
    return _then(
      _value.copyWith(
            users: null == users
                ? _value.users
                : users // ignore: cast_nullable_to_non_nullable
                      as LoadMoreOutput<User>,
            isShimmerLoading: null == isShimmerLoading
                ? _value.isShimmerLoading
                : isShimmerLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            loadUsersException: freezed == loadUsersException
                ? _value.loadUsersException
                : loadUsersException // ignore: cast_nullable_to_non_nullable
                      as AppException?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoadMoreOutputCopyWith<User, $Res> get users {
    return $LoadMoreOutputCopyWith<User, $Res>(_value.users, (value) {
      return _then(_value.copyWith(users: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    LoadMoreOutput<User> users,
    bool isShimmerLoading,
    AppException? loadUsersException,
  });

  @override
  $LoadMoreOutputCopyWith<User, $Res> get users;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? isShimmerLoading = null,
    Object? loadUsersException = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        users: null == users
            ? _value.users
            : users // ignore: cast_nullable_to_non_nullable
                  as LoadMoreOutput<User>,
        isShimmerLoading: null == isShimmerLoading
            ? _value.isShimmerLoading
            : isShimmerLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        loadUsersException: freezed == loadUsersException
            ? _value.loadUsersException
            : loadUsersException // ignore: cast_nullable_to_non_nullable
                  as AppException?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  _$HomeStateImpl({
    this.users = const LoadMoreOutput<User>(data: <User>[]),
    this.isShimmerLoading = false,
    this.loadUsersException,
  }) : super._();

  @override
  @JsonKey()
  final LoadMoreOutput<User> users;
  @override
  @JsonKey()
  final bool isShimmerLoading;
  @override
  final AppException? loadUsersException;

  @override
  String toString() {
    return 'HomeState(users: $users, isShimmerLoading: $isShimmerLoading, loadUsersException: $loadUsersException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.isShimmerLoading, isShimmerLoading) ||
                other.isShimmerLoading == isShimmerLoading) &&
            (identical(other.loadUsersException, loadUsersException) ||
                other.loadUsersException == loadUsersException));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, users, isShimmerLoading, loadUsersException);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  factory _HomeState({
    final LoadMoreOutput<User> users,
    final bool isShimmerLoading,
    final AppException? loadUsersException,
  }) = _$HomeStateImpl;
  _HomeState._() : super._();

  @override
  LoadMoreOutput<User> get users;
  @override
  bool get isShimmerLoading;
  @override
  AppException? get loadUsersException;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
