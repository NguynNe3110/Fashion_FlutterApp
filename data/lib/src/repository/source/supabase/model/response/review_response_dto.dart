import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_response_dto.freezed.dart';
part 'review_response_dto.g.dart';

@freezed
sealed class ReviewResponseDto with _$ReviewResponseDto {
  const factory ReviewResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'rating') required int rating,
    @JsonKey(name: 'comment') String? comment,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ReviewResponseDto;

  factory ReviewResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseDtoFromJson(json);
}
