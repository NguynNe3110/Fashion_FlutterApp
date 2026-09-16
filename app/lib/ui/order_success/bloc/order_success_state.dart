import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'order_success_state.freezed.dart';

@freezed
class OrderSuccessState extends BaseBlocState with _$OrderSuccessState {
  const factory OrderSuccessState({
    @Default('') String orderId,
  }) = _OrderSuccessState;
}
