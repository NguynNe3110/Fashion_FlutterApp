import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../data.dart';

@LazySingleton()
class ProductSupabaseService {
  ProductSupabaseService(this._supabaseClient);

  final SupabaseClient _supabaseClient;

  // products is_active = true (false là ẩn k bán)
  Future<List<ProductResponseDto>> getProducts({
    int limit = 100,
    int offset = 0,
  }) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('products')
            .select()
            .eq('is_active', true)
            .order('created_at', ascending: false)
            .range(offset, offset + limit - 1);

        return (response as List<dynamic>)
            .map((e) => ProductResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  //get product by id
  Future<ProductResponseDto> getProductById({ required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('products')
            .select()
            .eq('id', id)
            .eq('is_active', true)
            .single();

        return ProductResponseDto.fromJson(response);
      },
    );
  }

  // get feature product
  Future<List<ProductResponseDto>> getFeaturedProducts({
    int limit = 20,
  }) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('products')
            .select()
            .eq('is_active', true)
            .eq('is_featured', true)
            .order('created_at', ascending: false)
            .limit(limit);

        return (response as List<dynamic>)
            .map((e) => ProductResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  //get produict by cate
  Future<List<ProductResponseDto>> getProductsByCategory({
    required String categoryId,
    int limit = 100,
  }) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('products')
            .select()
            .eq('is_active', true)
            .eq('category_id', categoryId)
            .order('created_at', ascending: false)
            .limit(limit);

        return (response as List<dynamic>)
            .map((e) => ProductResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
