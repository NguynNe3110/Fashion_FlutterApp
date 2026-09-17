import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'search_state.freezed.dart';

@freezed
sealed class SearchState extends BaseBlocState with _$SearchState {
  const SearchState._();
  const factory SearchState({
    @Default('') String keyword,
    @Default([]) List<ProductEntity> searchResults,
    @Default([]) List<ProductEntity> suggestedProducts,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _SearchState;
}
