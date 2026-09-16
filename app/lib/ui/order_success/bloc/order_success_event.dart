import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'order_success_event.freezed.dart';

abstract class OrderSuccessEvent extends BaseBlocEvent {
  const OrderSuccessEvent();
}

@freezed
class ContinueShoppingPressed extends OrderSuccessEvent
    with _$ContinueShoppingPressed {
  const factory ContinueShoppingPressed() = _ContinueShoppingPressed;
}

@freezed
class ViewOrderHistoryPressed extends OrderSuccessEvent
    with _$ViewOrderHistoryPressed {
  const factory ViewOrderHistoryPressed() = _ViewOrderHistoryPressed;
}
