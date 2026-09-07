import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: AddressRepository)
class AddressRepositoryImpl extends AddressRepository {
  final AddressSupabaseService _addressSupabaseService;
  final AddressMapper _addressMapper;

  AddressRepositoryImpl(this._addressMapper, this._addressSupabaseService);

  @override
  Future<List<AddressEntity>> getAddresses({required String userId}) async {
    final dtos = await _addressSupabaseService.getAddresses(userId: userId);
    return _addressMapper.mapToListEntity(dtos);
  }

  @override
  Future<AddressEntity> getAddressById({required String id}) async {
    final dto = await _addressSupabaseService.getAddressById(id: id);
    return _addressMapper.mapToEntity(dto);
  }

  @override
  Future<AddressEntity> createAddress({required AddressEntity address}) async {
    final dataMap = _addressMapper.mapToDataMap(address);
    final dto = await _addressSupabaseService.createAddress(data: dataMap);
    return _addressMapper.mapToEntity(dto);
  }

  @override
  Future<AddressEntity> updateAddress({required AddressEntity address}) async {
    final dataMap = _addressMapper.mapToDataMap(address);
    final dto = await _addressSupabaseService.updateAddress(
      id: address.id,
      data: dataMap,
    );
    return _addressMapper.mapToEntity(dto);
  }

  @override
  Future<void> deleteAddress({required String id}) async {
    await _addressSupabaseService.deleteAddress(id: id);
  }
}
