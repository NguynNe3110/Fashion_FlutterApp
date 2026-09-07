import 'package:domain/domain.dart';

abstract class ReviewRepository {
  Future<List<ReviewEntity>> getReviews({required String productId});
  Future<List<ReviewEntity>> getReviewsByUser({required String userId});
  Future<ReviewEntity> createReview({required CreateReviewRequestEntity data});
  Future<void> deleteReview({required String id});
}
