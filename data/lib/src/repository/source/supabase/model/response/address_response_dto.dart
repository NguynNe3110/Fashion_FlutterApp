import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_response_dto.freezed.dart';
part 'address_response_dto.g.dart';

@freezed
sealed class AddressResponseDto with _$AddressResponseDto {
  const factory AddressResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'receiver_name') required String receiverName,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'address_line') required String addressLine,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'district') required String district,
    @JsonKey(name: 'ward') String? ward,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _AddressResponseDto;

  factory AddressResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseDtoFromJson(json);
}
