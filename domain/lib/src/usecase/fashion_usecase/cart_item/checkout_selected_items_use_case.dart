import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

part 'checkout_selected_items_use_case.freezed.dart';

@Injectable()
class CheckoutSelectedItemsUseCase extends BaseFutureUseCase<CheckoutSelectedItemsUseCaseInput, CheckoutSelectedItemsUseCaseOutput> {
  final CartItemRepository _cartItemRepository;
  final OrderRepository _orderRepository;
  final OrderItemRepository _orderItemRepository;

  CheckoutSelectedItemsUseCase(
    this._cartItemRepository,
    this._orderRepository,
    this._orderItemRepository,
  );

  @protected
  @override
  Future<CheckoutSelectedItemsUseCaseOutput> buildUseCase(CheckoutSelectedItemsUseCaseInput input) async {

    final allCartItems = await _cartItemRepository.getCartItems(userId: input.userId);

    // lay item duoc chon
    final selectedItems = allCartItems.where((item) => input.selectedCartItemIds.contains(item.id)).toList();

    if (selectedItems.isEmpty) {
      throw const ValidationException(ValidationExceptionKind.noItemSelected);
    }

    // tạo order
    final order = await _orderRepository.createOrder(data: input.orderData);

    // order items
    final orderItemsData = input.orderItemsData; // Map đã chứa product_name_snapshot, price_snapshot, quantity,...

    await _orderItemRepository.createOrderItems(data: orderItemsData);

    // 5. Xóa các cart item đã checkout
    for (final item in selectedItems) {
      await _cartItemRepository.deleteCartItem(id: item.id);
    }

    return CheckoutSelectedItemsUseCaseOutput(order: order);
  }
}

@freezed
sealed class CheckoutSelectedItemsUseCaseInput extends BaseInput with _$CheckoutSelectedItemsUseCaseInput {
  const CheckoutSelectedItemsUseCaseInput._();
  const factory CheckoutSelectedItemsUseCaseInput({
    required String userId,
    required List<String> selectedCartItemIds,
    required CreateOrderRequestEntity orderData,
    required List<Map<String, dynamic>> orderItemsData,
  }) = _CheckoutSelectedItemsUseCaseInput;
}

@freezed
sealed class CheckoutSelectedItemsUseCaseOutput extends BaseOutput with _$CheckoutSelectedItemsUseCaseOutput {
  const CheckoutSelectedItemsUseCaseOutput._();
  const factory CheckoutSelectedItemsUseCaseOutput({
    required OrderEntity order,
  }) = _CheckoutSelectedItemsUseCaseOutput;
}