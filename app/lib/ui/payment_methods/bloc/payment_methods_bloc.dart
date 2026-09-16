import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'payment_methods.dart';

@injectable
class PaymentMethodsBloc
    extends BaseBloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc() : super(const PaymentMethodsState()) {
    on<PaymentMethodsPageInitiated>(_onPaymentMethodsPageInitiated);
    on<SelectPaymentMethodPressed>(_onSelectPaymentMethodPressed);
  }

  FutureOr<void> _onPaymentMethodsPageInitiated(
    PaymentMethodsPageInitiated event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        const methods = [
          PaymentMethodItem(
            id: 'cod',
            name: 'Thanh toán khi nhận hàng (COD)',
            description: 'Thanh toán tiền mặt cho shipper khi giao hàng',
            isDefault: true,
          ),
          PaymentMethodItem(
            id: 'banking',
            name: 'Chuyển khoản ngân hàng (QR Code)',
            description: 'Quét mã VietQR chuyển khoản nhanh 24/7',
          ),
          PaymentMethodItem(
            id: 'card',
            name: 'Thẻ tín dụng / Ghi nợ',
            description: 'Hỗ trợ Visa, Mastercard, JCB',
          ),
          PaymentMethodItem(
            id: 'momo',
            name: 'Ví điện tử MoMo',
            description: 'Thanh toán tiện lợi qua ứng dụng MoMo',
          ),
        ];
        emit(state.copyWith(methods: methods));
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async => emit(state.copyWith(isShimmerLoading: false)),
      handleLoading: false,
    );
  }

  void _onSelectPaymentMethodPressed(
    SelectPaymentMethodPressed event,
    Emitter<PaymentMethodsState> emit,
  ) {
    emit(state.copyWith(selectedMethodId: event.methodId));
  }
}
