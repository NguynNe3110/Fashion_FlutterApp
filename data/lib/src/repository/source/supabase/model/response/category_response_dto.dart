import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response_dto.freezed.dart';
part 'category_response_dto.g.dart';

@freezed
sealed class CategoryResponseDto with _$CategoryResponseDto {
  const factory CategoryResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CategoryResponseDto;

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseDtoFromJson(json);
}
