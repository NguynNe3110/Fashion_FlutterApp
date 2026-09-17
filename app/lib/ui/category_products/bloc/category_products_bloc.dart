import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'category_products.dart';

@injectable
class CategoryProductsBloc
    extends BaseBloc<CategoryProductsEvent, CategoryProductsState> {
  CategoryProductsBloc(
    this._getProductsByCategoryUseCase,
    this._getProductsUseCase,
    this._getCategoriesUseCase,
  ) : super(const CategoryProductsState()) {
    on<CategoryProductsPageInitiated>(_onCategoryProductsPageInitiated);
    on<CategoryProductsCategorySelected>(_onCategorySelected);
  }

  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;

  FutureOr<void> _onCategoryProductsPageInitiated(
    CategoryProductsPageInitiated event,
    Emitter<CategoryProductsState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(loadException: null));
        final categories = await _getCategoriesUseCase.execute(
          const GetCategoriesUseCaseInput(),
        );
        final products = await _loadProducts(event.categoryId);
        emit(
          state.copyWith(
            products: products,
            categories: categories.categories,
            selectedCategoryId: event.categoryId,
          ),
        );
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async =>
          emit(state.copyWith(isShimmerLoading: false)),
      doOnError: (e) async => emit(state.copyWith(loadException: e)),
      handleLoading: false,
    );
  }

  FutureOr<void> _onCategorySelected(
    CategoryProductsCategorySelected event,
    Emitter<CategoryProductsState> emit,
  ) async {
    if (event.categoryId == state.selectedCategoryId) return;
    return runBlocCatching(
      action: () async {
        final products = await _loadProducts(event.categoryId);
        emit(
          state.copyWith(
            products: products,
            selectedCategoryId: event.categoryId,
          ),
        );
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async =>
          emit(state.copyWith(isShimmerLoading: false)),
      handleLoading: false,
    );
  }

  Future<List<ProductEntity>> _loadProducts(String categoryId) async {
    if (categoryId.isEmpty) {
      final output = await _getProductsUseCase.execute(
        const GetProductsInput(limit: 100),
      );
      return output.products;
    }
    final output = await _getProductsByCategoryUseCase.execute(
      GetProductsByCategoryInput(categoryId: categoryId),
    );
    return output.products;
  }
}
