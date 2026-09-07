import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AddressMapper extends BaseDataMapper<AddressResponseDto, AddressEntity> {
  @override
  AddressEntity mapToEntity(AddressResponseDto? data) {
    return AddressEntity(
      id: data?.id ?? '',
      userId: data?.userId ?? '',
      label: data?.label,
      receiverName: data?.receiverName ?? '',
      phoneNumber: data?.phoneNumber ?? '',
      addressLine: data?.addressLine ?? '',
      city: data?.city ?? '',
      district: data?.district ?? '',
      ward: data?.ward,
      postalCode: data?.postalCode,
      isDefault: data?.isDefault ?? false,
      createdAt: DateTime.tryParse(data?.createdAt ?? ''),
      updatedAt: DateTime.tryParse(data?.updatedAt ?? ''),
    );
  }

  Map<String, dynamic> mapToDataMap(AddressEntity entity) {
    return {
      'user_id': entity.userId,
      'label': entity.label,
      'receiver_name': entity.receiverName,
      'phone_number': entity.phoneNumber,
      'address_line': entity.addressLine,
      'city': entity.city,
      'district': entity.district,
      'ward': entity.ward,
      'postal_code': entity.postalCode,
      'is_default': entity.isDefault,
    };
  }
}
