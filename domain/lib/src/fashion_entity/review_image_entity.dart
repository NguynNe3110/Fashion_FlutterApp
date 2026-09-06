
class ReviewImageEntity {
  final String id;
  final String reviewId;
  final String imageUrl;
  final int sortOrder;
  final DateTime? createdAt;

  const ReviewImageEntity({
    required this.id,
    required this.reviewId,
    required this.imageUrl,
    this.sortOrder = 0,
    this.createdAt,
  });

  ReviewImageEntity copyWith({
    String? id,
    String? reviewId,
    String? imageUrl,
    int? sortOrder,
    DateTime? createdAt,
  }) {
    return ReviewImageEntity(
      id: id ?? this.id,
      reviewId: reviewId ?? this.reviewId,
      imageUrl: imageUrl ?? this.imageUrl,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) { // để so sánh state old-new, kiểm tra bằng nhau
    if (identical(this, other)) return true;
    return other is ReviewImageEntity &&
        other.id == id &&
        other.reviewId == reviewId &&
        other.imageUrl == imageUrl &&
        other.sortOrder == sortOrder &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode { // kiểm tra mã băm (lưu trùng lặp)
    return Object.hash(id, reviewId, imageUrl, sortOrder, createdAt);
  }

  @override
  String toString() {
    return 'ReviewImageEntity(id: $id, reviewId: $reviewId, imageUrl: $imageUrl, sortOrder: $sortOrder, createdAt: $createdAt)';
  }
}