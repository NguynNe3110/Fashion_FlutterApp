import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request_dto.freezed.dart';
part 'update_profile_request_dto.g.dart';

@freezed
sealed class UpdateProfileRequestDto with _$UpdateProfileRequestDto {
  const factory UpdateProfileRequestDto({
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'marketing_opt_in') @Default(false) bool marketingOptIn,
  }) = _UpdateProfileRequestDto;

  factory UpdateProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestDtoFromJson(json);
}
