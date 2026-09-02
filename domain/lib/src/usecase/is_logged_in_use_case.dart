import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

part 'is_logged_in_use_case.freezed.dart';

@Injectable()
class IsLoggedInUseCase
    extends BaseSyncUseCase<IsLoggedInInput, IsLoggedInOutput> {
  const IsLoggedInUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  IsLoggedInOutput buildUseCase(IsLoggedInInput input) {
    return IsLoggedInOutput(isLoggedIn: _repository.isLoggedIn);
  }
}

@Freezed(
    when: FreezedWhenOptions(when: true), map: FreezedMapOptions(map: true))
sealed class IsLoggedInInput extends BaseInput with _$IsLoggedInInput {
  const IsLoggedInInput._();
  const factory IsLoggedInInput() = _IsLoggedInInput;
}

@freezed
sealed class IsLoggedInOutput extends BaseOutput with _$IsLoggedInOutput {
  const IsLoggedInOutput._();

  const factory IsLoggedInOutput({
    @Default(false) bool isLoggedIn,
  }) = _IsLoggedInOutput;
}
