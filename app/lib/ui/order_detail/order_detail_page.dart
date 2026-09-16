import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';

@RoutePage()
class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key, required this.orderId});

  final String orderId;

  @override
  State<StatefulWidget> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends BasePageState<OrderDetailPage, OrderDetailBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(OrderDetailPageInitiated(orderId: widget.orderId));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Chi tiết đơn hàng',
        titleTextStyle: AppTextStyles.h2Serif().copyWith(
          fontSize: Dimens.d20.responsive(),
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<OrderDetailBloc, OrderDetailState>(
        builder: (context, state) {
          if (state.isShimmerLoading && state.order == null) {
            return const Center(child: CircularProgressIndicator(color: AppColors.ink));
          }

          final order = state.order;
          if (order == null) {
            return const Center(child: Text('Không tìm thấy thông tin đơn hàng'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(Dimens.d20.responsive()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(order),
                SizedBox(height: Dimens.d24.responsive()),
                _buildStatusSection(order),
                SizedBox(height: Dimens.d24.responsive()),
                _buildAddressSection(order),
                SizedBox(height: Dimens.d24.responsive()),
                _buildItemsSection(state.items),
                SizedBox(height: Dimens.d24.responsive()),
                _buildSummarySection(order),
                SizedBox(height: Dimens.d40.responsive()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(OrderEntity order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MÃ ĐƠN: #${order.id.substring(0, 8).toUpperCase()}',
          style: AppTextStyles.eyebrow(),
        ),
        SizedBox(height: Dimens.d4.responsive()),
        Text(
          'Ngày đặt: ${order.createdAt != null ? order.createdAt!.toStringWithFormat('dd/MM/yyyy HH:mm') : ''}',
          style: AppTextStyles.s14w400Secondary().copyWith(fontSize: Dimens.d12.responsive()),
        ),
      ],
    );
  }

  Widget _buildStatusSection(OrderEntity order) {
    return Container(
      padding: EdgeInsets.all(Dimens.d16.responsive()),
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
      ),
      child: Row(
        children: [
          Icon(Icons.local_shipping_outlined, color: AppColors.ink2, size: Dimens.d24.responsive()),
          SizedBox(width: Dimens.d16.responsive()),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trạng thái',
                  style: AppTextStyles.eyebrow().copyWith(fontSize: Dimens.d9.responsive()),
                ),
                SizedBox(height: Dimens.d4.responsive()),
                Text(
                  order.status.name.toUpperCase(),
                  style: AppTextStyles.s14w400Primary().copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection(OrderEntity order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ĐỊA CHỈ NHẬN HÀNG', style: AppTextStyles.eyebrow()),
        SizedBox(height: Dimens.d12.responsive()),
        Text(
          order.receiverName,
          style: AppTextStyles.s14w400Primary().copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: Dimens.d4.responsive()),
        Text(
          order.phoneNumber,
          style: AppTextStyles.s14w400Secondary(),
        ),
        SizedBox(height: Dimens.d4.responsive()),
        Text(
          '${order.addressLine}, ${order.ward ?? ''}, ${order.district}, ${order.city}',
          style: AppTextStyles.s14w400Secondary(),
        ),
      ],
    );
  }

  Widget _buildItemsSection(List<OrderItemEntity> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SẢN PHẨM (${items.length})', style: AppTextStyles.eyebrow()),
        SizedBox(height: Dimens.d12.responsive()),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (_, __) => Divider(height: Dimens.d24.responsive(), color: AppColors.line),
          itemBuilder: (context, index) {
            final item = items[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Dimens.d64.responsive(),
                  height: Dimens.d80.responsive(),
                  decoration: BoxDecoration(
                    color: AppColors.surface2,
                    borderRadius: BorderRadius.circular(Dimens.d4.responsive()),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: item.imageUrlSnapshot != null
                      ? Image.network(item.imageUrlSnapshot!, fit: BoxFit.cover)
                      : const Icon(Icons.image_outlined, color: AppColors.ink4),
                ),
                SizedBox(width: Dimens.d16.responsive()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productNameSnapshot,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.s14w400Primary().copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: Dimens.d4.responsive()),
                      Text(
                        'Số lượng: ${item.quantity}',
                        style: AppTextStyles.s14w400Secondary().copyWith(fontSize: Dimens.d12.responsive()),
                      ),
                      SizedBox(height: Dimens.d4.responsive()),
                      Text(
                        NumberFormatUtils.formatYen(item.priceSnapshot.toDouble()),
                        style: AppTextStyles.s14w400Primary().copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildSummarySection(OrderEntity order) {
    return Column(
      children: [
        _summaryRow('Tạm tính', order.subtotalPrice.toDouble()),
        _summaryRow('Phí giao hàng', order.shippingFee.toDouble()),
        if (order.discountAmount > 0)
          _summaryRow('Giảm giá', -order.discountAmount.toDouble(), isDiscount: true),
        Divider(height: Dimens.d32.responsive(), color: AppColors.ink),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TỔNG CỘNG', style: AppTextStyles.eyebrow().copyWith(color: AppColors.ink)),
            Text(
              NumberFormatUtils.formatYen(order.totalPrice.toDouble()),
              style: AppTextStyles.s14w400Primary().copyWith(
                fontSize: Dimens.d20.responsive(),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _summaryRow(String label, double value, {bool isDiscount = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.d8.responsive()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.s14w400Secondary()),
          Text(
            NumberFormatUtils.formatYen(value),
            style: AppTextStyles.s14w400Primary().copyWith(
              color: isDiscount ? AppColors.sale : AppColors.ink,
              fontWeight: isDiscount ? FontWeight.w500 : null,
            ),
          ),
        ],
      ),
    );
  }
}
