import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_favorites_use_case.freezed.dart';

@Injectable()
class GetFavoritesUseCase extends BaseFutureUseCase<GetFavoritesUseCaseInput, GetFavoritesUseCaseOutput> {
  final FavoriteRepository _favoriteRepository;

  GetFavoritesUseCase(this._favoriteRepository);

  @protected
  @override
  Future<GetFavoritesUseCaseOutput> buildUseCase(GetFavoritesUseCaseInput input) async {
    final favorites = await _favoriteRepository.getFavorites(userId: input.userId);
    return GetFavoritesUseCaseOutput(favorites: favorites);
  }
}

@freezed
sealed class GetFavoritesUseCaseInput extends BaseInput with _$GetFavoritesUseCaseInput {
  const GetFavoritesUseCaseInput._();
  const factory GetFavoritesUseCaseInput({
    required String userId,
  }) = _GetFavoritesUseCaseInput;
}

@freezed
sealed class GetFavoritesUseCaseOutput extends BaseOutput with _$GetFavoritesUseCaseOutput {
  const GetFavoritesUseCaseOutput._();
  const factory GetFavoritesUseCaseOutput({
    required List<FavoriteEntity> favorites,
  }) = _GetFavoritesUseCaseOutput;
}
