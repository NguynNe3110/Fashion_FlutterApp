class FavoriteResponseDto {
  final String id;
  final String userId;
  final String productId;
  final String createdAt;

  const FavoriteResponseDto({
    required this.id,
    required this.userId,
    required this.productId,
    required this.createdAt,
  });

  factory FavoriteResponseDto.fromJson(Map<String, dynamic> json) {
    return FavoriteResponseDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      productId: json['product_id'] as String,
      createdAt: json['created_at'] as String,
    );
  }
}
