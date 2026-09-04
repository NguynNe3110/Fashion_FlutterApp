import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_response_dto.freezed.dart';
part 'cart_item_response_dto.g.dart';

@freezed
sealed class CartItemResponseDto with _$CartItemResponseDto {
  const factory CartItemResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'variant_id') required String variantId,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CartItemResponseDto;

  factory CartItemResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemResponseDtoFromJson(json);
}
