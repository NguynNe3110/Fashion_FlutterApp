import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_variant_response_dto.freezed.dart';
part 'product_variant_response_dto.g.dart';

@freezed
sealed class ProductVariantResponseDto with _$ProductVariantResponseDto {
  const factory ProductVariantResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'sku') String? sku,
    @JsonKey(name: 'size') @Default('default') String size,
    @JsonKey(name: 'color') @Default('default') String color,
    @JsonKey(name: 'stock_quantity') @Default(0) int stockQuantity,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ProductVariantResponseDto;

  factory ProductVariantResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantResponseDtoFromJson(json);
}
