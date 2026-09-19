import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

@RoutePage()
class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState
    extends BasePageState<PersonalInfoPage, MyPageBloc> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime? _dateOfBirth;
  String? _gender;
  bool _marketingOptIn = false;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    bloc.add(const MyPagePageInitiated());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Thông tin cá nhân',
        leadingIcon: LeadingIcon.back,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h2Serif(fontSize: 21),
      ),
      body: BlocConsumer<MyPageBloc, MyPageState>(
        listenWhen: (previous, current) =>
            previous.profile != current.profile ||
            previous.saveSucceeded != current.saveSucceeded,
        listener: (context, state) {
          if (!_initialized && state.profile != null) {
            _initialized = true;
            _nameController.text = state.profile!.fullName;
            _phoneController.text = state.profile!.phoneNumber ?? '';
            _emailController.text = state.profile!.email;
            _dateOfBirth = state.profile!.dateOfBirth;
            _gender = state.profile!.gender;
            _marketingOptIn = state.profile!.marketingOptIn;
          }
          if (state.saveSucceeded) {
            navigator.showSuccessSnackBar('Đã lưu thông tin cá nhân');
          }
        },
        builder: (context, state) {
          if (state.isShimmerLoading && state.profile == null) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.ink),
            );
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.phTerra,
                    backgroundImage: state.profile?.avatarUrl == null
                        ? null
                        : NetworkImage(state.profile!.avatarUrl!),
                    child: state.profile?.avatarUrl == null
                        ? const Icon(
                            Icons.person_outline,
                            size: 44,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 30),
                Text('EMAIL', style: AppTextStyles.eyebrow()),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    helperText: 'Email đăng nhập không thể thay đổi tại đây',
                  ),
                ),
                const SizedBox(height: 18),
                Text('HỌ VÀ TÊN', style: AppTextStyles.eyebrow()),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Vui lòng nhập họ và tên'
                      : null,
                ),
                const SizedBox(height: 18),
                Text('SỐ ĐIỆN THOẠI', style: AppTextStyles.eyebrow()),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 18),
                Text('NGÀY SINH', style: AppTextStyles.eyebrow()),
                const SizedBox(height: 8),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: _selectDateOfBirth,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.cake_outlined),
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                    child: Text(
                      _dateOfBirth == null
                          ? 'Chọn ngày sinh'
                          : MaterialLocalizations.of(
                              context,
                            ).formatCompactDate(_dateOfBirth!),
                      style: _dateOfBirth == null
                          ? AppTextStyles.s14w400Secondary()
                          : AppTextStyles.s14w400Primary(),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text('GIỚI TÍNH', style: AppTextStyles.eyebrow()),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: _gender,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_search_outlined),
                  ),
                  hint: const Text('Chọn giới tính'),
                  items: const [
                    DropdownMenuItem(value: 'male', child: Text('Nam')),
                    DropdownMenuItem(value: 'female', child: Text('Nữ')),
                    DropdownMenuItem(value: 'other', child: Text('Khác')),
                  ],
                  onChanged: (value) => setState(() => _gender = value),
                ),
                const SizedBox(height: 18),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SwitchListTile.adaptive(
                    value: _marketingOptIn,
                    activeThumbColor: AppColors.ink,
                    title: const Text('Nhận ưu đãi từ Nord'),
                    subtitle: const Text(
                      'Thông báo bộ sưu tập mới và voucher dành riêng cho bạn',
                    ),
                    onChanged: (value) =>
                        setState(() => _marketingOptIn = value),
                  ),
                ),
                if (state.profile != null) ...[
                  const SizedBox(height: 18),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.workspace_premium_outlined),
                    title: const Text('Hạng thành viên'),
                    trailing: Text(
                      state.profile!.membershipTier.toUpperCase(),
                      style: AppTextStyles.eyebrow(),
                    ),
                  ),
                ],
                const SizedBox(height: 30),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: state.isSaving
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() != true) {
                              return;
                            }
                            bloc.add(
                              ProfileSavePressed(
                                fullName: _nameController.text,
                                phoneNumber: _phoneController.text,
                                dateOfBirth: _dateOfBirth,
                                gender: _gender,
                                marketingOptIn: _marketingOptIn,
                              ),
                            );
                          },
                    child: state.isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Lưu thay đổi'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _selectDateOfBirth() async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: 'Chọn ngày sinh',
    );
    if (selected != null && mounted) {
      setState(() => _dateOfBirth = selected);
    }
  }
}
