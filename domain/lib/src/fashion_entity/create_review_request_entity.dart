import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_review_request_entity.freezed.dart';

@freezed
sealed class CreateReviewRequestEntity with _$CreateReviewRequestEntity {
  const factory CreateReviewRequestEntity({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'user_id') required String userId,
    required int rating,
    String? comment,
  }) = _CreateReviewRequestEntity;
}