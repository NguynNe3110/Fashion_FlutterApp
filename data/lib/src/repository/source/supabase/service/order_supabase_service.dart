import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class OrderSupabaseService {
  final SupabaseClient _supabaseClient;

  OrderSupabaseService(this._supabaseClient);

  Future<List<OrderResponseDto>> getOrders({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('orders')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false);

        return (response as List<dynamic>)
            .map((e) => OrderResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<OrderResponseDto> getOrderById({required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('orders')
            .select()
            .eq('id', id)
            .single();

        return OrderResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }

  Future<OrderResponseDto> createOrder({required Map<String, dynamic> data}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('orders')
            .insert(data)
            .select()
            .single();

        return OrderResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }
}
