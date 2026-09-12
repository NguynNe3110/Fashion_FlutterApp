import 'package:domain/domain.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfileById({required String userId});
  Future<ProfileEntity> updateProfile({required String userId, required UpdateProfileRequestEntity data});
  Future<ProfileEntity> getProfile();
}
