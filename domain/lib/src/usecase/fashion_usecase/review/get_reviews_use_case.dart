import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_reviews_use_case.freezed.dart';

@Injectable()
class GetReviewsUseCase extends BaseFutureUseCase<GetReviewsUseCaseInput, GetReviewsUseCaseOutput> {
  final ReviewRepository _reviewRepository;

  GetReviewsUseCase(this._reviewRepository);

  @protected
  @override
  Future<GetReviewsUseCaseOutput> buildUseCase(GetReviewsUseCaseInput input) async {
    final reviews = await _reviewRepository.getReviews(productId: input.productId);
    return GetReviewsUseCaseOutput(reviews: reviews);
  }
}

@freezed
sealed class GetReviewsUseCaseInput extends BaseInput with _$GetReviewsUseCaseInput {
  const GetReviewsUseCaseInput._();
  const factory GetReviewsUseCaseInput({
    required String productId,
  }) = _GetReviewsUseCaseInput;
}

@freezed
sealed class GetReviewsUseCaseOutput extends BaseOutput with _$GetReviewsUseCaseOutput {
  const GetReviewsUseCaseOutput._();
  const factory GetReviewsUseCaseOutput({
    required List<ReviewEntity> reviews,
  }) = _GetReviewsUseCaseOutput;
}
