import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'onboarding_event.freezed.dart';

abstract class OnboardingEvent extends BaseBlocEvent {
  const OnboardingEvent();
}

@freezed
class OnboardingStartedPressed extends OnboardingEvent
    with _$OnboardingStartedPressed {
  const factory OnboardingStartedPressed() = _OnboardingStartedPressed;
}
