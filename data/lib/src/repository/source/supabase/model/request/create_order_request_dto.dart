import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request_dto.freezed.dart';
part 'create_order_request_dto.g.dart';

@freezed
sealed class CreateOrderRequestDto with _$CreateOrderRequestDto {
  const factory CreateOrderRequestDto({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'subtotal_price') required double subtotalPrice,
    @JsonKey(name: 'shipping_fee') required double shippingFee,
    @JsonKey(name: 'discount_amount') required double discountAmount,
    @JsonKey(name: 'total_price') required double totalPrice,
    @JsonKey(name: 'receiver_name') required String receiverName,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'address_line') required String addressLine,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'district') required String district,
    @JsonKey(name: 'ward') String? ward,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'note') String? note,
  }) = _CreateOrderRequestDto;

  factory CreateOrderRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestDtoFromJson(json);
}
