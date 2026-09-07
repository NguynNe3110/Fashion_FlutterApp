import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_cart_item_use_case.freezed.dart';

@Injectable()
class DeleteCartItemUseCase extends BaseFutureUseCase<DeleteCartItemUseCaseInput, DeleteCartItemUseCaseOutput> {
  final CartItemRepository _cartItemRepository;

  DeleteCartItemUseCase(this._cartItemRepository);

  @protected
  @override
  Future<DeleteCartItemUseCaseOutput> buildUseCase(DeleteCartItemUseCaseInput input) async {
    await _cartItemRepository.deleteCartItem(id: input.cartItemId);
    return const DeleteCartItemUseCaseOutput();
  }
}

@freezed
sealed class DeleteCartItemUseCaseInput extends BaseInput with _$DeleteCartItemUseCaseInput {
  const DeleteCartItemUseCaseInput._();
  const factory DeleteCartItemUseCaseInput({
    required String cartItemId,
  }) = _DeleteCartItemUseCaseInput;
}

@freezed
sealed class DeleteCartItemUseCaseOutput extends BaseOutput with _$DeleteCartItemUseCaseOutput {
  const DeleteCartItemUseCaseOutput._();
  const factory DeleteCartItemUseCaseOutput() = _DeleteCartItemUseCaseOutput;
}