import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_profile_use_case.freezed.dart';

@Injectable()
class GetProfileUseCase extends BaseFutureUseCase<GetProfileUseCaseInput, GetProfileUseCaseOutput> {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  @protected
  @override
  Future<GetProfileUseCaseOutput> buildUseCase(GetProfileUseCaseInput input) async {
    final profile = await _profileRepository.getProfile(userId: input.userId);
    return GetProfileUseCaseOutput(profile: profile);
  }
}

@freezed
sealed class GetProfileUseCaseInput extends BaseInput with _$GetProfileUseCaseInput {
  const GetProfileUseCaseInput._();
  const factory GetProfileUseCaseInput({
    required String userId,
  }) = _GetProfileUseCaseInput;
}

@freezed
sealed class GetProfileUseCaseOutput extends BaseOutput with _$GetProfileUseCaseOutput {
  const GetProfileUseCaseOutput._();
  const factory GetProfileUseCaseOutput({
    required ProfileEntity profile,
  }) = _GetProfileUseCaseOutput;
}
