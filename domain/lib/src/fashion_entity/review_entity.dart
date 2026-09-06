import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';

@freezed
class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required String id,
    required String productId,
    required String userId,
    required int rating,
    String? comment,
    @Default([]) List<String> imageUrls,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ReviewEntity;
}
