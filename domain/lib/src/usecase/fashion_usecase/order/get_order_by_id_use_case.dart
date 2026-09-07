import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_order_by_id_use_case.freezed.dart';

@Injectable()
class GetOrderByIdUseCase extends BaseFutureUseCase<GetOrderByIdUseCaseInput, GetOrderByIdUseCaseOutput> {
  final OrderRepository _orderRepository;

  GetOrderByIdUseCase(this._orderRepository);

  @protected
  @override
  Future<GetOrderByIdUseCaseOutput> buildUseCase(GetOrderByIdUseCaseInput input) async {
    final order = await _orderRepository.getOrderById(id: input.id);
    return GetOrderByIdUseCaseOutput(order: order);
  }
}

@freezed
sealed class GetOrderByIdUseCaseInput extends BaseInput with _$GetOrderByIdUseCaseInput {
  const GetOrderByIdUseCaseInput._();
  const factory GetOrderByIdUseCaseInput({
    required String id,
  }) = _GetOrderByIdUseCaseInput;
}

@freezed
sealed class GetOrderByIdUseCaseOutput extends BaseOutput with _$GetOrderByIdUseCaseOutput {
  const GetOrderByIdUseCaseOutput._();
  const factory GetOrderByIdUseCaseOutput({
    required OrderEntity order,
  }) = _GetOrderByIdUseCaseOutput;
}
