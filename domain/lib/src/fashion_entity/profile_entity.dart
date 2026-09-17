import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String id,
    required String fullName,
    @Default('') String email,
    String? phoneNumber,
    String? avatarUrl,
    DateTime? dateOfBirth,
    String? gender,
    @Default('silver') String membershipTier,
    @Default(false) bool marketingOptIn,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProfileEntity;
}
