import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_entity.freezed.dart';

@freezed
class ProductImageEntity with _$ProductImageEntity {
  const factory ProductImageEntity({
    required String id,
    required String productId,
    required String imageUrl,
    String? alt,
    @Default(0) int sortOrder,
    DateTime? createdAt,
  }) = _ProductImageEntity;
}
