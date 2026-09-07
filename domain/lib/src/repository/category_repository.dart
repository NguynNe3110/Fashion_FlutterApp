import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class CategoryRepository {

  Future<List<CategoryEntity>> getCategories();

  Future<CategoryEntity> getCategoryById({required String id});
}