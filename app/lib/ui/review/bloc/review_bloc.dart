import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'review.dart';

@injectable
class ReviewBloc extends BaseBloc<ReviewEvent, ReviewState> {
  ReviewBloc(
    this._getReviewsUseCase,
    this._createReviewUseCase,
    this._getMeUseCase,
  ) : super(const ReviewState()) {
    on<ReviewPageInitiated>(_onReviewPageInitiated);
    on<RatingChanged>(_onRatingChanged);
    on<CommentChanged>(_onCommentChanged);
    on<SubmitReviewPressed>(_onSubmitReviewPressed);
  }

  final GetReviewsUseCase _getReviewsUseCase;
  final CreateReviewUseCase _createReviewUseCase;
  final GetMeUseCase _getMeUseCase;

  FutureOr<void> _onReviewPageInitiated(
    ReviewPageInitiated event,
    Emitter<ReviewState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(loadException: null));
        final output = await _getReviewsUseCase.execute(
          GetReviewsUseCaseInput(productId: event.productId),
        );
        emit(state.copyWith(reviews: output.reviews));
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async => emit(state.copyWith(isShimmerLoading: false)),
      doOnError: (e) async => emit(state.copyWith(loadException: e)),
      handleLoading: false,
    );
  }

  void _onRatingChanged(
    RatingChanged event,
    Emitter<ReviewState> emit,
  ) {
    emit(state.copyWith(selectedRating: event.rating));
  }

  void _onCommentChanged(
    CommentChanged event,
    Emitter<ReviewState> emit,
  ) {
    emit(state.copyWith(comment: event.comment));
  }

  FutureOr<void> _onSubmitReviewPressed(
    SubmitReviewPressed event,
    Emitter<ReviewState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final user = await _getMeUseCase.execute(const GetMeUseCaseInput());
        final userId = user.profile.id.toString();

        await _createReviewUseCase.execute(
          CreateReviewUseCaseInput(
            data: CreateReviewRequestEntity(
              productId: event.productId,
              userId: userId,
              rating: state.selectedRating,
              comment: state.comment,
            ),
          ),
        );
        emit(state.copyWith(comment: ''));
        add(ReviewPageInitiated(productId: event.productId));
      },
    );
  }
}
