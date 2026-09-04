

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_response_dto.freezed.dart';
part 'product_image_response_dto.g.dart';

@freezed
class ProductImageResponseDto with _$ProductImageResponseDto {
  const factory ProductImageResponseDto({
    @JsonKey(name: 'id') required String id ,
    @JsonKey(name: 'product_id') required String productId  ,
    @JsonKey(name: 'image_url') required String imageUrl ,
    @JsonKey(name: 'alt') String? altImage  ,
    @JsonKey(name: 'sort_order') required int sortOrder  ,
    @JsonKey(name: 'create_at') required String createAt ,
  }) = _ProductImageResponseDto;

  factory ProductImageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductImageResponseDtoFromJson(json); // chu y
}