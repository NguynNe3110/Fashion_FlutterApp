import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String id,
    required String fullName,
    String? phoneNumber,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProfileEntity;
}
