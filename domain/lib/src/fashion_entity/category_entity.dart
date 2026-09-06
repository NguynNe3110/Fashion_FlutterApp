import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    required String slug,
    String? description,
    String? imageUrl,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CategoryEntity;
}
