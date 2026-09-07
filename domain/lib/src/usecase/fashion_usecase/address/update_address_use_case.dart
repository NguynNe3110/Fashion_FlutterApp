import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_address_use_case.freezed.dart';

@Injectable()
class UpdateAddressUseCase extends BaseFutureUseCase<UpdateAddressUseCaseInput, UpdateAddressUseCaseOutput> {
  final AddressRepository _addressRepository;

  UpdateAddressUseCase(this._addressRepository);

  @protected
  @override
  Future<UpdateAddressUseCaseOutput> buildUseCase(UpdateAddressUseCaseInput input) async {
    final address = await _addressRepository.updateAddress(address: input.address);
    return UpdateAddressUseCaseOutput(address: address);
  }
}

@freezed
sealed class UpdateAddressUseCaseInput extends BaseInput with _$UpdateAddressUseCaseInput {
  const UpdateAddressUseCaseInput._();
  const factory UpdateAddressUseCaseInput({
    required AddressEntity address,
  }) = _UpdateAddressUseCaseInput;
}

@freezed
sealed class UpdateAddressUseCaseOutput extends BaseOutput with _$UpdateAddressUseCaseOutput {
  const UpdateAddressUseCaseOutput._();
  const factory UpdateAddressUseCaseOutput({
    required AddressEntity address,
  }) = _UpdateAddressUseCaseOutput;
}
