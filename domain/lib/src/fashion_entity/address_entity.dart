import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_entity.freezed.dart';

@freezed
class AddressEntity with _$AddressEntity {
  const factory AddressEntity({
    required String id,
    required String userId,
    String? label,
    required String receiverName,
    required String phoneNumber,
    required String addressLine, // so nha
    required String city, //tinh
    required String district, //  quan/huyen
    String? ward, // phuong / xa
    String? postalCode,
    @Default(false) bool isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AddressEntity;
}
