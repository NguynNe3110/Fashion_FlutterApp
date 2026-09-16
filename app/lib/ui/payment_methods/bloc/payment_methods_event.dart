import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'payment_methods_event.freezed.dart';

abstract class PaymentMethodsEvent extends BaseBlocEvent {
  const PaymentMethodsEvent();
}

@freezed
class PaymentMethodsPageInitiated extends PaymentMethodsEvent
    with _$PaymentMethodsPageInitiated {
  const factory PaymentMethodsPageInitiated() = _PaymentMethodsPageInitiated;
}

@freezed
class SelectPaymentMethodPressed extends PaymentMethodsEvent
    with _$SelectPaymentMethodPressed {
  const factory SelectPaymentMethodPressed({required String methodId}) =
      _SelectPaymentMethodPressed;
}
