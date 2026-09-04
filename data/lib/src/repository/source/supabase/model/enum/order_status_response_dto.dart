import 'package:freezed_annotation/freezed_annotation.dart';

enum OrderStatusResponseDto {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('shipping')
  shipping,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
}
