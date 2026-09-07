import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CartItemMapper extends BaseDataMapper<CartItemResponseDto, CartItemEntity> {
  @override
  CartItemEntity mapToEntity(CartItemResponseDto? data) {
    return CartItemEntity(
      id: data?.id ?? '',
      userId: data?.userId ?? '',
      productId: data?.productId ?? '',
      variantId: data?.variantId ?? '',
      quantity: data?.quantity ?? 0,
      createdAt: DateTime.tryParse(data?.createdAt ?? ''),
      updatedAt: DateTime.tryParse(data?.updatedAt ?? ''),
    );
  }
}
