import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'toggle_favorite_use_case.freezed.dart';

@Injectable()
class ToggleFavoriteUseCase extends BaseFutureUseCase<ToggleFavoriteUseCaseInput, ToggleFavoriteUseCaseOutput> {
  final FavoriteRepository _favoriteRepository;

  ToggleFavoriteUseCase(this._favoriteRepository);

  @protected
  @override
  Future<ToggleFavoriteUseCaseOutput> buildUseCase(ToggleFavoriteUseCaseInput input) async {
    if (input.isFavorited) {
      await _favoriteRepository.deleteFavorite(userId: input.userId, productId: input.productId);
      return const ToggleFavoriteUseCaseOutput(favorite: null);
    } else {
      final favorite = await _favoriteRepository.addFavorite(userId: input.userId, productId: input.productId);
      return ToggleFavoriteUseCaseOutput(favorite: favorite);
    }
  }
}

@freezed
sealed class ToggleFavoriteUseCaseInput extends BaseInput with _$ToggleFavoriteUseCaseInput {
  const ToggleFavoriteUseCaseInput._();
  const factory ToggleFavoriteUseCaseInput({
    required String userId,
    required String productId,
    required bool isFavorited,
  }) = _ToggleFavoriteUseCaseInput;
}

@freezed
sealed class ToggleFavoriteUseCaseOutput extends BaseOutput with _$ToggleFavoriteUseCaseOutput {
  const ToggleFavoriteUseCaseOutput._();
  const factory ToggleFavoriteUseCaseOutput({
    required FavoriteEntity? favorite,
  }) = _ToggleFavoriteUseCaseOutput;
}