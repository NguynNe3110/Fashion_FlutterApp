import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../../domain.dart';

part 'get_products_usecase.freezed.dart';

@Injectable()
class GetProductsUseCase extends BaseFutureUseCase<GetProductsInput, GetProductsOutput> {
  const GetProductsUseCase(this._repository);

  final ProductRepository _repository;

  @protected
  @override
  Future<GetProductsOutput> buildUseCase(GetProductsInput input) async {
    final products = await _repository.getProducts(
      limit: input.limit,
      offset: input.offset,
    );
    return GetProductsOutput(products: products);
  }
}

@freezed
sealed class GetProductsInput extends BaseInput with _$GetProductsInput {
  const GetProductsInput._();
  const factory GetProductsInput({
    @Default(100) int limit,
    @Default(0) int offset,
  }) = _GetProductsInput;
}

@freezed
sealed class GetProductsOutput extends BaseOutput with _$GetProductsOutput {
  const GetProductsOutput._();
  const factory GetProductsOutput({
    required List<ProductEntity> products,
  }) = _GetProductsOutput;
}
