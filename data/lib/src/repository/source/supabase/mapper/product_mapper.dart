import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ProductMapper
    extends BaseDataMapper<ProductResponseDto, ProductEntity> {
  ProductMapper(this._variantMapper);

  final ProductVariantMapper _variantMapper;

  @override
  ProductEntity mapToEntity(ProductResponseDto? data) {
    return ProductEntity(
      id: data?.id ?? '',
      name: data?.name ?? '',
      slug: data?.slug ?? '',
      description: data?.description,
      price: data?.price.toInt() ?? 0,
      discountPrice: data?.discountPrice?.toInt(),
      isFeatured: data?.isFeatured ?? false,
      categoryId: data?.categoryId,
      categoryName: null, // Không có trong DTO, enrich sau nếu cần
      imageUrls: const [], // Enrich từ product_images table sau
      variants: const [], // Enrich từ product_variants table sau
    );
  }
}

