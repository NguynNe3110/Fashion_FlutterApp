import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState extends BaseBlocState with _$OnboardingState {
  const factory OnboardingState({
    @Default(0) int currentIndex,
  }) = _OnboardingState;
}
