import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_me_use_case.freezed.dart';

@Injectable()
class GetMeUseCase extends BaseFutureUseCase<GetMeUseCaseInput, GetMeUseCaseOutput> {
  final ProfileRepository _profileRepository;

  GetMeUseCase(this._profileRepository);

  @protected
  @override
  Future<GetMeUseCaseOutput> buildUseCase(GetMeUseCaseInput input) async {
    final profile = await _profileRepository.getProfile();
    return GetMeUseCaseOutput(profile: profile);
  }
}

@freezed
sealed class GetMeUseCaseInput extends BaseInput with _$GetMeUseCaseInput {
  const GetMeUseCaseInput._();
  const factory GetMeUseCaseInput() = _GetMeUseCaseInput;
}

@freezed
sealed class GetMeUseCaseOutput extends BaseOutput with _$GetMeUseCaseOutput {
  const GetMeUseCaseOutput._();
  const factory GetMeUseCaseOutput({
    required ProfileEntity profile,
  }) = _GetMeUseCaseOutput;
}