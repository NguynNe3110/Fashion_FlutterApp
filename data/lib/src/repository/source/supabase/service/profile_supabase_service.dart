import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class ProfileSupabaseService {
  final SupabaseClient _supabaseClient;

  ProfileSupabaseService(this._supabaseClient);

  Future<AccountStatsEntity> getAccountStats({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final counts = await Future.wait<int>([
          _supabaseClient.from('orders').count().eq('user_id', userId),
          _supabaseClient.from('favorites').count().eq('user_id', userId),
          _supabaseClient.from('user_vouchers').count().eq('user_id', userId),
        ]);
        return AccountStatsEntity(
          orderCount: counts[0],
          favoriteCount: counts[1],
          voucherCount: counts[2],
        );
      },
    );
  }

  Future<ProfileResponseDto> getProfileById({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('profiles')
            .select()
            .eq('id', userId)
            .single();

        final data = Map<String, dynamic>.from(response)
          ..['email'] = _supabaseClient.auth.currentUser?.email ?? '';
        return ProfileResponseDto.fromJson(data);
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

        final result = Map<String, dynamic>.from(response)
          ..['email'] = _supabaseClient.auth.currentUser?.email ?? '';
        return ProfileResponseDto.fromJson(result);
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

        final data = Map<String, dynamic>.from(response)
          ..['email'] = _supabaseClient.auth.currentUser?.email ?? '';
        return ProfileResponseDto.fromJson(data);
      },
    );
  }
}
