import 'package:domain/domain.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrders({required String userId});
  Future<OrderEntity> getOrderById({required String id});
  Future<OrderEntity> createOrder({required CreateOrderRequestEntity data});
}
