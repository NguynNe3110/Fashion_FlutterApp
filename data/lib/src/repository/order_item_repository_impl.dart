import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: OrderItemRepository)
class OrderItemRepositoryImpl extends OrderItemRepository {
  final OrderItemSupabaseService _orderItemSupabaseService;
  final OrderItemMapper _orderItemMapper;

  OrderItemRepositoryImpl(this._orderItemMapper, this._orderItemSupabaseService);

  @override
  Future<List<OrderItemEntity>> getOrderItems({required String orderId}) async {
    final dtos = await _orderItemSupabaseService.getOrderItems(orderId: orderId);
    return _orderItemMapper.mapToListEntity(dtos);
  }

  @override
  Future<OrderItemEntity> getOrderItemById({required String id}) async {
    final dto = await _orderItemSupabaseService.getOrderItemById(id: id);
    return _orderItemMapper.mapToEntity(dto);
  }

  @override
  Future<List<OrderItemEntity>> createOrderItems({required List<Map<String, dynamic>> data}) async {
    final dtos = await _orderItemSupabaseService.createOrderItems(data: data);
    return _orderItemMapper.mapToListEntity(dtos);
  }
}
