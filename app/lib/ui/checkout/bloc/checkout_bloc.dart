import 'dart:async';

import 'package:app/app.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'checkout.dart';

@injectable
class CheckoutBloc extends BaseBloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(
    this._checkoutSelectedItemsUseCase,
    this._getMeUseCase,
    this._getAddressesUseCase,
  ) : super(const CheckoutState()) {
    on<CheckoutPageInitiated>(_onCheckoutPageInitiated, transformer: log());
    on<CheckoutSubmitted>(_onCheckoutSubmitted, transformer: log());
    on<CheckoutAddressSelected>(_onCheckoutAddressSelected, transformer: log());
    on<CheckoutShippingSelected>(
      _onCheckoutShippingSelected,
      transformer: log(),
    );
    on<CheckoutPaymentSelected>(_onCheckoutPaymentSelected, transformer: log());
  }

  final CheckoutSelectedItemsUseCase _checkoutSelectedItemsUseCase;
  final GetMeUseCase _getMeUseCase;
  final GetAddressesUseCase _getAddressesUseCase;

  FutureOr<void> _onCheckoutPageInitiated(
    CheckoutPageInitiated event,
    Emitter<CheckoutState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        emit(
          state.copyWith(
            selectedItems: event.selectedItems,
            products: event.products,
            summary: event.summary,
            shippingFee: event.summary.shippingFee ?? 30000,
            loadException: null,
          ),
        );

        final user = await _getMeUseCase.execute(const GetMeUseCaseInput());
        final output = await _getAddressesUseCase.execute(
          GetAddressesUseCaseInput(userId: user.profile.id),
        );
        String? selectedAddressId;
        for (final address in output.addresses) {
          if (address.isDefault) {
            selectedAddressId = address.id;
            break;
          }
        }
        selectedAddressId ??= output.addresses.isEmpty
            ? null
            : output.addresses.first.id;
        emit(
          state.copyWith(
            addresses: output.addresses,
            selectedAddressId: selectedAddressId,
          ),
        );
      },
      doOnSubscribe: () async => emit(state.copyWith(isLoading: true)),
      doOnSuccessOrError: () async => emit(state.copyWith(isLoading: false)),
      doOnError: (error) async => emit(state.copyWith(loadException: error)),
      handleLoading: false,
    );
  }

  FutureOr<void> _onCheckoutSubmitted(
    CheckoutSubmitted event,
    Emitter<CheckoutState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final address = state.selectedAddress;
        if (address == null) {
          navigator.showErrorSnackBar('Vui lòng thêm địa chỉ nhận hàng');
          return;
        }

        final user = await _getMeUseCase.execute(const GetMeUseCaseInput());
        final output = await _checkoutSelectedItemsUseCase.execute(
          CheckoutSelectedItemsUseCaseInput(
            userId: user.profile.id,
            selectedCartItemIds: state.selectedItems
                .map((item) => item.id)
                .toList(growable: false),
            subtotalPrice: state.summary.subtotal,
            shippingFee: state.shippingFee,
            discountAmount: state.summary.discount,
            totalPrice: state.total,
            address: address,
            paymentMethod: state.paymentMethod,
          ),
        );

        await navigator.replace(
          AppRouteInfo.orderSuccess(
            orderCode: output.order.id.substring(0, 8).toUpperCase(),
          ),
        );
      },
      doOnSubscribe: () async => emit(state.copyWith(isSubmitting: true)),
      doOnSuccessOrError: () async => emit(state.copyWith(isSubmitting: false)),
      handleLoading: false,
    );
  }

  void _onCheckoutAddressSelected(
    CheckoutAddressSelected event,
    Emitter<CheckoutState> emit,
  ) {
    emit(state.copyWith(selectedAddressId: event.addressId));
  }

  void _onCheckoutShippingSelected(
    CheckoutShippingSelected event,
    Emitter<CheckoutState> emit,
  ) {
    emit(state.copyWith(shippingFee: event.shippingFee));
  }

  void _onCheckoutPaymentSelected(
    CheckoutPaymentSelected event,
    Emitter<CheckoutState> emit,
  ) {
    emit(state.copyWith(paymentMethod: event.paymentMethod));
  }
}
