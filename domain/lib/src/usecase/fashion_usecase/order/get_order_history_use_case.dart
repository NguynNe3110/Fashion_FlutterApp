import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain.dart';

part 'get_order_history_use_case.freezed.dart';

@Injectable()
class GetOrderHistoryUseCase
    extends
        BaseFutureUseCase<
          GetOrderHistoryUseCaseInput,
          GetOrderHistoryUseCaseOutput
        > {
  GetOrderHistoryUseCase(this._orderRepository);

  final OrderRepository _orderRepository;

  @protected
  @override
  Future<GetOrderHistoryUseCaseOutput> buildUseCase(
    GetOrderHistoryUseCaseInput input,
  ) async {
    final orders = await _orderRepository.getOrderHistory(
      userId: input.userId,
      page: input.page,
      limit: input.limit,
    );
    return GetOrderHistoryUseCaseOutput(orders: orders);
  }
}

@freezed
sealed class GetOrderHistoryUseCaseInput extends BaseInput
    with _$GetOrderHistoryUseCaseInput {
  const factory GetOrderHistoryUseCaseInput({
    required String userId,
    @Default(0) int page,
    @Default(20) int limit,
  }) = _GetOrderHistoryUseCaseInput;
}

@freezed
sealed class GetOrderHistoryUseCaseOutput extends BaseOutput
    with _$GetOrderHistoryUseCaseOutput {
  const GetOrderHistoryUseCaseOutput._();
  const factory GetOrderHistoryUseCaseOutput({
    required List<OrderEntity> orders,
  }) = _GetOrderHistoryUseCaseOutput;
}
