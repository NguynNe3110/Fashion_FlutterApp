import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_orders_use_case.freezed.dart';

@Injectable()
class GetOrdersUseCase extends BaseFutureUseCase<GetOrdersUseCaseInput, GetOrdersUseCaseOutput> {
  final OrderRepository _orderRepository;

  GetOrdersUseCase(this._orderRepository);

  @protected
  @override
  Future<GetOrdersUseCaseOutput> buildUseCase(GetOrdersUseCaseInput input) async {
    final orders = await _orderRepository.getOrders(userId: input.userId);
    return GetOrdersUseCaseOutput(orders: orders);
  }
}

@freezed
sealed class GetOrdersUseCaseInput extends BaseInput with _$GetOrdersUseCaseInput {
  const GetOrdersUseCaseInput._();
  const factory GetOrdersUseCaseInput({
    required String userId,
  }) = _GetOrdersUseCaseInput;
}

@freezed
sealed class GetOrdersUseCaseOutput extends BaseOutput with _$GetOrdersUseCaseOutput {
  const GetOrdersUseCaseOutput._();
  const factory GetOrdersUseCaseOutput({
    required List<OrderEntity> orders,
  }) = _GetOrdersUseCaseOutput;
}
