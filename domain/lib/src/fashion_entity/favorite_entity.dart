
class FavoriteEntity {
  final String id;
  final String userId;
  final String productId;
  final DateTime? createdAt;

  const FavoriteEntity({
    required this.id,
    required this.userId,
    required this.productId,
    this.createdAt
  });

  FavoriteEntity copyWith({
    String? id,
    String? userId,
    String? productId,
    DateTime? createAt,
  }) {
    return FavoriteEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        productId: productId ?? this.productId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) { // để so sánh state old-new, kiểm tra bằng nhau
    if (identical(this, other)) return true;
    return other is FavoriteEntity &&
        other.id == id &&
        other.userId == userId &&
        other.productId == productId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode { // kiểm tra mã băm (lưu trùng lặp)
    return Object.hash(id, userId, productId, createdAt);
  }

  @override
  String toString() {
    return 'ReviewImageEntity(id: $id, reviewId: $userId, imageUrl: $productId, createdAt: $createdAt)';
  }

}