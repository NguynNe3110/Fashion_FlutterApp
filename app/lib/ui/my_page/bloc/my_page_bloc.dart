import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:app/app.dart';
import 'package:shared/shared.dart';

@injectable
class MyPageBloc extends BaseBloc<MyPageEvent, MyPageState> {
  MyPageBloc(
    this._getMeUseCase,
    this._logoutUseCase,
    this._updateProfileUseCase,
    this._getAccountStatsUseCase,
  ) : super(const MyPageState()) {
    on<MyPagePageInitiated>(_onPageInitiated, transformer: log());
    on<LogoutButtonPressed>(_onLogoutButtonPressed, transformer: log());
    on<ProfileSavePressed>(_onProfileSavePressed, transformer: log());
  }

  final GetMeUseCase _getMeUseCase;
  final LogoutUseCase _logoutUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetAccountStatsUseCase _getAccountStatsUseCase;

  FutureOr<void> _onPageInitiated(
    // handel loading manual,
    MyPagePageInitiated event,
    Emitter<MyPageState> emit,
  ) async {
    emit(state.copyWith(isShimmerLoading: true));
    try {
      final output = await _getMeUseCase.execute(const GetMeUseCaseInput());
      final stats = await _getAccountStatsUseCase.execute(
        GetAccountStatsInput(userId: output.profile.id),
      );
      emit(
        state.copyWith(
          profile: output.profile,
          stats: stats.stats,
          isShimmerLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isShimmerLoading: false,
          loadException: e is AppException ? e : AppUncaughtException(e),
        ),
      );
    }
  }

  FutureOr<void> _onLogoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<MyPageState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _logoutUseCase.execute(const LogoutInput());
      },
    );
  }

  FutureOr<void> _onProfileSavePressed(
    ProfileSavePressed event,
    Emitter<MyPageState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final current =
            state.profile ??
            (await _getMeUseCase.execute(const GetMeUseCaseInput())).profile;
        final output = await _updateProfileUseCase.execute(
          UpdateProfileUseCaseInput(
            userId: current.id,
            data: UpdateProfileRequestEntity(
              fullName: event.fullName.trim(),
              phoneNumber: event.phoneNumber.trim().isEmpty
                  ? null
                  : event.phoneNumber.trim(),
              avatarUrl: current.avatarUrl,
              dateOfBirth: event.dateOfBirth,
              gender: event.gender,
              marketingOptIn: event.marketingOptIn,
            ),
          ),
        );
        emit(state.copyWith(profile: output.profile, saveSucceeded: true));
      },
      doOnSubscribe: () async =>
          emit(state.copyWith(isSaving: true, saveSucceeded: false)),
      doOnSuccessOrError: () async => emit(state.copyWith(isSaving: false)),
      handleLoading: false,
    );
  }
}
