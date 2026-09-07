import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_review_use_case.freezed.dart';

@Injectable()
class CreateReviewUseCase extends BaseFutureUseCase<CreateReviewUseCaseInput, CreateReviewUseCaseOutput> {
  final ReviewRepository _reviewRepository;

  CreateReviewUseCase(this._reviewRepository);

  @protected
  @override
  Future<CreateReviewUseCaseOutput> buildUseCase(CreateReviewUseCaseInput input) async {
    final review = await _reviewRepository.createReview(data: input.data);
    return CreateReviewUseCaseOutput(review: review);
  }
}

@freezed
sealed class CreateReviewUseCaseInput extends BaseInput with _$CreateReviewUseCaseInput {
  const CreateReviewUseCaseInput._();
  const factory CreateReviewUseCaseInput({
    required CreateReviewRequestEntity data,
  }) = _CreateReviewUseCaseInput;
}

@freezed
sealed class CreateReviewUseCaseOutput extends BaseOutput with _$CreateReviewUseCaseOutput {
  const CreateReviewUseCaseOutput._();
  const factory CreateReviewUseCaseOutput({
    required ReviewEntity review,
  }) = _CreateReviewUseCaseOutput;
}
