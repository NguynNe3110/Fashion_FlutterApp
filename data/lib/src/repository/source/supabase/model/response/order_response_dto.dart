import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/order_status_response_dto.dart';
import '../enum/payment_method_response_dto.dart';
import '../enum/payment_status_response_dto.dart';

part 'order_response_dto.freezed.dart';
part 'order_response_dto.g.dart';

@freezed
sealed class OrderResponseDto with _$OrderResponseDto {
  const factory OrderResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'status') @Default(OrderStatusResponseDto.pending) OrderStatusResponseDto status,
    @JsonKey(name: 'payment_method') @Default(PaymentMethodResponseDto.cod) PaymentMethodResponseDto paymentMethod,
    @JsonKey(name: 'payment_status') @Default(PaymentStatusResponseDto.unpaid) PaymentStatusResponseDto paymentStatus,
    @JsonKey(name: 'subtotal_price') @Default(0) double subtotalPrice,
    @JsonKey(name: 'shipping_fee') @Default(0) double shippingFee,
    @JsonKey(name: 'discount_amount') @Default(0) double discountAmount,
    @JsonKey(name: 'total_price') required double totalPrice,
    @JsonKey(name: 'receiver_name') required String receiverName,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'address_line') required String addressLine,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'district') required String district,
    @JsonKey(name: 'ward') String? ward,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _OrderResponseDto;

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseDtoFromJson(json);
}
