import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/vouchers.dart';

@RoutePage()
class VouchersPage extends StatefulWidget {
  const VouchersPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VouchersPageState();
  }
}

class _VouchersPageState extends BasePageState<VouchersPage, VouchersBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const VouchersPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        text: 'Mã ưu đãi & Voucher',
        leadingIcon: LeadingIcon.back,
      ),
      body: BlocBuilder<VouchersBloc, VouchersState>(
        builder: (context, state) {
          if (state.isShimmerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.vouchers.isEmpty) {
            return const Center(
              child: Text(
                'Hiện chưa có mã giảm giá nào',
                style: TextStyle(color: Color(0xFF6B6862)),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.vouchers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final voucher = state.vouchers[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE8E5DE)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F2EE),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          voucher.discount,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF111110),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            voucher.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            voucher.minOrder,
                            style: const TextStyle(
                              color: Color(0xFF6B6862),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            voucher.expiryDate,
                            style: const TextStyle(
                              color: Color(0xFFA5A199),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          bloc.add(ApplyVoucherPressed(code: voucher.code)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF111110),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('Dùng'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
