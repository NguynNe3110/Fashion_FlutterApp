import 'package:flutter/material.dart';
import '../../../../app.dart';

class HomeEditorialBanner extends StatelessWidget {
  const HomeEditorialBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.d20.responsive(),
        vertical: Dimens.d24.responsive(),
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: Dimens.d400.responsive(),
          decoration: BoxDecoration(
            color: AppColors.phDark,
            borderRadius: BorderRadius.circular(Dimens.d24.responsive()),
          ),
          clipBehavior: Clip.antiAlias, // bo góc theo banner
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background pattern or image
              Image.asset(
                AppImages.banner1,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.6),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.d32.responsive()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phong cách tối giản',
                      style: AppTextStyles.h1Serif().copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: Dimens.d12.responsive()),
                    Text(
                      'Khám phá xu hướng thời trang bền vững và tinh tế từ các nhà thiết kế hàng đầu.',
                      style: AppTextStyles.s14w400Primary().copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                        height: 1.5,
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
}
