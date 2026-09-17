import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../../../../app.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.onSearchTap,
    required this.onNotificationTap,
    this.profile,
    super.key,
  });

  final ProfileEntity? profile;
  final VoidCallback onSearchTap;
  final VoidCallback onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background.withValues(alpha: 0.85),
      floating: true,
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'Nord',
            style: AppTextStyles.h2Serif().copyWith(
              fontSize: Dimens.d22.responsive(),
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(width: Dimens.d8.responsive()),
          Text(
            'STUDIO',
            style: AppTextStyles.eyebrow().copyWith(
              fontSize: Dimens.d10.responsive(),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onSearchTap,
          icon: Icon(
            Icons.search_rounded,
            size: Dimens.d24.responsive(),
            color: AppColors.ink,
          ),
        ),
        IconButton(
          onPressed: onNotificationTap,
          icon: Icon(
            Icons.notifications_none_rounded,
            size: Dimens.d24.responsive(),
            color: AppColors.ink,
          ),
        ),
        SizedBox(width: Dimens.d12.responsive()),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Dimens.d1.responsive()),
        child: Divider(height: Dimens.d1.responsive(), color: AppColors.line2),
      ),
    );
  }
}
