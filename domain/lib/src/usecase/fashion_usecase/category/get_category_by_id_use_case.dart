

import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_category_by_id_use_case.freezed.dart';


@Injectable()
class GetCategoryByIdUseCase extends BaseFutureUseCase<GetCategoryByIdUseCaseInput, GetCategoryByIdUseCaseOutput>{

  final CategoryRepository _categoryRepository;

  GetCategoryByIdUseCase(this._categoryRepository);

  @protected
  @override
  Future<GetCategoryByIdUseCaseOutput> buildUseCase(GetCategoryByIdUseCaseInput input) async {
    final category = await _categoryRepository.getCategoryById(id: input.id);
    return GetCategoryByIdUseCaseOutput(category: category);
  }
  
}

@freezed
sealed class GetCategoryByIdUseCaseInput extends BaseInput with _$GetCategoryByIdUseCaseInput {
  const GetCategoryByIdUseCaseInput._();
  const factory GetCategoryByIdUseCaseInput({
    required String id,
  }) = _GetCategoryByIdUseCaseInput;
}

@freezed
sealed class GetCategoryByIdUseCaseOutput extends BaseOutput with _$GetCategoryByIdUseCaseOutput {
  const GetCategoryByIdUseCaseOutput._();
  const factory GetCategoryByIdUseCaseOutput({
    required CategoryEntity category,
  }) = _GetCategoryByIdUseCaseOutput;
}