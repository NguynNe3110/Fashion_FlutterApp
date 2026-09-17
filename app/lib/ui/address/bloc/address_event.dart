import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'address_event.freezed.dart';

abstract class AddressEvent extends BaseBlocEvent {
  const AddressEvent();
}

@freezed
class AddressPageInitiated extends AddressEvent with _$AddressPageInitiated {
  const factory AddressPageInitiated() = _AddressPageInitiated;
}

@freezed
class DeleteAddressPressed extends AddressEvent with _$DeleteAddressPressed {
  const factory DeleteAddressPressed({required String id}) =
      _DeleteAddressPressed;
}

@freezed
class SetDefaultAddressPressed extends AddressEvent
    with _$SetDefaultAddressPressed {
  const factory SetDefaultAddressPressed({required String id}) =
      _SetDefaultAddressPressed;
}

@freezed
class AddAddressSubmitted extends AddressEvent with _$AddAddressSubmitted {
  const factory AddAddressSubmitted({
    required String label,
    required String receiverName,
    required String phoneNumber,
    required String addressLine,
    required String city,
    required String district,
    String? ward,
    @Default(false) bool isDefault,
  }) = _AddAddressSubmitted;
}
