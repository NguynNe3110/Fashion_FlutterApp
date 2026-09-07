import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class ReviewSupabaseService {
  final SupabaseClient _supabaseClient;

  ReviewSupabaseService(this._supabaseClient);

  Future<List<ReviewResponseDto>> getReviews({required String productId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('reviews')
            .select()
            .eq('product_id', productId)
            .order('created_at', ascending: false);

        return (response as List<dynamic>)
            .map((e) => ReviewResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<List<ReviewResponseDto>> getReviewsByUser({required String userId}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('reviews')
            .select()
            .eq('user_id', userId)
            .order('created_at', ascending: false);

        return (response as List<dynamic>)
            .map((e) => ReviewResponseDto.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<ReviewResponseDto> createReview({required Map<String, dynamic> data}) {
    return runSupabaseCatching(
      action: () async {
        final response = await _supabaseClient
            .from('reviews')
            .insert(data)
            .select()
            .single();

        return ReviewResponseDto.fromJson(response as Map<String, dynamic>);
      },
    );
  }

  Future<void> deleteReview({required String id}) {
    return runSupabaseCatching(
      action: () async {
        await _supabaseClient
            .from('reviews')
            .delete()
            .eq('id', id);
      },
    );
  }
}
