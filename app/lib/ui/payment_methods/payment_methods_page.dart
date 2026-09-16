import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/payment_methods.dart';

@RoutePage()
class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PaymentMethodsPageState();
  }
}

class _PaymentMethodsPageState
    extends BasePageState<PaymentMethodsPage, PaymentMethodsBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const PaymentMethodsPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        text: 'Phương thức thanh toán',
        leadingIcon: LeadingIcon.back,
      ),
      body: BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
        builder: (context, state) {
          if (state.isShimmerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.methods.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final method = state.methods[index];
              final isSelected = state.selectedMethodId == method.id;

              return GestureDetector(
                onTap: () => bloc.add(
                  SelectPaymentMethodPressed(methodId: method.id),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF111110)
                          : const Color(0xFFE8E5DE),
                      width: isSelected ? 1.5 : 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: isSelected
                            ? const Color(0xFF111110)
                            : const Color(0xFFA5A199),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              method.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              method.description,
                              style: const TextStyle(
                                color: Color(0xFF6B6862),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () => navigator.pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF111110),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Xác nhận'),
        ),
      ),
    );
  }
}
