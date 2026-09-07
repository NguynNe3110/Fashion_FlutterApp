import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_addresses_use_case.freezed.dart';

@Injectable()
class GetAddressesUseCase extends BaseFutureUseCase<GetAddressesUseCaseInput, GetAddressesUseCaseOutput> {
  final AddressRepository _addressRepository;

  GetAddressesUseCase(this._addressRepository);

  @protected
  @override
  Future<GetAddressesUseCaseOutput> buildUseCase(GetAddressesUseCaseInput input) async {
    final addresses = await _addressRepository.getAddresses(userId: input.userId);
    return GetAddressesUseCaseOutput(addresses: addresses);
  }
}

@freezed
sealed class GetAddressesUseCaseInput extends BaseInput with _$GetAddressesUseCaseInput {
  const GetAddressesUseCaseInput._();
  const factory GetAddressesUseCaseInput({
    required String userId,
  }) = _GetAddressesUseCaseInput;
}

@freezed
sealed class GetAddressesUseCaseOutput extends BaseOutput with _$GetAddressesUseCaseOutput {
  const GetAddressesUseCaseOutput._();
  const factory GetAddressesUseCaseOutput({
    required List<AddressEntity> addresses,
  }) = _GetAddressesUseCaseOutput;
}
