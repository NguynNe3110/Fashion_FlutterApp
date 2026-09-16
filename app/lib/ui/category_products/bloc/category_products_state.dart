import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'category_products_state.freezed.dart';

@freezed
class CategoryProductsState extends BaseBlocState with _$CategoryProductsState {
  const factory CategoryProductsState({
    @Default([]) List<ProductEntity> products,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _CategoryProductsState;
}
