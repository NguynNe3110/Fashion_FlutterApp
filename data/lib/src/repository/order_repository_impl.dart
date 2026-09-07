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
    final json = <String, dynamic>{
      'user_id': data.userId,
      'total_price': data.totalPrice,
      'address_line': data.addressLine,
      if (data.paymentMethod != null) 'payment_method': data.paymentMethod,
      if (data.status != null) 'status': data.status,
      if (data.note != null) 'note': data.note,
    };
    final dto = await _orderSupabaseService.createOrder(data: json);
    return _orderMapper.mapToEntity(dto);
  }
}
