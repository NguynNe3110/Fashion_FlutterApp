import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_cart_items_use_case.freezed.dart';

@Injectable()
class GetCartItemsUseCase extends BaseFutureUseCase<GetCartItemsUseCaseInput, GetCartItemsUseCaseOutput> {
  final CartItemRepository _cartItemRepository;

  GetCartItemsUseCase(this._cartItemRepository);

  @protected
  @override
  Future<GetCartItemsUseCaseOutput> buildUseCase(GetCartItemsUseCaseInput input) async {
    final cartItems = await _cartItemRepository.getCartItems(userId: input.userId);
    return GetCartItemsUseCaseOutput(cartItems: cartItems);
  }
}

@freezed
sealed class GetCartItemsUseCaseInput extends BaseInput with _$GetCartItemsUseCaseInput {
  const GetCartItemsUseCaseInput._();
  const factory GetCartItemsUseCaseInput({
    required String userId,
  }) = _GetCartItemsUseCaseInput;
}

@freezed
sealed class GetCartItemsUseCaseOutput extends BaseOutput with _$GetCartItemsUseCaseOutput {
  const GetCartItemsUseCaseOutput._();
  const factory GetCartItemsUseCaseOutput({
    required List<CartItemEntity> cartItems,
  }) = _GetCartItemsUseCaseOutput;
}
