import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/checkout.dart';

@RoutePage()
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.selectedItems,
    required this.products,
    required this.summary,
  });

  final List<CartItemEntity> selectedItems;
  final List<ProductEntity> products;
  final CartSummaryEntity summary;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends BasePageState<CheckoutPage, CheckoutBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      CheckoutPageInitiated(
        selectedItems: widget.selectedItems,
        products: widget.products,
        summary: widget.summary,
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Thanh toán',
        leadingIcon: LeadingIcon.back,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h2Serif(fontSize: 21),
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state.isLoading && state.addresses.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.ink),
            );
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
            children: [
              _buildProgress(),
              const SizedBox(height: 26),
              _sectionTitle(
                'ĐỊA CHỈ GIAO HÀNG',
                action: 'Quản lý',
                onAction: _openAddresses,
              ),
              const SizedBox(height: 12),
              if (state.addresses.isEmpty)
                _emptyAddress()
              else
                ...state.addresses.map(
                  (address) => _addressTile(
                    address,
                    state.selectedAddressId == address.id,
                  ),
                ),
              const SizedBox(height: 26),
              Text('PHƯƠNG THỨC GIAO HÀNG', style: AppTextStyles.eyebrow()),
              const SizedBox(height: 12),
              _choiceTile(
                selected: state.shippingFee == 30000,
                title: 'Giao tiêu chuẩn',
                subtitle: '2–4 ngày làm việc',
                trailing: '30.000₫',
                onTap: () => bloc.add(
                  const CheckoutShippingSelected(shippingFee: 30000),
                ),
              ),
              _choiceTile(
                selected: state.shippingFee == 65000,
                title: 'Giao nhanh',
                subtitle: 'Trong 24 giờ',
                trailing: '65.000₫',
                onTap: () => bloc.add(
                  const CheckoutShippingSelected(shippingFee: 65000),
                ),
              ),
              const SizedBox(height: 26),
              Text('PHƯƠNG THỨC THANH TOÁN', style: AppTextStyles.eyebrow()),
              const SizedBox(height: 12),
              _choiceTile(
                selected: state.paymentMethod == 'cod',
                title: 'Thanh toán khi nhận hàng',
                subtitle: 'COD',
                icon: Icons.local_shipping_outlined,
                onTap: () => bloc.add(
                  const CheckoutPaymentSelected(paymentMethod: 'cod'),
                ),
              ),
              _choiceTile(
                selected: state.paymentMethod == 'bank_transfer',
                title: 'Chuyển khoản ngân hàng',
                subtitle: 'VietQR · xử lý tức thì',
                icon: Icons.qr_code_rounded,
                onTap: () => bloc.add(
                  const CheckoutPaymentSelected(paymentMethod: 'bank_transfer'),
                ),
              ),
              _choiceTile(
                selected: state.paymentMethod == 'e_wallet',
                title: 'Ví điện tử',
                subtitle: 'MoMo · ZaloPay · ShopeePay',
                icon: Icons.account_balance_wallet_outlined,
                onTap: () => bloc.add(
                  const CheckoutPaymentSelected(paymentMethod: 'e_wallet'),
                ),
              ),
              const SizedBox(height: 26),
              Text('TÓM TẮT ĐƠN HÀNG', style: AppTextStyles.eyebrow()),
              const SizedBox(height: 14),
              _summaryRow('Tạm tính', state.summary.subtotal),
              _summaryRow('Phí giao hàng', state.shippingFee),
              _summaryRow('Giảm giá', -state.summary.discount, accent: true),
              const Divider(height: 26, color: AppColors.line2),
              _summaryRow('Tổng cộng', state.total, strong: true),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        buildWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting ||
            previous.selectedAddressId != current.selectedAddressId ||
            previous.total != current.total,
        builder: (context, state) => SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.line)),
            ),
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: state.selectedAddress == null || state.isSubmitting
                    ? null
                    : () => bloc.add(const CheckoutSubmitted()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.ink,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: AppColors.ink4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: state.isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        state.selectedAddress == null
                            ? 'Thêm địa chỉ để tiếp tục'
                            : 'Đặt hàng · ${NumberFormatUtils.formatYen(state.total)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgress() {
    return Row(
      children: [
        _step('1', 'Giỏ hàng', true),
        const Expanded(child: Divider(color: AppColors.ink)),
        _step('2', 'Địa chỉ', true),
        const Expanded(child: Divider(color: AppColors.line2)),
        _step('3', 'Thanh toán', false),
      ],
    );
  }

  Widget _step(String value, String label, bool active) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11,
          backgroundColor: active ? AppColors.ink : AppColors.line2,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            color: active ? AppColors.ink : AppColors.ink3,
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(
    String title, {
    required String action,
    required VoidCallback onAction,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.eyebrow()),
        TextButton(onPressed: onAction, child: Text(action)),
      ],
    );
  }

  Widget _emptyAddress() {
    return InkWell(
      onTap: _openAddresses,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.line2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.add_location_alt_outlined, color: AppColors.ink3),
            SizedBox(width: 12),
            Expanded(child: Text('Thêm địa chỉ nhận hàng')),
            Icon(Icons.chevron_right, color: AppColors.ink4),
          ],
        ),
      ),
    );
  }

  Widget _addressTile(AddressEntity address, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => bloc.add(CheckoutAddressSelected(addressId: address.id)),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: selected ? AppColors.ink : AppColors.line2,
              width: selected ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                size: 20,
                color: selected ? AppColors.ink : AppColors.ink4,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${address.receiverName} · ${address.phoneNumber}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      [
                        address.addressLine,
                        address.ward,
                        address.district,
                        address.city,
                      ].where((value) => value?.isNotEmpty == true).join(', '),
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.45,
                        color: AppColors.ink3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _choiceTile({
    required bool selected,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    String? trailing,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: selected ? AppColors.ink : AppColors.line2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                size: 20,
                color: selected ? AppColors.ink : AppColors.ink4,
              ),
              if (icon != null) ...[
                const SizedBox(width: 10),
                Icon(icon, size: 20, color: AppColors.ink2),
              ],
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.ink3,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null)
                Text(
                  trailing,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(
    String label,
    double value, {
    bool accent = false,
    bool strong = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: strong ? 16 : 13,
              color: strong ? AppColors.ink : AppColors.ink3,
              fontWeight: strong ? FontWeight.w600 : null,
            ),
          ),
          Text(
            NumberFormatUtils.formatYen(value),
            style: TextStyle(
              fontSize: strong ? 18 : 13,
              color: accent ? AppColors.success : AppColors.ink,
              fontWeight: strong ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openAddresses() async {
    await navigator.push(const AppRouteInfo.address());
    bloc.add(
      CheckoutPageInitiated(
        selectedItems: widget.selectedItems,
        products: widget.products,
        summary: widget.summary,
      ),
    );
  }
}
