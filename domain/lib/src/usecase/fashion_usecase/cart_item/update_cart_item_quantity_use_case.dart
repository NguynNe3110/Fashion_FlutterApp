import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_cart_item_quantity_use_case.freezed.dart';

@Injectable()
class UpdateCartItemQuantityUseCase extends BaseFutureUseCase<UpdateCartItemQuantityUseCaseInput, UpdateCartItemQuantityUseCaseOutput> {
  final CartItemRepository _cartItemRepository;

  UpdateCartItemQuantityUseCase(this._cartItemRepository);

  @protected
  @override
  Future<UpdateCartItemQuantityUseCaseOutput> buildUseCase(UpdateCartItemQuantityUseCaseInput input) async {
    final cartItem = await _cartItemRepository.updateCartItemQuantity(id: input.cartItemId, quantity: input.quantity);
    return UpdateCartItemQuantityUseCaseOutput(cartItem: cartItem);
  }
}

@freezed
sealed class UpdateCartItemQuantityUseCaseInput extends BaseInput with _$UpdateCartItemQuantityUseCaseInput {
  const UpdateCartItemQuantityUseCaseInput._();
  const factory UpdateCartItemQuantityUseCaseInput({
    required String cartItemId,
    required int quantity,
  }) = _UpdateCartItemQuantityUseCaseInput;
}

@freezed
sealed class UpdateCartItemQuantityUseCaseOutput extends BaseOutput with _$UpdateCartItemQuantityUseCaseOutput {
  const UpdateCartItemQuantityUseCaseOutput._();
  const factory UpdateCartItemQuantityUseCaseOutput({
    required CartItemEntity cartItem,
  }) = _UpdateCartItemQuantityUseCaseOutput;
}