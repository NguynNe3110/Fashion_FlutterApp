import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_review_use_case.freezed.dart';

@Injectable()
class DeleteReviewUseCase extends BaseFutureUseCase<DeleteReviewUseCaseInput, DeleteReviewUseCaseOutput> {
  final ReviewRepository _reviewRepository;

  DeleteReviewUseCase(this._reviewRepository);

  @protected
  @override
  Future<DeleteReviewUseCaseOutput> buildUseCase(DeleteReviewUseCaseInput input) async {
    await _reviewRepository.deleteReview(id: input.id);
    return const DeleteReviewUseCaseOutput();
  }
}

@freezed
sealed class DeleteReviewUseCaseInput extends BaseInput with _$DeleteReviewUseCaseInput {
  const DeleteReviewUseCaseInput._();
  const factory DeleteReviewUseCaseInput({
    required String id,
  }) = _DeleteReviewUseCaseInput;
}

@freezed
sealed class DeleteReviewUseCaseOutput extends BaseOutput with _$DeleteReviewUseCaseOutput {
  const DeleteReviewUseCaseOutput._();
  const factory DeleteReviewUseCaseOutput() = _DeleteReviewUseCaseOutput;
}
