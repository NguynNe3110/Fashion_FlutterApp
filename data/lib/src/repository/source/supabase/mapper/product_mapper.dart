import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ProductMapper extends BaseDataMapper<ProductResponseDto, ProductEntity> {
  ProductMapper(this._variantMapper);

  final ProductVariantMapper _variantMapper;

  @override
  ProductEntity mapToEntity(ProductResponseDto? data) {
    final images = data?.images.toList() ?? <ProductImageResponseDto>[];
    images.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    return ProductEntity(
      id: data?.id ?? '',
      name: data?.name ?? '',
      slug: data?.slug ?? '',
      description: data?.description,
      price: data?.price.toInt() ?? 0,
      discountPrice: data?.discountPrice?.toInt(),
      isFeatured: data?.isFeatured ?? false,
      categoryId: data?.categoryId,
      categoryName: data?.category?['name'] as String?,
      imageUrls: images.map((image) => image.imageUrl).toList(growable: false),
      variants: _variantMapper.mapToListEntity(data?.variants),
      ratingAverage: data?.ratingAverage ?? 0,
      reviewCount: data?.reviewCount ?? 0,
    );
  }
}
