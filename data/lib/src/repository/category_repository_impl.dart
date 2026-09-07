import 'package:domain/domain.dart';

import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl extends CategoryRepository {

  final CategorySupabaseService _categorySupabaseService;
  final CategoryMapper _categoryMapper;

  CategoryRepositoryImpl(this._categoryMapper, this._categorySupabaseService);


  @override
  Future<List<CategoryEntity>> getCategories() async {
    final dtos = await _categorySupabaseService.getCategories();
    return _categoryMapper.mapToListEntity(dtos);
  }

  @override
  Future<CategoryEntity> getCategoryById({required String id}) async {
    final dto = await _categorySupabaseService.getCategoryById(id: id);
    return _categoryMapper.mapToEntity(dto);
  }
}