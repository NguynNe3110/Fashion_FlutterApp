enum PaymentMethod {
  cod,
  bankTransfer,
  eWallet;

  String get displayName {
    switch (this) {
      case PaymentMethod.cod:
        return 'Thanh toán khi nhận hàng';
      case PaymentMethod.bankTransfer:
        return 'Chuyển khoản ngân hàng';
      case PaymentMethod.eWallet:
        return 'Ví điện tử';
    }
  }
}
