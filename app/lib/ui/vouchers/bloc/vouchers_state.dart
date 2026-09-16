import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'vouchers_state.freezed.dart';

class VoucherItem {
  final String code;
  final String title;
  final String discount;
  final String minOrder;
  final String expiryDate;

  const VoucherItem({
    required this.code,
    required this.title,
    required this.discount,
    required this.minOrder,
    required this.expiryDate,
  });
}

@freezed
class VouchersState extends BaseBlocState with _$VouchersState {
  const factory VouchersState({
    @Default([]) List<VoucherItem> vouchers,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _VouchersState;
}
