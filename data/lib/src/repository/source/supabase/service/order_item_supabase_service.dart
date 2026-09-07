import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class OrderItemSupabaseService {
  final SupabaseClient _supabaseClient;

  OrderItemSupabaseService(this._supabaseClient);

  Future<List<OrderItemResponseDto>> getOrderItems({required String orderId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('order_items')
            .select()
            .eq('order_id', orderId)
            .order('created_at', ascending: true);

        return (response as List<dynamic>)
            .map((e) => OrderItemResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<OrderItemResponseDto> getOrderItemById({required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('order_items')
            .select()
            .eq('id', id)
            .single();

        return OrderItemResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }

  Future<List<OrderItemResponseDto>> createOrderItems({required List<Map<String, dynamic>> data}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('order_items')
            .insert(data)
            .select();

        return (response as List<dynamic>)
            .map((e) => OrderItemResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
