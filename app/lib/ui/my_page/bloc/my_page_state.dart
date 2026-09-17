import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:app/app.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

part 'my_page_state.freezed.dart';

@freezed
sealed class MyPageState extends BaseBlocState with _$MyPageState {
  const MyPageState._();

  const factory MyPageState({
    ProfileEntity? profile,
    @Default(
      AccountStatsEntity(orderCount: 0, favoriteCount: 0, voucherCount: 0),
    )
    AccountStatsEntity stats,
    @Default(false) bool isShimmerLoading,
    @Default(false) bool isSaving,
    @Default(false) bool saveSucceeded,
    AppException? loadException,
  }) = _MyPageState;
}
