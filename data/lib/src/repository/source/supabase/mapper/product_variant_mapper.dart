import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ProductVariantMapper
    extends BaseDataMapper<ProductVariantResponseDto, ProductVariantEntity> {
  @override
  ProductVariantEntity mapToEntity(ProductVariantResponseDto? data) {
    return ProductVariantEntity(
      id: data?.id ?? '',
      size: data?.size ?? 'default',
      color: data?.color ?? 'default',
      stockQuantity: data?.stockQuantity ?? 0,
    );
  }
}

