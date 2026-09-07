import 'package:domain/domain.dart';

abstract class ProductImageRepository {
  Future<List<ProductImageEntity>> getProductImages({required String productId});
  Future<ProductImageEntity> getProductImageById({required String id});
}
