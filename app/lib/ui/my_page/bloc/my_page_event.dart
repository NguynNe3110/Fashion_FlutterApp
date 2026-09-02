import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'my_page_event.freezed.dart';

abstract class MyPageEvent extends BaseBlocEvent {
  const MyPageEvent();
}

@freezed
sealed class MyPagePageInitiated extends MyPageEvent
    with _$MyPagePageInitiated {
  const MyPagePageInitiated._();
  const factory MyPagePageInitiated({
    required int id,
  }) = _MyPagePageInitiated;
}

@freezed
sealed class LogoutButtonPressed extends MyPageEvent
    with _$LogoutButtonPressed {
  const LogoutButtonPressed._();
  const factory LogoutButtonPressed() = _LogoutButtonPressed;
}
