import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'vouchers_event.freezed.dart';

abstract class VouchersEvent extends BaseBlocEvent {
  const VouchersEvent();
}

@freezed
class VouchersPageInitiated extends VouchersEvent with _$VouchersPageInitiated {
  const factory VouchersPageInitiated() = _VouchersPageInitiated;
}

@freezed
class ApplyVoucherPressed extends VouchersEvent with _$ApplyVoucherPressed {
  const factory ApplyVoucherPressed({required String code}) =
      _ApplyVoucherPressed;
}
