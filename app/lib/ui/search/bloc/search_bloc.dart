import 'dart:async';

import 'package:app/app.dart';
import 'package:app/ui/search/bloc/search.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

@injectable
class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  SearchBloc(this._getProductsUseCase, this._addSearchHistoryUseCase)
    : super(const SearchState()) {
    on<SearchPageInitiated>(_onSearchPageInitiated, transformer: log());
    on<SearchBackPressed>(_onSearchBackPressed, transformer: log());
    on<SearchKeywordChanged>(_onSearchKeywordChanged, transformer: log());
    on<SearchKeywordSubmitted>(_onSearchKeywordSubmitted, transformer: log());
    on<SearchProductClicked>(_onSearchProductClicked, transformer: log());
  }

  final GetProductsUseCase _getProductsUseCase;
  final AddSearchHistoryUseCase _addSearchHistoryUseCase;

  FutureOr<void> _onSearchBackPressed(
    SearchBackPressed event,
    Emitter<SearchState> emit,
  ) async {
    await navigator.pop(useRootNavigator: true);
  }

  FutureOr<void> _onSearchPageInitiated(
    SearchPageInitiated event,
    Emitter<SearchState> emit,
  ) async {
    // load search history suggestions...
  }

  FutureOr<void> _onSearchKeywordChanged(
    SearchKeywordChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(keyword: event.keyword));
  }

  FutureOr<void> _onSearchKeywordSubmitted(
    SearchKeywordSubmitted event,
    Emitter<SearchState> emit,
  ) async {
    final keyword = event.keyword.trim();
    if (keyword.isEmpty) return;

    return runBlocCatching(
      action: () async {
        // Lưu lịch sử khi submit
        await _addSearchHistoryUseCase.execute(
          AddSearchHistoryInput(keyword: keyword),
        );

        final output = await _getProductsUseCase.execute(
          GetProductsInput(offset: 0, searchQuery: keyword),
        );
        emit(state.copyWith(searchResults: output.products, keyword: keyword));
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async =>
          emit(state.copyWith(isShimmerLoading: false)),
      handleLoading: false,
    );
  }

  FutureOr<void> _onSearchProductClicked(
    SearchProductClicked event,
    Emitter<SearchState> emit,
  ) async {
    final product = state.searchResults.firstWhereOrNull(
      (p) => p.id == event.productId,
    );
    if (product != null) {
      await navigator.push(AppRouteInfo.itemDetail(product));
    }
  }
}
