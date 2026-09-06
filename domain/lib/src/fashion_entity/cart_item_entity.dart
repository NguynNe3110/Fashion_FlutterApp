import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_entity.freezed.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required String id,
    required String userId,
    required String productId,
    required String variantId,
    required int quantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CartItemEntity;
}
