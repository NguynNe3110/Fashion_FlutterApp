import 'package:freezed_annotation/freezed_annotation.dart';

// part '../favorite_response_dto.freezed.dart';
// part '../favorite_response_dto.g.dart';
//
// @freezed
// sealed class FavoriteResponseDto with _$FavoriteResponseDto {
//   const factory FavoriteResponseDto({
//     @JsonKey(name: 'id') required String id,
//     @JsonKey(name: 'user_id') required String userId,
//     @JsonKey(name: 'product_id') required String productId,
//     @JsonKey(name: 'created_at') required String createdAt,
//   }) = _FavoriteResponseDto;
//
//   factory FavoriteResponseDto.fromJson(Map<String, dynamic> json) =>
//       _$FavoriteResponseDtoFromJson(json);
// }


class FavoriteResponseDto {
  final String id;
  final String userId;
  final String productId;
  final String createAt;

  const FavoriteResponseDto({
    required this.id,
    required this.userId,
    required this.productId,
    required this.createAt,

  });

  factory FavoriteResponseDto.fromJson(Map<String, dynamic> json) {
    return FavoriteResponseDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      productId: json['product_id'] as String,
      createAt: json['create_at'] as String,

    );
  }
}