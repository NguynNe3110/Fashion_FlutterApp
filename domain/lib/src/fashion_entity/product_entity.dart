import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_variant_entity.dart';

part 'product_entity.freezed.dart';

@freezed
sealed class ProductEntity with _$ProductEntity {

  const ProductEntity._(); // bat buoc khi muon tự viết get/set

  const factory ProductEntity({
    required String id,
    required String name,
    required String slug,
    String? description,
    required int price,
    int? discountPrice,
    required bool isFeatured,
    String? categoryId,
    String? categoryName,
    @Default([]) List<String> imageUrls,
    @Default([]) List<ProductVariantEntity> variants,
  }) = _ProductEntity;

  int get effectivePrice => discountPrice ?? price; // phai co private constructor mới get duoc

  bool get hasDiscount => discountPrice != null && discountPrice! < price;

  String? get primaryImageUrl => imageUrls.isEmpty ? null : imageUrls.first;
}