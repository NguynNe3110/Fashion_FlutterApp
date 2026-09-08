import 'package:domain/domain.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteEntity>> getFavorites({required String userId});

  Future<FavoriteEntity> getFavoriteById({required String id});

  Future<FavoriteEntity> addFavorite({required String userId, required String productId});

  Future<void> deleteFavorite({required String userId, required String productId});
}
