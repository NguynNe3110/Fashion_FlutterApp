import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class ProfileSupabaseService {
  final SupabaseClient _supabaseClient;

  ProfileSupabaseService(this._supabaseClient);

  Future<ProfileResponseDto> getProfile({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('profiles')
            .select()
            .eq('id', userId)
            .single();

        return ProfileResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }

  Future<ProfileResponseDto> updateProfile({
    required String userId,
    required Map<String, dynamic> data,
  }) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('profiles')
            .update(data)
            .eq('id', userId)
            .select()
            .single();

        return ProfileResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }
}
