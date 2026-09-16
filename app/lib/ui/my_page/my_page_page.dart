import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/my_page.dart';

@RoutePage(name: 'MyPageRoute')
class MyPagePage extends StatefulWidget {
  const MyPagePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyPagePageState();
}

class _MyPagePageState extends BasePageState<MyPagePage, MyPageBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const MyPagePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Tài khoản',
        titleTextStyle: AppTextStyles.h2Serif().copyWith(
          fontSize: Dimens.d20.responsive(),
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
        leadingIcon: LeadingIcon.none,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined, size: Dimens.d24.responsive(), color: AppColors.ink),
          ),
          SizedBox(width: Dimens.d8.responsive()),
        ],
      ),
      body: BlocBuilder<MyPageBloc, MyPageState>(
        buildWhen: (prev, curr) =>
            prev.profile != curr.profile || prev.isShimmerLoading != curr.isShimmerLoading,
        builder: (context, state) {
          if (state.isShimmerLoading && state.profile == null) {
            return const Center(child: CircularProgressIndicator(color: AppColors.ink));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileHeader(state.profile),
                _buildStatsGrid(),
                _buildMenuSection(),
                _buildLogoutButton(),
                SizedBox(height: Dimens.d40.responsive()),
                _buildVersionInfo(),
                SizedBox(height: Dimens.d32.responsive()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(ProfileEntity? profile) {
    return Padding(
      padding: EdgeInsets.all(Dimens.d24.responsive()),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: Dimens.d88.responsive(),
                height: Dimens.d88.responsive(),
                decoration: const BoxDecoration(
                  color: AppColors.phTerra,
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: profile?.avatarUrl != null
                    ? Image.network(profile!.avatarUrl!, fit: BoxFit.cover)
                    : Icon(Icons.person_outline_rounded, size: Dimens.d40.responsive(), color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(Dimens.d4.responsive()),
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(Icons.add_rounded, size: Dimens.d16.responsive(), color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimens.d16.responsive()),
          Text(
            profile?.fullName ?? 'Khách hàng',
            style: AppTextStyles.h2Serif(fontSize: Dimens.d24.responsive()),
          ),
          SizedBox(height: Dimens.d4.responsive()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.d12.responsive(), vertical: Dimens.d4.responsive()),
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(Dimens.d99.responsive()),
            ),
            child: Text(
              'THÀNH VIÊN BẠC',
              style: AppTextStyles.eyebrow().copyWith(fontSize: Dimens.d8.responsive(), color: AppColors.ink2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive()),
      child: Row(
        children: [
          _statItem('Đơn hàng', '12'),
          _statVerticalDivider(),
          _statItem('Yêu thích', '24'),
          _statVerticalDivider(),
          _statItem('Voucher', '05'),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.s14w400Primary().copyWith(
              fontSize: Dimens.d18.responsive(),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: Dimens.d4.responsive()),
          Text(
            label.toUpperCase(),
            style: AppTextStyles.eyebrow().copyWith(fontSize: Dimens.d8.responsive()),
          ),
        ],
      ),
    );
  }

  Widget _statVerticalDivider() {
    return Container(
      width: 1,
      height: Dimens.d24.responsive(),
      color: AppColors.line2,
    );
  }

  Widget _buildMenuSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.d32.responsive()),
      child: Column(
        children: [
          _menuItem(Icons.shopping_bag_outlined, 'Lịch sử mua hàng'),
          _menuItem(Icons.location_on_outlined, 'Sổ địa chỉ'),
          _menuItem(Icons.payment_outlined, 'Phương thức thanh toán'),
          _menuItem(Icons.star_outline_rounded, 'Đánh giá của tôi'),
          _menuItem(Icons.help_outline_rounded, 'Trung tâm trợ giúp'),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.d24.responsive(), vertical: Dimens.d16.responsive()),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          Icon(icon, size: Dimens.d22.responsive(), color: AppColors.ink2),
          SizedBox(width: Dimens.d16.responsive()),
          Text(
            title,
            style: AppTextStyles.s14w400Primary().copyWith(fontSize: Dimens.d15.responsive()),
          ),
          const Spacer(),
          Icon(Icons.chevron_right_rounded, size: Dimens.d20.responsive(), color: AppColors.ink4),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.d24.responsive()),
      child: GestureDetector(
        onTap: () => bloc.add(const LogoutButtonPressed()),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: Dimens.d16.responsive()),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.line2),
            borderRadius: BorderRadius.circular(Dimens.d99.responsive()),
          ),
          child: Text(
            'Đăng xuất',
            style: AppTextStyles.s14w400Primary().copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.sale,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Text(
      'Phiên bản 1.0.0 (Build 240916)',
      style: AppTextStyles.s14w400Secondary().copyWith(fontSize: Dimens.d11.responsive()),
    );
  }
}
