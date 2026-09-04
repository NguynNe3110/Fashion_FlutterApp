import 'package:freezed_annotation/freezed_annotation.dart';

// part '../review_image_response_dto.freezed.dart';
// part '../review_image_response_dto.g.dart';
//
// @freezed
// sealed class ReviewImageResponseDto with _$ReviewImageResponseDto {
//   const factory ReviewImageResponseDto({
//     @JsonKey(name: 'id') required String id,
//     @JsonKey(name: 'review_id') required String reviewId,
//     @JsonKey(name: 'image_url') required String imageUrl,
//     @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
//     @JsonKey(name: 'created_at') required String createdAt,
//   }) = _ReviewImageResponseDto;
//
//   factory ReviewImageResponseDto.fromJson(Map<String, dynamic> json) =>
//       _$ReviewImageResponseDtoFromJson(json);
// }
//

//manual

class ReviewImageResponseDto {
  final String id;
  final String reviewId;
  final String imageUrl;
  final int? sortOrder;
  final String createAt;

  const ReviewImageResponseDto({
    required this.id,
    required this.reviewId,
    required this.imageUrl,
    this.sortOrder = 0,
    required this.createAt,

  });

  factory ReviewImageResponseDto.fromJson(Map<String, dynamic> json) {
    return ReviewImageResponseDto(
      id: json['id'] as String,
      reviewId: json['review_id'] as String,
      imageUrl: json['image_url'] as String,
      // TH thieu field hoac null
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      createAt: json['create_at'] as String,

    );
  }

}
