import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class OrderItemMapper
    extends BaseDataMapper<OrderItemResponseDto, OrderItemEntity> {
  @override
  OrderItemEntity mapToEntity(OrderItemResponseDto? data) {
    return OrderItemEntity(
      id: data?.id ?? '',
      orderId: data?.orderId ?? '',
      productId: data?.productId,
      variantId: data?.variantId,
      productNameSnapshot: data?.productNameSnapshot ?? '',
      variantSnapshot: data?.variantSnapshot,
      priceSnapshot: data?.priceSnapshot.toInt() ?? 0,
      quantity: data?.quantity ?? 0,
      imageUrlSnapshot: data?.imageUrlSnapshot,
      createdAt: DateTime.tryParse(data?.createdAt ?? ''),
    );
  }
}
