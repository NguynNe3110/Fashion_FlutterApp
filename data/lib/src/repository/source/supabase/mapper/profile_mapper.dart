import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProfileMapper extends BaseDataMapper<ProfileResponseDto, ProfileEntity> {
  @override
  ProfileEntity mapToEntity(ProfileResponseDto? data) {
    return ProfileEntity(
      id: data?.id ?? '',
      fullName: data?.fullName ?? '',
      email: data?.email ?? '',
      phoneNumber: data?.phoneNumber,
      avatarUrl: data?.avatarUrl,
      dateOfBirth: DateTime.tryParse(data?.dateOfBirth ?? ''),
      gender: data?.gender,
      membershipTier: data?.membershipTier ?? 'silver',
      marketingOptIn: data?.marketingOptIn ?? false,
      createdAt: DateTime.tryParse(data?.createdAt ?? ''),
      updatedAt: DateTime.tryParse(data?.updatedAt ?? ''),
    );
  }

  UpdateProfileRequestDto mapToDto(UpdateProfileRequestEntity data) {
    return UpdateProfileRequestDto(
      fullName: data.fullName,
      phoneNumber: data.phoneNumber,
      avatarUrl: data.avatarUrl,
      dateOfBirth: data.dateOfBirth?.toIso8601String().split('T').first,
      gender: data.gender,
      marketingOptIn: data.marketingOptIn,
    );
  }
}
