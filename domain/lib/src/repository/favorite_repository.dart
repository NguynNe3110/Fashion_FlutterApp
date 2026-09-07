import 'package:domain/domain.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteEntity>> getFavorites({required String userId});

  Future<FavoriteEntity> getFavoriteById({required String id});
}
