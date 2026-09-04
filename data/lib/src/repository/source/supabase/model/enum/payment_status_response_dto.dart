import 'package:freezed_annotation/freezed_annotation.dart';

enum PaymentStatusResponseDto {
  @JsonValue('unpaid')
  unpaid,
  @JsonValue('paid')
  paid,
  @JsonValue('refunded')
  refunded,
}
