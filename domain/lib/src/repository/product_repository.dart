import 'package:domain/domain.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts({
    int limit = 100,
    int offset = 0,
  });

  Future<ProductEntity> getProductById({required String id});

  Future<List<ProductEntity>> getFeaturedProducts({
    int limit = 20,
  });

  Future<List<ProductEntity>> getProductsByCategory({
    required String categoryId,
    int limit = 100,
  });
}
