import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'order_detail_event.freezed.dart';

abstract class OrderDetailEvent extends BaseBlocEvent {
  const OrderDetailEvent();
}

@freezed
class OrderDetailPageInitiated extends OrderDetailEvent
    with _$OrderDetailPageInitiated {
  const factory OrderDetailPageInitiated({required String orderId}) =
      _OrderDetailPageInitiated;
}
