import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain.dart';

part 'get_account_stats_use_case.freezed.dart';

@Injectable()
class GetAccountStatsUseCase
    extends BaseFutureUseCase<GetAccountStatsInput, GetAccountStatsOutput> {
  const GetAccountStatsUseCase(this._repository);

  final ProfileRepository _repository;

  @override
  Future<GetAccountStatsOutput> buildUseCase(GetAccountStatsInput input) async {
    final stats = await _repository.getAccountStats(userId: input.userId);
    return GetAccountStatsOutput(stats: stats);
  }
}

@freezed
sealed class GetAccountStatsInput extends BaseInput
    with _$GetAccountStatsInput {
  const GetAccountStatsInput._();
  const factory GetAccountStatsInput({required String userId}) =
      _GetAccountStatsInput;
}

@freezed
sealed class GetAccountStatsOutput extends BaseOutput
    with _$GetAccountStatsOutput {
  const GetAccountStatsOutput._();
  const factory GetAccountStatsOutput({required AccountStatsEntity stats}) =
      _GetAccountStatsOutput;
}
