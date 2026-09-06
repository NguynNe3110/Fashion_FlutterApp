
class ProductVariantEntity {
  final String id;
  final String size;
  final String color;
  final int stockQuantity;

  const ProductVariantEntity({
    required this.id,
    required this.size,
    required this.color,
    required this.stockQuantity,

  });

  ProductVariantEntity copyWith({
    String? id,
    String? size,
    String? color,
    int? stockQuantity,
  }) {
    return ProductVariantEntity(
        id: id ?? this.id,
        size: size ?? this.size,
        color: color ?? this.color,
        stockQuantity: stockQuantity ?? this.stockQuantity,
    );
  }

  @override
  bool operator ==(Object other) { // để so sánh state old-new, kiểm tra bằng nhau
    if (identical(this, other)) return true;
    return other is ProductVariantEntity &&
        other.id == id &&
        other.size == size &&
        other.color == color &&
        other.stockQuantity == stockQuantity;
  }

  @override
  int get hashCode { // kiểm tra mã băm (lưu trùng lặp)
    return Object.hash(id, size, color, stockQuantity);
  }

  @override
  String toString() {
    return 'ReviewImageEntity(id: $id, reviewId: $size, imageUrl: $color, sortOrder: $stockQuantity)';
  }
}