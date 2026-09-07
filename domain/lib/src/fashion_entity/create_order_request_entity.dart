import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request_entity.freezed.dart';

@freezed
sealed class CreateOrderRequestEntity with _$CreateOrderRequestEntity {
  const factory CreateOrderRequestEntity({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'total_price') required double totalPrice,
    @JsonKey(name: 'address_line') required String addressLine,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    String? status,
    String? note,
  }) = _CreateOrderRequestEntity;
}