import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProductImageMapper
    extends BaseDataMapper<ProductImageResponseDto, ProductImageEntity> {
  @override
  ProductImageEntity mapToEntity(ProductImageResponseDto? data) {
    return ProductImageEntity(
      id: data?.id ?? '',
      productId: data?.productId ?? '',
      imageUrl: data?.imageUrl ?? '',
      alt: data?.altImage,
      sortOrder: data?.sortOrder ?? 0,
      createdAt: DateTime.tryParse(data?.createAt ?? ''),
    );
  }
}
