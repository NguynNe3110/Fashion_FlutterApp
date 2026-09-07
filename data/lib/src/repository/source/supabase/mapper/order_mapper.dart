import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class OrderMapper extends BaseDataMapper<OrderResponseDto, OrderEntity> {
  @override
  OrderEntity mapToEntity(OrderResponseDto? data) {
    return OrderEntity(
      id: data?.id ?? '',
      userId: data?.userId ?? '',
      status: _mapOrderStatus(data?.status),
      paymentMethod: _mapPaymentMethod(data?.paymentMethod),
      paymentStatus: _mapPaymentStatus(data?.paymentStatus),
      subtotalPrice: data?.subtotalPrice.toInt() ?? 0,
      shippingFee: data?.shippingFee.toInt() ?? 0,
      discountAmount: data?.discountAmount.toInt() ?? 0,
      totalPrice: data?.totalPrice.toInt() ?? 0,
      receiverName: data?.receiverName ?? '',
      phoneNumber: data?.phoneNumber ?? '',
      addressLine: data?.addressLine ?? '',
      city: data?.city ?? '',
      district: data?.district ?? '',
      ward: data?.ward,
      postalCode: data?.postalCode,
      note: data?.note,
      createdAt: DateTime.tryParse(data?.createdAt ?? ''),
      updatedAt: DateTime.tryParse(data?.updatedAt ?? ''),
    );
  }

  OrderStatus _mapOrderStatus(OrderStatusResponseDto? dto) {
    switch (dto) {
      case OrderStatusResponseDto.pending:
        return OrderStatus.pending;
      case OrderStatusResponseDto.confirmed:
        return OrderStatus.confirmed;
      case OrderStatusResponseDto.shipping:
        return OrderStatus.shipping;
      case OrderStatusResponseDto.delivered:
        return OrderStatus.delivered;
      case OrderStatusResponseDto.cancelled:
        return OrderStatus.cancelled;
      case null:
        return OrderStatus.pending;
    }
  }

  PaymentMethod _mapPaymentMethod(PaymentMethodResponseDto? dto) {
    switch (dto) {
      case PaymentMethodResponseDto.cod:
        return PaymentMethod.cod;
      case PaymentMethodResponseDto.bankTransfer:
        return PaymentMethod.bankTransfer;
      case PaymentMethodResponseDto.eWallet:
        return PaymentMethod.eWallet;
      case null:
        return PaymentMethod.cod;
    }
  }

  PaymentStatus _mapPaymentStatus(PaymentStatusResponseDto? dto) {
    switch (dto) {
      case PaymentStatusResponseDto.unpaid:
        return PaymentStatus.unpaid;
      case PaymentStatusResponseDto.paid:
        return PaymentStatus.paid;
      case PaymentStatusResponseDto.refunded:
        return PaymentStatus.refunded;
      case null:
        return PaymentStatus.unpaid;
    }
  }
}
