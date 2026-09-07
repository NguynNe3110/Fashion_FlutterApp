import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_product_by_id_usecase.freezed.dart';

@Injectable()
class GetProductByIdUseCase extends BaseFutureUseCase<GetProductByIdInput, GetProductByIdOutput> {
  final ProductRepository _repository;

  const GetProductByIdUseCase(this._repository);

  @protected
  @override
  Future<GetProductByIdOutput> buildUseCase(GetProductByIdInput input) async {
    final product = await _repository.getProductById(id: input.id); // repo trả Future phải await
    return GetProductByIdOutput(product: product);
  }
}

@freezed
sealed class GetProductByIdInput extends BaseInput with _$GetProductByIdInput {
  const GetProductByIdInput._();
  const factory GetProductByIdInput({
    required String id,
  }) = _GetProductByIdInput;
}

@freezed
sealed class GetProductByIdOutput extends BaseOutput with _$GetProductByIdOutput {
  const GetProductByIdOutput._();
  const factory GetProductByIdOutput({
    required ProductEntity product,
  }) = _GetProductByIdOutput;
}
