import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/app.dart';

part 'notification_event.freezed.dart';

abstract class NotificationEvent extends BaseBlocEvent {
  const NotificationEvent();
}

@freezed
sealed class NotificationPageInitiated extends NotificationEvent
    with _$NotificationPageInitiated {
  const NotificationPageInitiated._();
  const factory NotificationPageInitiated() = _NotificationPageInitiated;
}
