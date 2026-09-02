import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'home_event.freezed.dart';

abstract class HomeEvent extends BaseBlocEvent {
  const HomeEvent();
}

@freezed
sealed class HomePageInitiated extends HomeEvent with _$HomePageInitiated {
  const HomePageInitiated._();
  const factory HomePageInitiated() = _HomePageInitiated;
}

@freezed
sealed class HomePageRefreshed extends HomeEvent with _$HomePageRefreshed {
  const HomePageRefreshed._();
  const factory HomePageRefreshed({
    required Completer<void> completer,
  }) = _HomePageRefreshed;
}

@freezed
sealed class UserLoadMore extends HomeEvent with _$UserLoadMore {
  const UserLoadMore._();
  const factory UserLoadMore() = _UserLoadMore;
}
