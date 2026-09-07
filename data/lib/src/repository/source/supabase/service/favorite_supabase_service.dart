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
}
