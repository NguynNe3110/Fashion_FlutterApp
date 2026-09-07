import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class ProductImageSupabaseService {
  final SupabaseClient _supabaseClient;

  ProductImageSupabaseService(this._supabaseClient);

  Future<List<ProductImageResponseDto>> getProductImages({required String productId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('product_images')
            .select()
            .eq('product_id', productId)
            .order('sort_order', ascending: true);

        return (response as List<dynamic>)
            .map((e) => ProductImageResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<ProductImageResponseDto> getProductImageById({required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('product_images')
            .select()
            .eq('id', id)
            .single();

        return ProductImageResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }
}
