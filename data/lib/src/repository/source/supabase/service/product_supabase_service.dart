import 'package:data/src/repository/source/supabase/model/response/product_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../data.dart';

@LazySingleton()
class ProductSupabaseService { // same X_Api
  ProductSupabaseService(this._supabaseClient);

  final SupabaseClient _supabaseClient;

  /// Lấy danh sách product (chỉ lấy is_active = true)
  Future<List<ProductResponseDto>> getProducts({
    int limit = 100,
    int offset = 0,
  }) async {
    try {
      final response = await _supabaseClient
          .from('products')
          .select()
          .eq('is_active', true)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final data = response as List<dynamic>;
      return data
          .map((e) => ProductResponseDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw SupabaseExceptionMapper().map(e);
    }
  }

  /// Lấy chi tiết product theo id
  Future<ProductResponseDto> getProductById(String id) async {
    try {
      final response = await _supabaseClient
          .from('products')
          .select()
          .eq('id', id)
          .eq('is_active', true)
          .single();

      return ProductResponseDto.fromJson(response);
    } catch (e) {
      throw SupabaseExceptionMapper().map(e);
    }
  }

  /// Lấy sản phẩm nổi bật
  Future<List<ProductResponseDto>> getFeaturedProducts({
    int limit = 20,
  }) async {
    try {
      final response = await _supabaseClient
          .from('products')
          .select()
          .eq('is_active', true)
          .eq('is_featured', true)
          .order('created_at', ascending: false)
          .limit(limit);

      final data = response as List<dynamic>;
      return data
          .map((e) => ProductResponseDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw SupabaseExceptionMapper().map(e);
    }
  }

  /// Lấy product theo category
  Future<List<ProductResponseDto>> getProductsByCategory(
    String categoryId, {
    int limit = 100,
  }) async {
    try {
      final response = await _supabaseClient
          .from('products')
          .select()
          .eq('is_active', true)
          .eq('category_id', categoryId)
          .order('created_at', ascending: false)
          .limit(limit);

      final data = response as List<dynamic>;
      return data
          .map((e) => ProductResponseDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw SupabaseExceptionMapper().map(e);
    }
  }
}
