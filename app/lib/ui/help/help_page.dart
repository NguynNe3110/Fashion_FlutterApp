import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

@RoutePage()
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final _questions = const [
    (
      'Làm sao để theo dõi đơn hàng?',
      'Mở Tài khoản → Lịch sử mua hàng, sau đó chọn đơn hàng cần theo dõi.',
    ),
    (
      'Tôi có thể đổi trả trong bao lâu?',
      'Nord hỗ trợ đổi trả trong 30 ngày nếu sản phẩm còn nguyên tem và chưa qua sử dụng.',
    ),
    (
      'Phương thức thanh toán nào được chấp nhận?',
      'Bạn có thể thanh toán COD, chuyển khoản ngân hàng hoặc ví điện tử.',
    ),
    (
      'Khi nào tôi được hoàn tiền?',
      'Khoản hoàn tiền thường được xử lý trong 5–7 ngày làm việc sau khi hàng được kiểm tra.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Trợ giúp',
        leadingIcon: LeadingIcon.back,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h2Serif(fontSize: 21),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('CHÚNG TÔI CÓ THỂ GIÚP GÌ?', style: AppTextStyles.eyebrow()),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'Tìm câu hỏi hoặc chủ đề...',
              prefixIcon: const Icon(Icons.search),
              fillColor: AppColors.surface2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text('CÂU HỎI THƯỜNG GẶP', style: AppTextStyles.eyebrow()),
          const SizedBox(height: 8),
          ..._questions.map(
            (item) => ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.only(bottom: 16),
              shape: const Border(bottom: BorderSide(color: AppColors.line)),
              collapsedShape: const Border(
                bottom: BorderSide(color: AppColors.line),
              ),
              title: Text(
                item.$1,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.$2,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: AppColors.ink3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text('LIÊN HỆ', style: AppTextStyles.eyebrow()),
          const SizedBox(height: 12),
          _contact(
            Icons.chat_bubble_outline,
            'Chat với Nord',
            'Phản hồi trong vài phút',
          ),
          _contact(
            Icons.mail_outline,
            'support@nord.vn',
            'Phản hồi trong 24 giờ',
          ),
          _contact(Icons.phone_outlined, '1900 6868', '08:00–21:00 hằng ngày'),
        ],
      ),
    );
  }

  Widget _contact(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.ink2),
          const SizedBox(width: 14),
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
                  style: const TextStyle(color: AppColors.ink3, fontSize: 11),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.ink4),
        ],
      ),
    );
  }
}
