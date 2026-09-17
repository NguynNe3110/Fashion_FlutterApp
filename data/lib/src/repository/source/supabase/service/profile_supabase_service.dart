import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class ProfileSupabaseService {
  final SupabaseClient _supabaseClient;

  ProfileSupabaseService(this._supabaseClient);

  Future<ProfileResponseDto> getProfileById({required String userId}) {
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

  // Lấy profile dựa trên user ID hiện tại
  Future<ProfileResponseDto?> getProfile() {
    return runSupabaseCatching(
      action: () async {
        final userId = _supabaseClient.auth.currentUser?.id;
        if (userId == null) throw AuthSessionMissingException();

        final response = await _supabaseClient
            .from('profiles')
            .select()
            .eq('id', userId)
            .maybeSingle(); // chỉ lấy 1 record

        if (response == null) return null;

        return ProfileResponseDto.fromJson(response);
      },
    );
  }
}
