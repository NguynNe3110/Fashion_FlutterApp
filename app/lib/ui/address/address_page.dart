import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/address.dart';

@RoutePage()
class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddressPageState();
  }
}

class _AddressPageState extends BasePageState<AddressPage, AddressBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const AddressPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        text: 'Sổ địa chỉ',
        leadingIcon: LeadingIcon.back,
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state.loadException != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(handleExceptionMessage(state.loadException!)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => bloc.add(const AddressPageInitiated()),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          if (state.isShimmerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.addresses.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on_outlined, size: 64, color: Color(0xFFA5A199)),
                  const SizedBox(height: 12),
                  const Text(
                    'Chưa có địa chỉ giao hàng nào',
                    style: TextStyle(fontSize: 16, color: Color(0xFF6B6862)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // ponytail: open add address sheet/page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF111110),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Thêm địa chỉ mới'),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.addresses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final address = state.addresses[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: address.isDefault
                        ? const Color(0xFF111110)
                        : const Color(0xFFE8E5DE),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          address.receiverName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          address.phoneNumber,
                          style: const TextStyle(color: Color(0xFF6B6862), fontSize: 13),
                        ),
                        const Spacer(),
                        if (address.isDefault)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111110),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Mặc định',
                              style: TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${address.addressLine}, ${address.ward}, ${address.district}, ${address.city}',
                      style: const TextStyle(color: Color(0xFF333333), fontSize: 13),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!address.isDefault)
                          TextButton(
                            onPressed: () => bloc.add(SetDefaultAddressPressed(id: address.id)),
                            child: const Text('Đặt làm mặc định', style: TextStyle(color: Color(0xFF111110))),
                          ),
                        TextButton(
                          onPressed: () => bloc.add(DeleteAddressPressed(id: address.id)),
                          child: const Text('Xóa', style: TextStyle(color: Color(0xFFC2410C))),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // ponytail: open add address sheet
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF111110),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Thêm địa chỉ nhận hàng'),
        ),
      ),
    );
  }
}
