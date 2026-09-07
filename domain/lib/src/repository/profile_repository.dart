import 'package:domain/domain.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile({required String userId});
  Future<ProfileEntity> updateProfile({required String userId, required Map<String, dynamic> data});
}
