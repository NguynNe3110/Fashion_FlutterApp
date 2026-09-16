import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'onboarding.dart';

@injectable
class OnboardingBloc extends BaseBloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingStartedPressed>(_onOnboardingStartedPressed);
  }

  FutureOr<void> _onOnboardingStartedPressed(
    OnboardingStartedPressed event,
    Emitter<OnboardingState> emit,
  ) async {
    await navigator.replace(const AppRouteInfo.login());
  }
}
