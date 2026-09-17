import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain.dart';

part 'add_to_cart_use_case.freezed.dart';

@Injectable()
class AddToCartUseCase
    extends BaseFutureUseCase<AddToCartInput, AddToCartOutput> {
  final CartItemRepository _cartItemRepository;

  AddToCartUseCase(this._cartItemRepository);

  @protected
  @override
  Future<AddToCartOutput> buildUseCase(AddToCartInput input) async {
    if (input.quantity < 1) {
      throw ArgumentError.value(
        input.quantity,
        'quantity',
        'must be greater than zero',
      );
    }

    await _cartItemRepository.addCartItem(
      cartItem: CartItemEntity(
        id: '',
        userId: input.userId,
        productId: input.productId,
        variantId: input.variantId,
        quantity: input.quantity,
      ),
    );

    return const AddToCartOutput();
  }
}

@freezed
sealed class AddToCartInput extends BaseInput with _$AddToCartInput {
  const factory AddToCartInput({
    required String productId,
    required String variantId,
    required int quantity,
    required String userId,
  }) = _AddToCartInput;
}

@freezed
sealed class AddToCartOutput extends BaseOutput with _$AddToCartOutput {
  const factory AddToCartOutput() = _AddToCartOutput;
}
