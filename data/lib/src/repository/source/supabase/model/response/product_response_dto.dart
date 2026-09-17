import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_image_response_dto.dart';
import 'product_variant_response_dto.dart';

part 'product_response_dto.freezed.dart';
part 'product_response_dto.g.dart'; // pt fromJson

@freezed
sealed class ProductResponseDto with _$ProductResponseDto {
  const factory ProductResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'discount_price') double? discountPrice,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'is_featured') required bool isFeatured,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'rating_average') @Default(0) double ratingAverage,
    @JsonKey(name: 'review_count') @Default(0) int reviewCount,
    @JsonKey(name: 'categories') Map<String, dynamic>? category,
    @JsonKey(name: 'product_images')
    @Default([])
    List<ProductImageResponseDto> images,
    @JsonKey(name: 'product_variants')
    @Default([])
    List<ProductVariantResponseDto> variants,
  }) = _ProductResponseDto;

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseDtoFromJson(json);
}
