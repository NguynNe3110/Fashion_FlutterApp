import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_address_use_case.freezed.dart';

@Injectable()
class CreateAddressUseCase extends BaseFutureUseCase<CreateAddressUseCaseInput, CreateAddressUseCaseOutput> {
  final AddressRepository _addressRepository;

  CreateAddressUseCase(this._addressRepository);

  @protected
  @override
  Future<CreateAddressUseCaseOutput> buildUseCase(CreateAddressUseCaseInput input) async {
    final address = await _addressRepository.createAddress(address: input.address);
    return CreateAddressUseCaseOutput(address: address);
  }
}

@freezed
sealed class CreateAddressUseCaseInput extends BaseInput with _$CreateAddressUseCaseInput {
  const CreateAddressUseCaseInput._();
  const factory CreateAddressUseCaseInput({
    required AddressEntity address,
  }) = _CreateAddressUseCaseInput;
}

@freezed
sealed class CreateAddressUseCaseOutput extends BaseOutput with _$CreateAddressUseCaseOutput {
  const CreateAddressUseCaseOutput._();
  const factory CreateAddressUseCaseOutput({
    required AddressEntity address,
  }) = _CreateAddressUseCaseOutput;
}
