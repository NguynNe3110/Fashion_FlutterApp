import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends BasePageState<CartPage, CartBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const CartPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Giỏ hàng',
        titleTextStyle: AppTextStyles.h2Serif().copyWith(
          fontSize: Dimens.d20.responsive(),
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
        leadingIcon: LeadingIcon.none,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        buildWhen: (prev, curr) =>
            prev.items != curr.items ||
            prev.products != curr.products ||
            prev.selectedItemIds != curr.selectedItemIds ||
            prev.isShimmerLoading != curr.isShimmerLoading ||
            prev.summary != curr.summary,
        builder: (context, state) {
          if (state.isShimmerLoading && state.items.isEmpty) {
            return _buildLoader();
          }

          if (state.items.isEmpty) {
            return _buildEmptyState();
          }

          return _buildCartBody(state);
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        buildWhen: (prev, curr) =>
            prev.selectedItemIds != curr.selectedItemIds ||
            prev.summary != curr.summary ||
            prev.items != curr.items,
        builder: (context, state) {
          if (state.items.isEmpty) return const SizedBox.shrink();
          return _buildCheckoutBar(state);
        },
      ),
    );
  }

  Widget _buildCartBody(CartState state) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.d20.responsive(),
            vertical: Dimens.d16.responsive(),
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => bloc.add(const CartAllItemsSelectionToggled()),
                  child: Row(
                    children: [
                      Icon(
                        state.isAllSelected
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank_rounded,
                        size: Dimens.d20.responsive(),
                        color: state.isAllSelected
                            ? AppColors.ink
                            : AppColors.ink4,
                      ),
                      SizedBox(width: Dimens.d8.responsive()),
                      Text(
                        'Chọn tất cả (${state.items.length})',
                        style: AppTextStyles.s14w400Primary().copyWith(
                          fontSize: Dimens.d13.responsive(),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.selectedItemIds.isNotEmpty)
                  GestureDetector(
                    onTap: () => bloc.add(const CartSelectedItemsRemoved()),
                    child: Text(
                      'Xóa',
                      style: AppTextStyles.linkText().copyWith(
                        color: AppColors.sale,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = state.items[index];
            return _buildCartItem(item, state);
          }, childCount: state.items.length),
        ),
        SliverPadding(
          padding: EdgeInsets.all(Dimens.d20.responsive()),
          sliver: SliverToBoxAdapter(child: _buildPromoCodeSection()),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive()),
          sliver: SliverToBoxAdapter(child: _buildSummarySection(state)),
        ),
        SliverToBoxAdapter(child: SizedBox(height: Dimens.d32.responsive())),
      ],
    );
  }

  Widget _buildCartItem(CartItemEntity item, CartState state) {
    final product = state.products.firstWhereOrNull(
      (p) => p.id == item.productId,
    );
    final variant = product?.variants.firstWhereOrNull(
      (value) => value.id == item.variantId,
    );
    final isSelected = state.isItemSelected(item.id);

    return Container(
      padding: EdgeInsets.all(Dimens.d20.responsive()),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () =>
                bloc.add(CartItemSelectionToggled(cartItemId: item.id)),
            child: Padding(
              padding: EdgeInsets.only(top: Dimens.d40.responsive()),
              child: Icon(
                isSelected
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                size: Dimens.d20.responsive(),
                color: isSelected ? AppColors.ink : AppColors.ink4,
              ),
            ),
          ),
          SizedBox(width: Dimens.d16.responsive()),
          Container(
            width: Dimens.d100.responsive(),
            height: Dimens.d130.responsive(),
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
            ),
            clipBehavior: Clip.antiAlias,
            child: (product?.primaryImageUrl != null)
                ? Image.network(product!.primaryImageUrl!, fit: BoxFit.cover)
                : const Icon(Icons.image_outlined, color: AppColors.ink4),
          ),
          SizedBox(width: Dimens.d16.responsive()),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.categoryName?.toUpperCase() ?? 'BRAND',
                  style: AppTextStyles.eyebrow().copyWith(
                    fontSize: Dimens.d9.responsive(),
                  ),
                ),
                SizedBox(height: Dimens.d4.responsive()),
                Text(
                  product?.name ?? 'Sản phẩm',
                  style: AppTextStyles.s14w400Primary().copyWith(
                    fontSize: Dimens.d15.responsive(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Text(
                  variant == null
                      ? 'Mặc định'
                      : 'Size ${variant.size} · Màu ${variant.color}',
                  style: AppTextStyles.s14w400Secondary().copyWith(
                    fontSize: Dimens.d12.responsive(),
                  ),
                ),
                SizedBox(height: Dimens.d12.responsive()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormatUtils.formatYen(
                        product?.effectivePrice.toDouble() ?? 0,
                      ),
                      style: AppTextStyles.s14w400Primary().copyWith(
                        fontSize: Dimens.d16.responsive(),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _buildQuantityStepper(item),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityStepper(CartItemEntity item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
      ),
      child: Row(
        children: [
          _stepperButton(
            Icons.remove_rounded,
            () => bloc.add(
              CartItemQuantityChanged(cartItemId: item.id, delta: -1),
            ),
          ),
          SizedBox(
            width: Dimens.d32.responsive(),
            child: Text(
              '${item.quantity}',
              textAlign: TextAlign.center,
              style: AppTextStyles.s14w400Primary().copyWith(
                fontSize: Dimens.d13.responsive(),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _stepperButton(
            Icons.add_rounded,
            () => bloc.add(
              CartItemQuantityChanged(cartItemId: item.id, delta: 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimens.d8.responsive()),
        child: Icon(icon, size: Dimens.d16.responsive(), color: AppColors.ink),
      ),
    );
  }

  Widget _buildPromoCodeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MÃ GIẢM GIÁ', style: AppTextStyles.eyebrow()),
        SizedBox(height: Dimens.d12.responsive()),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.d16.responsive(),
                  vertical: Dimens.d14.responsive(),
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
                ),
                child: Text(
                  'Nhập mã của bạn',
                  style: AppTextStyles.s14w400Secondary().copyWith(
                    color: AppColors.ink4,
                  ),
                ),
              ),
            ),
            SizedBox(width: Dimens.d12.responsive()),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.d24.responsive(),
                vertical: Dimens.d14.responsive(),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.line2),
                borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
              ),
              child: Text(
                'Áp dụng',
                style: AppTextStyles.s14w400Primary().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummarySection(CartState state) {
    final summary = state.summary;
    return Column(
      children: [
        _summaryRow('Tạm tính', summary.subtotal),
        _summaryRow('Phí giao hàng', summary.shippingFee ?? 0),
        _summaryRow('Giảm giá', -(summary.discount), isDiscount: true),
      ],
    );
  }

  Widget _summaryRow(String label, double value, {bool isDiscount = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.d12.responsive()),
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

  Widget _buildCheckoutBar(CartState state) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Dimens.d20.responsive(),
        Dimens.d16.responsive(),
        Dimens.d20.responsive(),
        Dimens.d32.responsive(),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('TỔNG CỘNG', style: AppTextStyles.eyebrow()),
                SizedBox(height: Dimens.d4.responsive()),
                Text(
                  NumberFormatUtils.formatYen(state.summary.total),
                  style: AppTextStyles.s14w400Primary().copyWith(
                    fontSize: Dimens.d20.responsive(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: state.selectedItemIds.isEmpty
                ? null
                : () => bloc.add(const CartCheckOutPressed()),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.d40.responsive(),
                vertical: Dimens.d16.responsive(),
              ),
              decoration: BoxDecoration(
                color: state.selectedItemIds.isEmpty
                    ? AppColors.ink4
                    : AppColors.ink,
                borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
              ),
              child: Text(
                'Thanh toán',
                style: AppTextStyles.s14w400Primary().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimens.d32.responsive()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: Dimens.d64.responsive(),
              color: AppColors.ink4,
            ),
            SizedBox(height: Dimens.d24.responsive()),
            Text('Giỏ hàng trống', style: AppTextStyles.h2Serif()),
            SizedBox(height: Dimens.d12.responsive()),
            Text(
              'Có vẻ như bạn chưa thêm sản phẩm nào vào giỏ hàng.',
              textAlign: TextAlign.center,
              style: AppTextStyles.s14w400Secondary(),
            ),
            SizedBox(height: Dimens.d32.responsive()),
            GestureDetector(
              onTap: () => navigator.navigateToBottomTab(BottomTab.home.index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.d32.responsive(),
                  vertical: Dimens.d12.responsive(),
                ),
                decoration: BoxDecoration(
                  color: AppColors.ink,
                  borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
                ),
                child: Text(
                  'Tiếp tục mua sắm',
                  style: AppTextStyles.s14w400Primary().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator(color: AppColors.ink));
  }
}
