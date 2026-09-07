

import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_categories_use_case.freezed.dart';

@Injectable()
class GetCategoriesUseCase extends BaseFutureUseCase<GetCategoriesUseCaseInput, GetCategoriesUseCaseOutput>{
  final CategoryRepository _categoryRepository;

  GetCategoriesUseCase(this._categoryRepository);

  @protected
  @override
  Future<GetCategoriesUseCaseOutput> buildUseCase(GetCategoriesUseCaseInput input) async {
    final categories = await _categoryRepository.getCategories();
    return GetCategoriesUseCaseOutput(categories: categories);
  }

}

@freezed
sealed class GetCategoriesUseCaseInput extends BaseInput with _$GetCategoriesUseCaseInput {
  const GetCategoriesUseCaseInput._();
  const factory GetCategoriesUseCaseInput() = _GetCategoriesUseCaseInput;
}

@freezed
sealed class GetCategoriesUseCaseOutput extends BaseOutput with _$GetCategoriesUseCaseOutput {
  const GetCategoriesUseCaseOutput._();
  const factory GetCategoriesUseCaseOutput({
    required List<CategoryEntity> categories,
  }) = _GetCategoriesUseCaseOutput;
}