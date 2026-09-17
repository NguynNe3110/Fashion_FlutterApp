import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:app/app.dart';
import 'package:domain/domain.dart';

part 'checkout_event.freezed.dart';

abstract class CheckoutEvent extends BaseBlocEvent {
  const CheckoutEvent();
}

@freezed
sealed class CheckoutPageInitiated extends CheckoutEvent
    with _$CheckoutPageInitiated {
  const CheckoutPageInitiated._();
  const factory CheckoutPageInitiated({
    required List<CartItemEntity> selectedItems,
    required List<ProductEntity> products,
    required CartSummaryEntity summary,
  }) = _CheckoutPageInitiated;
}

@freezed
sealed class CheckoutSubmitted extends CheckoutEvent with _$CheckoutSubmitted {
  const CheckoutSubmitted._();
  const factory CheckoutSubmitted() = _CheckoutSubmitted;
}

@freezed
sealed class CheckoutAddressSelected extends CheckoutEvent
    with _$CheckoutAddressSelected {
  const CheckoutAddressSelected._();
  const factory CheckoutAddressSelected({required String addressId}) =
      _CheckoutAddressSelected;
}

@freezed
sealed class CheckoutShippingSelected extends CheckoutEvent
    with _$CheckoutShippingSelected {
  const CheckoutShippingSelected._();
  const factory CheckoutShippingSelected({required double shippingFee}) =
      _CheckoutShippingSelected;
}

@freezed
sealed class CheckoutPaymentSelected extends CheckoutEvent
    with _$CheckoutPaymentSelected {
  const CheckoutPaymentSelected._();
  const factory CheckoutPaymentSelected({required String paymentMethod}) =
      _CheckoutPaymentSelected;
}
