import 'package:freezed_annotation/freezed_annotation.dart';

enum PaymentMethodResponseDto {
  @JsonValue('cod')
  cod,
  @JsonValue('bank_transfer')
  bankTransfer,
  @JsonValue('e_wallet')
  eWallet,
}
