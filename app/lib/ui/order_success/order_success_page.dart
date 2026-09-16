import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import 'bloc/order_success.dart';

@RoutePage()
class OrderSuccessPage extends StatefulWidget {
  const OrderSuccessPage({
    super.key,
    required this.orderCode,
  });

  final String orderCode;

  @override
  State<StatefulWidget> createState() {
    return _OrderSuccessPageState();
  }
}

class _OrderSuccessPageState
    extends BasePageState<OrderSuccessPage, OrderSuccessBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: const Color(0xFFFAFAF7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF111110),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Đặt hàng thành công!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111110),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Mã đơn hàng: #${widget.orderCode}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B6862),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Cảm ơn bạn đã mua sắm tại Nord. Chúng tôi sẽ thông báo cho bạn ngay khi kiện hàng được gửi đi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B6862),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => bloc.add(const ContinueShoppingPressed()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF111110),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Tiếp tục mua sắm'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => bloc.add(const ViewOrderHistoryPressed()),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF111110),
                    side: const BorderSide(color: Color(0xFFE8E5DE)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Xem đơn hàng của tôi'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
