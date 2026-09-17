import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'vouchers.dart';

@injectable
class VouchersBloc extends BaseBloc<VouchersEvent, VouchersState> {
  VouchersBloc() : super(const VouchersState()) {
    on<VouchersPageInitiated>(_onVouchersPageInitiated);
    on<ApplyVoucherPressed>(_onApplyVoucherPressed);
  }

  FutureOr<void> _onVouchersPageInitiated(
    VouchersPageInitiated event,
    Emitter<VouchersState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        // Sample vouchers matching fashion e-commerce design
        const mockVouchers = [
          VoucherItem(
            code: 'NORDNEW',
            title: 'Giảm 15% cho đơn hàng đầu tiên',
            discount: '15%',
            minOrder: 'Đơn tối thiểu 500.000đ',
            expiryDate: 'HSD: 31/12/2026',
          ),
          VoucherItem(
            code: 'FREESHIP',
            title: 'Miễn phí vận chuyển toàn quốc',
            discount: 'Free Ship',
            minOrder: 'Đơn tối thiểu 300.000đ',
            expiryDate: 'HSD: 30/11/2026',
          ),
          VoucherItem(
            code: 'FALL2026',
            title: 'Giảm 50.000đ bộ sưu tập Fall/Winter',
            discount: '50K',
            minOrder: 'Đơn tối thiểu 800.000đ',
            expiryDate: 'HSD: 15/10/2026',
          ),
        ];
        emit(state.copyWith(vouchers: mockVouchers));
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async =>
          emit(state.copyWith(isShimmerLoading: false)),
      handleLoading: false,
    );
  }

  FutureOr<void> _onApplyVoucherPressed(
    ApplyVoucherPressed event,
    Emitter<VouchersState> emit,
  ) async {
    await navigator.pop(result: event.code);
  }
}
