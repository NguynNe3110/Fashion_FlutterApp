import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_product_images_use_case.freezed.dart';

@Injectable()
class GetProductImagesUseCase extends BaseFutureUseCase<GetProductImagesUseCaseInput, GetProductImagesUseCaseOutput> {
  final ProductImageRepository _productImageRepository;

  GetProductImagesUseCase(this._productImageRepository);

  @protected
  @override
  Future<GetProductImagesUseCaseOutput> buildUseCase(GetProductImagesUseCaseInput input) async {
    final images = await _productImageRepository.getProductImages(productId: input.productId);
    return GetProductImagesUseCaseOutput(images: images);
  }
}

@freezed
sealed class GetProductImagesUseCaseInput extends BaseInput with _$GetProductImagesUseCaseInput {
  const GetProductImagesUseCaseInput._();
  const factory GetProductImagesUseCaseInput({
    required String productId,
  }) = _GetProductImagesUseCaseInput;
}

@freezed
sealed class GetProductImagesUseCaseOutput extends BaseOutput with _$GetProductImagesUseCaseOutput {
  const GetProductImagesUseCaseOutput._();
  const factory GetProductImagesUseCaseOutput({
    required List<ProductImageEntity> images,
  }) = _GetProductImagesUseCaseOutput;
}
