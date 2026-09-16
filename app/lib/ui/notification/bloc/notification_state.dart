import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'notification_state.freezed.dart';

@freezed
sealed class NotificationState extends BaseBlocState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<Map<String, String>> notifications,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _NotificationState;
}
