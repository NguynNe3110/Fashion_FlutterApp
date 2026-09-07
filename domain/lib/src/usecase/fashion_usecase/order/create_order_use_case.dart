import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_order_use_case.freezed.dart';

@Injectable()
class CreateOrderUseCase extends BaseFutureUseCase<CreateOrderUseCaseInput, CreateOrderUseCaseOutput> {
  final OrderRepository _orderRepository;

  CreateOrderUseCase(this._orderRepository);

  @protected
  @override
  Future<CreateOrderUseCaseOutput> buildUseCase(CreateOrderUseCaseInput input) async {
    final order = await _orderRepository.createOrder(data: input.data);
    return CreateOrderUseCaseOutput(order: order);
  }
}

@freezed
sealed class CreateOrderUseCaseInput extends BaseInput with _$CreateOrderUseCaseInput {
  const CreateOrderUseCaseInput._();
  const factory CreateOrderUseCaseInput({
    required CreateOrderRequestEntity data,
  }) = _CreateOrderUseCaseInput;
}

@freezed
sealed class CreateOrderUseCaseOutput extends BaseOutput with _$CreateOrderUseCaseOutput {
  const CreateOrderUseCaseOutput._();
  const factory CreateOrderUseCaseOutput({
    required OrderEntity order,
  }) = _CreateOrderUseCaseOutput;
}
