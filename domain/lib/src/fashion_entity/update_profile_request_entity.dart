import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request_entity.freezed.dart';

@freezed
sealed class UpdateProfileRequestEntity with _$UpdateProfileRequestEntity {
  const factory UpdateProfileRequestEntity({
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _UpdateProfileRequestEntity;
}
