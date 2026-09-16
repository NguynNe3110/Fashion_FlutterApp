import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'order_detail_state.freezed.dart';

@freezed
class OrderDetailState extends BaseBlocState with _$OrderDetailState {
  const factory OrderDetailState({
    OrderEntity? order,
    @Default([]) List<OrderItemEntity> items,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _OrderDetailState;
}
