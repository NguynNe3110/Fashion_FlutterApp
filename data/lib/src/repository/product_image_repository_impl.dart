import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: ProductImageRepository)
class ProductImageRepositoryImpl extends ProductImageRepository {
  final ProductImageSupabaseService _productImageSupabaseService;
  final ProductImageMapper _productImageMapper;

  ProductImageRepositoryImpl(this._productImageMapper, this._productImageSupabaseService);

  @override
  Future<List<ProductImageEntity>> getProductImages({required String productId}) async {
    final dtos = await _productImageSupabaseService.getProductImages(productId: productId);
    return _productImageMapper.mapToListEntity(dtos);
  }

  @override
  Future<ProductImageEntity> getProductImageById({required String id}) async {
    final dto = await _productImageSupabaseService.getProductImageById(id: id);
    return _productImageMapper.mapToEntity(dto);
  }
}
