import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class FavoriteSupabaseService {
  final SupabaseClient _supabaseClient;

  FavoriteSupabaseService(this._supabaseClient);

  Future<List<FavoriteResponseDto>> getFavorites({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('favorites')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false);

        return (response as List<dynamic>)
            .map((e) => FavoriteResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<FavoriteResponseDto> getFavoriteById({required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('favorites')
            .select()
            .eq('id', id)
            .single();

        return FavoriteResponseDto.fromJson(response);
      },
    );
  }

  Future<FavoriteResponseDto> addFavorite({required Map<String, dynamic> data}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('favorites')
            .insert(data)
            .select()
            .single();

        return FavoriteResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }

  Future<void> deleteFavorite({required String userId, required String productId}) {
    return runSupabaseCatching(
      action: () async {
        await _supabaseClient
            .from('favorites')
            .delete()
            .eq('user_id', userId)
            .eq('product_id', productId);
      },
    );
  }
}
