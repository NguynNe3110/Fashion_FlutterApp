import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl extends OrderRepository {
  final OrderSupabaseService _orderSupabaseService;
  final OrderMapper _orderMapper;

  OrderRepositoryImpl(this._orderMapper, this._orderSupabaseService);

  @override
  Future<List<OrderEntity>> getOrders({required String userId}) async {
    final dtos = await _orderSupabaseService.getOrders(userId: userId);
    return _orderMapper.mapToListEntity(dtos);
  }

  @override
  Future<OrderEntity> getOrderById({required String id}) async {
    final dto = await _orderSupabaseService.getOrderById(id: id);
    return _orderMapper.mapToEntity(dto);
  }

  @override
  Future<List<OrderEntity>> getOrderHistory({
    required String userId,
    int page = 0,
    int limit = 20,
  }) async {
    final dtos = await _orderSupabaseService.getOrderHistory(
      userId: userId,
      page: page,
      limit: limit,
    );
    return _orderMapper.mapToListEntity(dtos);
  }

  @override
  Future<OrderEntity> createOrder({
    required CreateOrderRequestEntity orderData,
  }) async {
    final responseDto = await _orderSupabaseService.checkout(
      addressId: orderData.addressId,
      selectedCartItemIds: orderData.selectedCartItemIds,
      shippingFee: orderData.shippingFee,
      paymentMethod: orderData.paymentMethod ?? 'cod',
      note: orderData.note,
    );
    return _orderMapper.mapToEntity(responseDto);
  }
}
