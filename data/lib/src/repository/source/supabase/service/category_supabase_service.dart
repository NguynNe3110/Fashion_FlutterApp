

import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class CategorySupabaseService {
  final SupabaseClient _supabaseClient;

  CategorySupabaseService(this._supabaseClient);

  Future<List<CategoryResponseDto>> getCategories() {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('categories')
            .select()
            .eq('is_active', true)
            .order('sort_order', ascending: true)
            .order('name', ascending: true);

        return (response as List<dynamic>)
            .map((e) => CategoryResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<CategoryResponseDto> getCategoryById({required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('categories')
            .select()
            .eq('id', id)
            .single();

        return CategoryResponseDto.fromJson(response);
      },
    );
  }
}