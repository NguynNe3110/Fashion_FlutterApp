import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';


part 'order_entity.freezed.dart';

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String userId,
    @Default(OrderStatus.pending) OrderStatus status,
    @Default(PaymentMethod.cod) PaymentMethod paymentMethod,
    @Default(PaymentStatus.unpaid) PaymentStatus paymentStatus,
    @Default(0) int subtotalPrice,
    @Default(0) int shippingFee,
    @Default(0) int discountAmount,
    required int totalPrice,
    required String receiverName,
    required String phoneNumber,
    required String addressLine,
    required String city,
    required String district,
    String? ward,
    String? postalCode,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _OrderEntity;
}
