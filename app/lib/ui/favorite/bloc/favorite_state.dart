import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/app.dart';
import 'package:shared/shared.dart';

import 'favorite_event.dart';

part 'favorite_state.freezed.dart';

@freezed
sealed class FavoriteState extends BaseBlocState with _$FavoriteState {
  const FavoriteState._();

  factory FavoriteState({
    @Default(LoadMoreOutput<ProductEntity>(data: <ProductEntity>[]))
    LoadMoreOutput<ProductEntity> products,
    @Default(<ProductEntity>[]) List<ProductEntity> allProducts,
    @Default(FavoriteSort.recent) FavoriteSort sort,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _FavoriteState;
  // func get, set
}
