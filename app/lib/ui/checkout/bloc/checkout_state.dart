import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:app/app.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

part 'checkout_state.freezed.dart';

@freezed
sealed class CheckoutState extends BaseBlocState with _$CheckoutState {
  const CheckoutState._();

  const factory CheckoutState({
    @Default([]) List<CartItemEntity> selectedItems,
    @Default([]) List<ProductEntity> products,
    @Default([]) List<AddressEntity> addresses,
    String? selectedAddressId,
    @Default('cod') String paymentMethod,
    @Default(30000) double shippingFee,
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    AppException? loadException,
    @Default(CartSummaryEntity()) CartSummaryEntity summary,
  }) = _CheckoutState;

  AddressEntity? get selectedAddress {
    for (final address in addresses) {
      if (address.id == selectedAddressId) return address;
    }
    return null;
  }

  double get total => summary.subtotal + shippingFee - summary.discount;
}
