import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'app_state.freezed.dart';

@freezed
sealed class AppState extends BaseBlocState with _$AppState {
  const AppState._();
  const factory AppState({
    @Default(LanguageCode.en) LanguageCode languageCode,
    @Default(false) bool isLoggedIn,
    @Default(false) bool isDarkTheme,
  }) = _AppState;
}
