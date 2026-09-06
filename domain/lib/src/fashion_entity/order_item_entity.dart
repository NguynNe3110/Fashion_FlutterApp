import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_entity.freezed.dart';

@freezed
class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required String id,
    required String orderId,
    String? productId,
    String? variantId,
    required String productNameSnapshot,
    Map<String, dynamic>? variantSnapshot,
    required int priceSnapshot,
    required int quantity,
    String? imageUrlSnapshot,
    DateTime? createdAt,
  }) = _OrderItemEntity;
}
