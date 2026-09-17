import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

part 'checkout_selected_items_use_case.freezed.dart';

@Injectable()
class CheckoutSelectedItemsUseCase
    extends
        BaseFutureUseCase<
          CheckoutSelectedItemsUseCaseInput,
          CheckoutSelectedItemsUseCaseOutput
        > {
  final CartItemRepository _cartItemRepository;
  final OrderRepository _orderRepository;

  CheckoutSelectedItemsUseCase(this._cartItemRepository, this._orderRepository);

  @protected
  @override
  Future<CheckoutSelectedItemsUseCaseOutput> buildUseCase(
    CheckoutSelectedItemsUseCaseInput input,
  ) async {
    final allCartItems = await _cartItemRepository.getCartItems(
      userId: input.userId,
    );

    final selectedItems = allCartItems
        .where((item) => input.selectedCartItemIds.contains(item.id))
        .toList();

    if (selectedItems.isEmpty) {
      throw const ValidationException(ValidationExceptionKind.noItemSelected);
    }

    final orderRequest = CreateOrderRequestEntity(
      userId: input.userId,
      addressId: input.address.id,
      selectedCartItemIds: input.selectedCartItemIds,
      subtotalPrice: input.subtotalPrice,
      shippingFee: input.shippingFee,
      discountAmount: input.discountAmount,
      totalPrice: input.totalPrice,
      receiverName: input.address.receiverName,
      phoneNumber: input.address.phoneNumber,
      addressLine: input.address.addressLine,
      city: input.address.city,
      district: input.address.district,
      ward: input.address.ward,
      postalCode: input.address.postalCode,
      paymentMethod: input.paymentMethod,
      status: input.status,
      note: input.note,
    );

    final order = await _orderRepository.createOrder(orderData: orderRequest);

    return CheckoutSelectedItemsUseCaseOutput(order: order);
  }
}

@freezed
sealed class CheckoutSelectedItemsUseCaseInput extends BaseInput
    with _$CheckoutSelectedItemsUseCaseInput {
  const CheckoutSelectedItemsUseCaseInput._();
  const factory CheckoutSelectedItemsUseCaseInput({
    required String userId,
    required List<String> selectedCartItemIds,
    required double subtotalPrice,
    required double shippingFee,
    required double discountAmount,
    required double totalPrice,
    required AddressEntity address,
    String? paymentMethod,
    String? status,
    String? note,
  }) = _CheckoutSelectedItemsUseCaseInput;
}

@freezed
sealed class CheckoutSelectedItemsUseCaseOutput extends BaseOutput
    with _$CheckoutSelectedItemsUseCaseOutput {
  const CheckoutSelectedItemsUseCaseOutput._();
  const factory CheckoutSelectedItemsUseCaseOutput({
    required OrderEntity order,
  }) = _CheckoutSelectedItemsUseCaseOutput;
}
