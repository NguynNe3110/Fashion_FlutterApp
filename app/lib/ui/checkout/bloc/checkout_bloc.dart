import 'dart:async';

import 'package:app/app.dart';
import 'package:app/ui/checkout/bloc/checkout.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutBloc extends BaseBloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(
    this._checkoutSelectedItemsUseCase,
    this._getMeUseCase,
  ) : super(const CheckoutState()) {
    on<CheckoutPageInitiated>(_onCheckoutPageInitiated, transformer: log());
    on<CheckoutSubmitted>(_onCheckoutSubmitted, transformer: log());
  }

  final CheckoutSelectedItemsUseCase _checkoutSelectedItemsUseCase;
  final GetMeUseCase _getMeUseCase;

  FutureOr<void> _onCheckoutPageInitiated(
    CheckoutPageInitiated event,
    Emitter<CheckoutState> emit,
  ) async {
    // State đã được set từ constructor args qua page
  }

  FutureOr<void> _onCheckoutSubmitted(
    CheckoutSubmitted event,
    Emitter<CheckoutState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final user = await _getMeUseCase.execute(GetMeUseCaseInput());
        final userId = user.profile.id.toString();

        final productMap = {for (final p in state.products) p.id: p};

        final orderItems = state.selectedItems.map((item) {
          final product = productMap[item.productId]!;
          return OrderItemEntity(
            id: '', // Sẽ được gen ở backend/repo
            orderId: '', // Sẽ được gán sau khi tạo order
            productId: item.productId,
            variantId: item.variantId,
            productNameSnapshot: product.name,
            priceSnapshot: product.effectivePrice,
            quantity: item.quantity,
            imageUrlSnapshot: product.primaryImageUrl,
          );
        }).toList();

        await _checkoutSelectedItemsUseCase.execute(
          CheckoutSelectedItemsUseCaseInput(
            userId: userId,
            selectedCartItemIds: state.selectedItems.map((e) => e.id).toList(),
            totalPrice: state.summary.total,
            addressLine: 'Default Address', // TODO: lấy từ user input/selection
            orderItems: orderItems,
          ),
        );

        // TODO: navigate sang order success screen
        navigator.pop();
      },
    );
  }
}
