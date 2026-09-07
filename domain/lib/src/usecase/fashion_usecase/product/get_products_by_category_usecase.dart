import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../../domain.dart';

part 'get_products_by_category_usecase.freezed.dart';

@Injectable()
class GetProductsByCategoryUseCase extends BaseFutureUseCase<GetProductsByCategoryInput, GetProductsByCategoryOutput> {
  const GetProductsByCategoryUseCase(this._repository);

  final ProductRepository _repository;

  @protected
  @override
  Future<GetProductsByCategoryOutput> buildUseCase(GetProductsByCategoryInput input) async {
    final products = await _repository.getProductsByCategory(
      categoryId: input.categoryId,
      limit: input.limit,
    );
    return GetProductsByCategoryOutput(products: products);
  }
}

@freezed
sealed class GetProductsByCategoryInput extends BaseInput with _$GetProductsByCategoryInput {
  const GetProductsByCategoryInput._();
  const factory GetProductsByCategoryInput({
    required String categoryId,
    @Default(100) int limit,
  }) = _GetProductsByCategoryInput;
}

@freezed
sealed class GetProductsByCategoryOutput extends BaseOutput with _$GetProductsByCategoryOutput {
  const GetProductsByCategoryOutput._();
  const factory GetProductsByCategoryOutput({
    required List<ProductEntity> products,
  }) = _GetProductsByCategoryOutput;
}
