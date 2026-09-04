import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response_dto.freezed.dart';
part 'profile_response_dto.g.dart';

@freezed
sealed class ProfileResponseDto with _$ProfileResponseDto {
  const factory ProfileResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ProfileResponseDto;

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseDtoFromJson(json);
}
