import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:app/app.dart';

part 'favorite_event.freezed.dart';

abstract class FavoriteEvent extends BaseBlocEvent {
  const FavoriteEvent();
}

enum FavoriteSort { recent, priceLow, priceHigh, name }

@freezed
sealed class FavoritePageInitiated extends FavoriteEvent
    with _$FavoritePageInitiated {
  const FavoritePageInitiated._();
  const factory FavoritePageInitiated() = _FavoritePageInitiated;
}

@freezed
sealed class FavoriteToggleFavorite extends FavoriteEvent
    with _$FavoriteToggleFavorite {
  const FavoriteToggleFavorite._();
  const factory FavoriteToggleFavorite({
    required String productId,
    required bool isFavorited,
  }) = _FavoriteToggleFavorite;
}

@freezed
sealed class FavoriteSearch extends FavoriteEvent with _$FavoriteSearch {
  const FavoriteSearch._();
  const factory FavoriteSearch() = _FavoriteSearch;
}

@freezed
sealed class FavoriteFilter extends FavoriteEvent with _$FavoriteFilter {
  const FavoriteFilter._();
  const factory FavoriteFilter({required FavoriteSort sort}) = _FavoriteFilter;
}
