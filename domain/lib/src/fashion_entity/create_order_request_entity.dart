import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request_entity.freezed.dart';

@freezed
sealed class CreateOrderRequestEntity with _$CreateOrderRequestEntity {
  const factory CreateOrderRequestEntity({
    required String userId,
    required String addressId,
    required List<String> selectedCartItemIds,
    required double subtotalPrice,
    required double shippingFee,
    required double discountAmount,
    required double totalPrice,
    required String receiverName,
    required String phoneNumber,
    required String addressLine,
    required String city,
    required String district,
    String? ward,
    String? postalCode,
    String? paymentMethod,
    String? status,
    String? note,
  }) = _CreateOrderRequestEntity;
}
