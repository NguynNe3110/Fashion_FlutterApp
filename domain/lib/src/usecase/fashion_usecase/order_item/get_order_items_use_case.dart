import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_order_items_use_case.freezed.dart';

@Injectable()
class GetOrderItemsUseCase extends BaseFutureUseCase<GetOrderItemsUseCaseInput, GetOrderItemsUseCaseOutput> {
  final OrderItemRepository _orderItemRepository;

  GetOrderItemsUseCase(this._orderItemRepository);

  @protected
  @override
  Future<GetOrderItemsUseCaseOutput> buildUseCase(GetOrderItemsUseCaseInput input) async {
    final items = await _orderItemRepository.getOrderItems(orderId: input.orderId);
    return GetOrderItemsUseCaseOutput(items: items);
  }
}

@freezed
sealed class GetOrderItemsUseCaseInput extends BaseInput with _$GetOrderItemsUseCaseInput {
  const GetOrderItemsUseCaseInput._();
  const factory GetOrderItemsUseCaseInput({
    required String orderId,
  }) = _GetOrderItemsUseCaseInput;
}

@freezed
sealed class GetOrderItemsUseCaseOutput extends BaseOutput with _$GetOrderItemsUseCaseOutput {
  const GetOrderItemsUseCaseOutput._();
  const factory GetOrderItemsUseCaseOutput({
    required List<OrderItemEntity> items,
  }) = _GetOrderItemsUseCaseOutput;
}
