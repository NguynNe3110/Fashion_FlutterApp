import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class CartItemSupabaseService {
  final SupabaseClient _supabaseClient;

  CartItemSupabaseService(this._supabaseClient);

  Future<List<CartItemResponseDto>> getCartItems({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('cart_items')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false);

        return (response as List<dynamic>)
            .map((e) => CartItemResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<CartItemResponseDto> getCartItemById({required String id}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('cart_items')
            .select()
            .eq('id', id)
            .single();

        return CartItemResponseDto.fromJson(response);
      },
    );
  }

  Future<CartItemResponseDto> updateCartItemQuantity({
    required String id,
    required int quantity,
  }) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('cart_items')
            .update({'quantity': quantity})
            .eq('id', id)
            .select()
            .single(); // luôn trả về Map<String, dynamic>

        return CartItemResponseDto.fromJson(
          response,
        ); // có thể khoogn cần as..., Nhugnw vẫn nên thêm vào cho  đẳng cắp
      },
    );
  }

  Future<void> deleteCartItem({required String id}) {
    return runSupabaseCatching(
      action: () async {
        await _supabaseClient.from('cart_items').delete().eq('id', id);
      },
    );
  }

  Future<CartItemResponseDto> addCartItem({
    required Map<String, dynamic> data,
  }) {
    return runSupabaseCatching(
      action: () async {
        final userId = data['user_id'] as String;
        final variantId = data['variant_id'] as String;
        final quantity = data['quantity'] as int;
        final existing = await _supabaseClient
            .from('cart_items')
            .select('id, quantity')
            .eq('user_id', userId)
            .eq('variant_id', variantId)
            .maybeSingle();

        final Map<String, dynamic> response;
        if (existing == null) {
          response = await _supabaseClient
              .from('cart_items')
              .insert({
                'user_id': userId,
                'product_id': data['product_id'],
                'variant_id': variantId,
                'quantity': quantity,
              })
              .select()
              .single();
        } else {
          response = await _supabaseClient
              .from('cart_items')
              .update({'quantity': (existing['quantity'] as int) + quantity})
              .eq('id', existing['id'] as String)
              .select()
              .single();
        }
        return CartItemResponseDto.fromJson(response);
      },
    );
  }
}
