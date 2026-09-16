import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'review_event.freezed.dart';

abstract class ReviewEvent extends BaseBlocEvent {
  const ReviewEvent();
}

@freezed
class ReviewPageInitiated extends ReviewEvent with _$ReviewPageInitiated {
  const factory ReviewPageInitiated({required String productId}) =
      _ReviewPageInitiated;
}

@freezed
class RatingChanged extends ReviewEvent with _$RatingChanged {
  const factory RatingChanged({required int rating}) = _RatingChanged;
}

@freezed
class CommentChanged extends ReviewEvent with _$CommentChanged {
  const factory CommentChanged({required String comment}) = _CommentChanged;
}

@freezed
class SubmitReviewPressed extends ReviewEvent with _$SubmitReviewPressed {
  const factory SubmitReviewPressed({required String productId}) =
      _SubmitReviewPressed;
}
