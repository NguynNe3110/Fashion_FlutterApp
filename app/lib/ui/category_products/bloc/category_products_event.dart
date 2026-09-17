import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'category_products_event.freezed.dart';

abstract class CategoryProductsEvent extends BaseBlocEvent {
  const CategoryProductsEvent();
}

@freezed
class CategoryProductsCategorySelected extends CategoryProductsEvent
    with _$CategoryProductsCategorySelected {
  const factory CategoryProductsCategorySelected({required String categoryId}) =
      _CategoryProductsCategorySelected;
}

@freezed
class CategoryProductsPageInitiated extends CategoryProductsEvent
    with _$CategoryProductsPageInitiated {
  const factory CategoryProductsPageInitiated({required String categoryId}) =
      _CategoryProductsPageInitiated;
}
