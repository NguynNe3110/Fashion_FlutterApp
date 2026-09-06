enum PaymentStatus {
  unpaid,
  paid,
  refunded;

  String get displayName {
    switch (this) {
      case PaymentStatus.unpaid:
        return 'Chưa thanh toán';
      case PaymentStatus.paid:
        return 'Đã thanh toán';
      case PaymentStatus.refunded:
        return 'Đã hoàn tiền';
    }
  }
}
