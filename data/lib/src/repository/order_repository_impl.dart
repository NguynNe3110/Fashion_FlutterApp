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
  Future<OrderEntity> createOrder({required CreateOrderRequestEntity data}) async {
    final dataMap = _orderMapper.mapToDataMap(data);
    final dto = await _orderSupabaseService.createOrder(data: dataMap);
    return _orderMapper.mapToEntity(dto);
  }
}
