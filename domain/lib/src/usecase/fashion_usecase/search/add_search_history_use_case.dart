import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain.dart';

part 'add_search_history_use_case.freezed.dart';

@Injectable()
class AddSearchHistoryUseCase
    extends BaseFutureUseCase<AddSearchHistoryInput, AddSearchHistoryOutput> {
  AddSearchHistoryUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<AddSearchHistoryOutput> buildUseCase(
    AddSearchHistoryInput input,
  ) async {
    await _repository.addSearchHistory(input.keyword);
    return const AddSearchHistoryOutput();
  }
}

@freezed
sealed class AddSearchHistoryInput extends BaseInput
    with _$AddSearchHistoryInput {
  const factory AddSearchHistoryInput({required String keyword}) =
      _AddSearchHistoryInput;
}

@freezed
sealed class AddSearchHistoryOutput extends BaseOutput
    with _$AddSearchHistoryOutput {
  const factory AddSearchHistoryOutput() = _AddSearchHistoryOutput;
}
