import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'payment_methods_state.freezed.dart';

class PaymentMethodItem {
  final String id;
  final String name;
  final String description;
  final bool isDefault;

  const PaymentMethodItem({
    required this.id,
    required this.name,
    required this.description,
    this.isDefault = false,
  });
}

@freezed
class PaymentMethodsState extends BaseBlocState with _$PaymentMethodsState {
  const factory PaymentMethodsState({
    @Default([]) List<PaymentMethodItem> methods,
    @Default('cod') String selectedMethodId,
    @Default(false) bool isShimmerLoading,
  }) = _PaymentMethodsState;
}
