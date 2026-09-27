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

  CreateOrderItemRequestDto mapToDto(OrderItemEntity entity) {
    return CreateOrderItemRequestDto(
      orderId: entity.orderId,
      productId: entity.productId,
      variantId: entity.variantId,
      productNameSnapshot: entity.productNameSnapshot,
      variantSnapshot: entity.variantSnapshot,
      priceSnapshot: entity.priceSnapshot.toDouble(),
      quantity: entity.quantity,
      imageUrlSnapshot: entity.imageUrlSnapshot,
    );
  }
}
