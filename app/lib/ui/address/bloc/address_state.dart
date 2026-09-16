import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../../../../app.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState extends BaseBlocState with _$AddressState {
  const factory AddressState({
    @Default([]) List<AddressEntity> addresses,
    @Default(false) bool isShimmerLoading,
    AppException? loadException,
  }) = _AddressState;
}
