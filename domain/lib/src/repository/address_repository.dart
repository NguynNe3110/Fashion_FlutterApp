import 'package:domain/domain.dart';

abstract class AddressRepository {
  Future<List<AddressEntity>> getAddresses({required String userId});

  Future<AddressEntity> getAddressById({required String id});

  Future<AddressEntity> createAddress({required AddressEntity address});

  Future<AddressEntity> updateAddress({required AddressEntity address});

  Future<void> deleteAddress({required String id});
}
