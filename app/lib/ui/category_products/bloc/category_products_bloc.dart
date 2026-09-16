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
  ) : super(const CategoryProductsState()) {
    on<CategoryProductsPageInitiated>(_onCategoryProductsPageInitiated);
  }

  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;

  FutureOr<void> _onCategoryProductsPageInitiated(
    CategoryProductsPageInitiated event,
    Emitter<CategoryProductsState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(loadException: null));
        final output = await _getProductsByCategoryUseCase.execute(
          GetProductsByCategoryInput(categoryId: event.categoryId),
        );
        emit(state.copyWith(products: output.products));
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async => emit(state.copyWith(isShimmerLoading: false)),
      doOnError: (e) async => emit(state.copyWith(loadException: e)),
      handleLoading: false,
    );
  }
}
