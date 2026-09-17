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
      appBar: CommonAppBar(text: 'Sổ địa chỉ', leadingIcon: LeadingIcon.back),
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
                  const Icon(
                    Icons.location_on_outlined,
                    size: 64,
                    color: Color(0xFFA5A199),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Chưa có địa chỉ giao hàng nào',
                    style: TextStyle(fontSize: 16, color: Color(0xFF6B6862)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showAddressForm,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          address.phoneNumber,
                          style: const TextStyle(
                            color: Color(0xFF6B6862),
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        if (address.isDefault)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111110),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Mặc định',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      [
                        address.addressLine,
                        address.ward,
                        address.district,
                        address.city,
                      ].where((value) => value?.isNotEmpty == true).join(', '),
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!address.isDefault)
                          TextButton(
                            onPressed: () => bloc.add(
                              SetDefaultAddressPressed(id: address.id),
                            ),
                            child: const Text(
                              'Đặt làm mặc định',
                              style: TextStyle(color: Color(0xFF111110)),
                            ),
                          ),
                        TextButton(
                          onPressed: () =>
                              bloc.add(DeleteAddressPressed(id: address.id)),
                          child: const Text(
                            'Xóa',
                            style: TextStyle(color: Color(0xFFC2410C)),
                          ),
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
      bottomNavigationBar: BlocBuilder<AddressBloc, AddressState>(
        buildWhen: (previous, current) =>
            previous.addresses.isEmpty != current.addresses.isEmpty ||
            previous.isShimmerLoading != current.isShimmerLoading,
        builder: (context, state) {
          if (state.addresses.isEmpty || state.isShimmerLoading) {
            return const SizedBox.shrink();
          }
          return SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: _showAddressForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111110),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Thêm địa chỉ nhận hàng'),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showAddressForm() async {
    final formKey = GlobalKey<FormState>();
    final receiverController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    final wardController = TextEditingController();
    final districtController = TextEditingController();
    final cityController = TextEditingController();
    final labelController = TextEditingController(text: 'Nhà');
    var isDefault = false;

    final submission = await showModalBottomSheet<AddAddressSubmitted>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.surface,
      builder: (sheetContext) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thêm địa chỉ',
                    style: AppTextStyles.h2Serif(fontSize: 26),
                  ),
                  const SizedBox(height: 18),
                  _addressField(receiverController, 'Họ và tên người nhận'),
                  _addressField(
                    phoneController,
                    'Số điện thoại',
                    keyboardType: TextInputType.phone,
                  ),
                  _addressField(addressController, 'Số nhà, tên đường'),
                  _addressField(
                    wardController,
                    'Phường / Xã',
                    isRequired: false,
                  ),
                  _addressField(districtController, 'Quận / Huyện'),
                  _addressField(cityController, 'Tỉnh / Thành phố'),
                  _addressField(
                    labelController,
                    'Nhãn địa chỉ',
                    isRequired: false,
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    value: isDefault,
                    activeThumbColor: AppColors.ink,
                    title: const Text(
                      'Đặt làm địa chỉ mặc định',
                      style: TextStyle(fontSize: 13),
                    ),
                    onChanged: (value) =>
                        setModalState(() => isDefault = value),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() != true) return;
                        Navigator.of(sheetContext).pop(
                          AddAddressSubmitted(
                            label: labelController.text.trim(),
                            receiverName: receiverController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                            addressLine: addressController.text.trim(),
                            ward: wardController.text.trim().isEmpty
                                ? null
                                : wardController.text.trim(),
                            district: districtController.text.trim(),
                            city: cityController.text.trim(),
                            isDefault: isDefault,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.ink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Lưu địa chỉ'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    receiverController.dispose();
    phoneController.dispose();
    addressController.dispose();
    wardController.dispose();
    districtController.dispose();
    cityController.dispose();
    labelController.dispose();

    if (submission != null && mounted) {
      bloc.add(submission);
    }
  }

  Widget _addressField(
    TextEditingController controller,
    String label, {
    TextInputType? keyboardType,
    bool isRequired = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: isRequired
            ? (value) => value == null || value.trim().isEmpty
                  ? 'Vui lòng nhập $label'
                  : null
            : null,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.surface2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.ink),
          ),
        ),
      ),
    );
  }
}
