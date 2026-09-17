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

  Future<List<OrderResponseDto>> getOrderHistory({
    required String userId,
    required int page,
    required int limit,
  }) {
    return runSupabaseCatching(
      action: () async {
        final from = page * limit;
        final response = await _supabaseClient
            .from('orders')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false)
            .range(from, from + limit - 1);

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

        return OrderResponseDto.fromJson(response);
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

        return OrderResponseDto.fromJson(response);
      },
    );
  }

  Future<OrderResponseDto> checkout({
    required String addressId,
    required List<String> selectedCartItemIds,
    required double shippingFee,
    required String paymentMethod,
    String? note,
  }) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .rpc(
              'checkout_cart',
              params: {
                'p_address_id': addressId,
                'p_cart_item_ids': selectedCartItemIds,
                'p_shipping_fee': shippingFee,
                'p_payment_method': paymentMethod,
                'p_note': note,
              },
            )
            .single();
        return OrderResponseDto.fromJson(response);
      },
    );
  }
}
