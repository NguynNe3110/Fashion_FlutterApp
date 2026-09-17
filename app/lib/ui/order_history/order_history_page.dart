import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/order_history.dart';

@RoutePage()
class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState
    extends BasePageState<OrderHistoryPage, OrderHistoryBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const OrderHistoryPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Đơn hàng của tôi',
        leadingIcon: LeadingIcon.back,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h2Serif(fontSize: 21),
      ),
      body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
        builder: (context, state) {
          if (state.isShimmerLoading && state.orders.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.ink),
            );
          }
          if (state.orders.isEmpty) return _emptyState();

          return RefreshIndicator(
            color: AppColors.ink,
            onRefresh: () async => bloc.add(const OrderHistoryPageInitiated()),
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: state.orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, index) => _orderCard(state.orders[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _orderCard(OrderEntity order) {
    return InkWell(
      onTap: () => navigator.push(AppRouteInfo.orderDetail(orderId: order.id)),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.line),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '#${order.id.substring(0, 8).toUpperCase()}',
                  style: AppTextStyles.eyebrow().copyWith(color: AppColors.ink),
                ),
                const Spacer(),
                _statusBadge(order.status),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              order.createdAt?.toStringWithFormat('dd/MM/yyyy · HH:mm') ?? '',
              style: const TextStyle(color: AppColors.ink3, fontSize: 12),
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: AppColors.line),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.local_shipping_outlined,
                  size: 20,
                  color: AppColors.ink3,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${order.addressLine}, ${order.district}, ${order.city}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: AppColors.ink3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng cộng',
                  style: TextStyle(fontSize: 13, color: AppColors.ink3),
                ),
                Text(
                  NumberFormatUtils.formatYen(order.totalPrice.toDouble()),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBadge(OrderStatus status) {
    final (label, color) = switch (status) {
      OrderStatus.pending => ('Chờ xác nhận', AppColors.ink3),
      OrderStatus.confirmed => ('Đã xác nhận', const Color(0xFF8A633B)),
      OrderStatus.shipping => ('Đang giao', const Color(0xFF366C76)),
      OrderStatus.delivered => ('Đã giao', AppColors.success),
      OrderStatus.cancelled => ('Đã hủy', AppColors.sale),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: AppColors.ink4,
            ),
            const SizedBox(height: 20),
            Text(
              'Chưa có đơn hàng',
              style: AppTextStyles.h2Serif(fontSize: 26),
            ),
            const SizedBox(height: 10),
            const Text(
              'Đơn hàng bạn đặt sẽ xuất hiện tại đây.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.ink3),
            ),
          ],
        ),
      ),
    );
  }
}
