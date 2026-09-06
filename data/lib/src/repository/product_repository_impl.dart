import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._productSupabaseService, this._productMapper);

  final ProductSupabaseService _productSupabaseService;
  final ProductMapper _productMapper;

  @override
  Future<List<ProductEntity>> getProducts({
    int limit = 100,
    int offset = 0,
  }) async {
    final dtos = await _productSupabaseService.getProducts(
      limit: limit,
      offset: offset,
    );
    return _productMapper.mapToListEntity(dtos);
  }

  @override
  Future<ProductEntity> getProductById({required String id}) async {
    final dto = await _productSupabaseService.getProductById(id: id);
    return _productMapper.mapToEntity(dto);
  }

  @override
  Future<List<ProductEntity>> getFeaturedProducts({
    int limit = 20,
  }) async {
    final dtos = await _productSupabaseService.getFeaturedProducts(
      limit: limit,
    );
    return _productMapper.mapToListEntity(dtos);
  }

  @override
  Future<List<ProductEntity>> getProductsByCategory({
    required String categoryId,
    int limit = 100,
  }) async {
    final dtos = await _productSupabaseService.getProductsByCategory(
      categoryId: categoryId,
      limit: limit,
    );
    return _productMapper.mapToListEntity(dtos);
  }
}
