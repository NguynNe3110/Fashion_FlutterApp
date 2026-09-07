

import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CategoryMapper extends BaseDataMapper<CategoryResponseDto, CategoryEntity> {

  @override
  CategoryEntity mapToEntity(CategoryResponseDto? data) {
    return CategoryEntity(
        id: data?.id ?? '',
        name: data?.name ?? '',
        slug: data?.slug ?? '',
      description: data?.description,
      imageUrl: data?.imageUrl,
      sortOrder: data?.sortOrder ?? 0,
      isActive: data?.isActive ?? true,
      createdAt: DateTime.tryParse(data?.createdAt ?? ''),
      updatedAt: DateTime.tryParse(data?.updatedAt ?? ''),
    );
  }
}