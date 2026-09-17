import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class AddressSupabaseService {
  final SupabaseClient _supabaseClient;

  AddressSupabaseService(this._supabaseClient);

  Future<List<AddressResponseDto>> getAddresses({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('addresses')
            .select()
            .eq('user_id', userId)
            .order('is_default', ascending: false)
            .order('created_at', ascending: false);

        return (response as List<dynamic>)
            .map((e) => AddressResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<AddressResponseDto> getAddressById({required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('addresses')
            .select()
            .eq('id', id)
            .single();

        return AddressResponseDto.fromJson(response);
      },
    );
  }

  Future<AddressResponseDto> createAddress({
    required Map<String, dynamic> data,
  }) {
    return runSupabaseCatching(
      action: () async {
        final payload = Map<String, dynamic>.from(data)
          ..remove('id')
          ..remove('created_at')
          ..remove('updated_at');
        if (payload['is_default'] == true) {
          await _supabaseClient
              .from('addresses')
              .update({'is_default': false})
              .eq('user_id', payload['user_id'] as String);
        }
        final response = await _supabaseClient
            .from('addresses')
            .insert(payload)
            .select()
            .single();

        return AddressResponseDto.fromJson(response);
      },
    );
  }

  Future<AddressResponseDto> updateAddress({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return runSupabaseCatching(
      action: () async {
        final payload = Map<String, dynamic>.from(data)
          ..remove('id')
          ..remove('user_id')
          ..remove('created_at')
          ..remove('updated_at');
        if (payload['is_default'] == true) {
          final userId = _supabaseClient.auth.currentUser?.id;
          if (userId != null) {
            await _supabaseClient
                .from('addresses')
                .update({'is_default': false})
                .eq('user_id', userId)
                .neq('id', id);
          }
        }
        final response = await _supabaseClient
            .from('addresses')
            .update(payload)
            .eq('id', id)
            .select()
            .single();

        return AddressResponseDto.fromJson(response);
      },
    );
  }

  Future<void> deleteAddress({required String id}) {
    return runSupabaseCatching(
      action: () async {
        await _supabaseClient.from('addresses').delete().eq('id', id);
      },
    );
  }
}
