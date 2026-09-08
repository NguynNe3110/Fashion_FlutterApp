import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_profile_use_case.freezed.dart';

@Injectable()
class UpdateProfileUseCase extends BaseFutureUseCase<UpdateProfileUseCaseInput, UpdateProfileUseCaseOutput> {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase(this._profileRepository);

  @protected
  @override
  Future<UpdateProfileUseCaseOutput> buildUseCase(UpdateProfileUseCaseInput input) async {
    final profile = await _profileRepository.updateProfile(
      userId: input.userId,
      data: input.data,
    );
    return UpdateProfileUseCaseOutput(profile: profile);
  }
}

@freezed
sealed class UpdateProfileUseCaseInput extends BaseInput with _$UpdateProfileUseCaseInput {
  const UpdateProfileUseCaseInput._();
  const factory UpdateProfileUseCaseInput({
    required String userId,
    required UpdateProfileRequestEntity data,
  }) = _UpdateProfileUseCaseInput;
}

@freezed
sealed class UpdateProfileUseCaseOutput extends BaseOutput with _$UpdateProfileUseCaseOutput {
  const UpdateProfileUseCaseOutput._();
  const factory UpdateProfileUseCaseOutput({
    required ProfileEntity profile,
  }) = _UpdateProfileUseCaseOutput;
}
