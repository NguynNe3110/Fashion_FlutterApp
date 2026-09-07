import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../../domain.dart';

part 'get_featured_products_usecase.freezed.dart';

@Injectable()
class GetFeaturedProductsUseCase extends BaseFutureUseCase<GetFeaturedProductsInput, GetFeaturedProductsOutput> {
  const GetFeaturedProductsUseCase(this._repository);

  final ProductRepository _repository;

  @protected
  @override
  Future<GetFeaturedProductsOutput> buildUseCase(GetFeaturedProductsInput input) async {
    final products = await _repository.getFeaturedProducts(limit: input.limit);
    return GetFeaturedProductsOutput(products: products);
  }
}

@freezed
sealed class GetFeaturedProductsInput extends BaseInput with _$GetFeaturedProductsInput {
  const GetFeaturedProductsInput._();
  const factory GetFeaturedProductsInput({
    @Default(20) int limit,
  }) = _GetFeaturedProductsInput;
}

@freezed
sealed class GetFeaturedProductsOutput extends BaseOutput with _$GetFeaturedProductsOutput {
  const GetFeaturedProductsOutput._();
  const factory GetFeaturedProductsOutput({
    required List<ProductEntity> products,
  }) = _GetFeaturedProductsOutput;
}
