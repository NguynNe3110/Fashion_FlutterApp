import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_response_dto.freezed.dart';
part 'order_item_response_dto.g.dart';

@freezed
sealed class OrderItemResponseDto with _$OrderItemResponseDto {
  const factory OrderItemResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'variant_id') String? variantId,
    @JsonKey(name: 'product_name_snapshot') required String productNameSnapshot,
    @JsonKey(name: 'variant_snapshot') Map<String, dynamic>? variantSnapshot,
    @JsonKey(name: 'price_snapshot') required double priceSnapshot,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'image_url_snapshot') String? imageUrlSnapshot,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _OrderItemResponseDto;

  factory OrderItemResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OrderItemResponseDtoFromJson(json);
}
