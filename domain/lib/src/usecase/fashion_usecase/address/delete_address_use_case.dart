import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_address_use_case.freezed.dart';

@Injectable()
class DeleteAddressUseCase extends BaseFutureUseCase<DeleteAddressUseCaseInput, DeleteAddressUseCaseOutput> {
  final AddressRepository _addressRepository;

  DeleteAddressUseCase(this._addressRepository);

  @protected
  @override
  Future<DeleteAddressUseCaseOutput> buildUseCase(DeleteAddressUseCaseInput input) async {
    await _addressRepository.deleteAddress(id: input.id);
    return const DeleteAddressUseCaseOutput();
  }
}

@freezed
sealed class DeleteAddressUseCaseInput extends BaseInput with _$DeleteAddressUseCaseInput {
  const DeleteAddressUseCaseInput._();
  const factory DeleteAddressUseCaseInput({
    required String id,
  }) = _DeleteAddressUseCaseInput;
}

@freezed
sealed class DeleteAddressUseCaseOutput extends BaseOutput with _$DeleteAddressUseCaseOutput {
  const DeleteAddressUseCaseOutput._();
  const factory DeleteAddressUseCaseOutput() = _DeleteAddressUseCaseOutput;
}
