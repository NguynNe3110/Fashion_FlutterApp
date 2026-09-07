import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: FavoriteRepository)
class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteSupabaseService _favoriteSupabaseService;
  final FavoriteMapper _favoriteMapper;

  FavoriteRepositoryImpl(this._favoriteMapper, this._favoriteSupabaseService);

  @override
  Future<List<FavoriteEntity>> getFavorites({required String userId}) async {
    final dtos = await _favoriteSupabaseService.getFavorites(userId: userId);
    return _favoriteMapper.mapToListEntity(dtos);
  }

  @override
  Future<FavoriteEntity> getFavoriteById({required String id}) async {
    final dto = await _favoriteSupabaseService.getFavoriteById(id: id);
    return _favoriteMapper.mapToEntity(dto);
  }
}
