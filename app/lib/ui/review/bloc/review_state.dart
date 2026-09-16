import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'review_state.freezed.dart';

@freezed
class ReviewState extends BaseBlocState with _$ReviewState {
  const factory ReviewState({
    @Default([]) List<ReviewEntity> reviews,
    @Default(5) int selectedRating,
    @Default('') String comment,
    @Default(false) bool isSubmitting,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _ReviewState;
}
