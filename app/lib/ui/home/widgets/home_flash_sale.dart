import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../../../../app.dart';
class HomeFlashSale extends StatelessWidget {
  const HomeFlashSale({
    required this.onBuyNowTap,
    super.key,
  });

  final VoidCallback onBuyNowTap;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(Dimens.d20.responsive()),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(Dimens.d24.responsive()),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F1EC), // surface-2
            borderRadius: BorderRadius.circular(Dimens.d24.responsive()),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FLASH SALE',
                style: AppTextStyles.eyebrow().copyWith(color: AppColors.sale),
              ),
              SizedBox(height: Dimens.d12.responsive()),
              Text(
                'Bộ sưu tập\nThu Đông 2024',
                style: AppTextStyles.h1Serif(fontSize: Dimens.d32.responsive()),
              ),
              SizedBox(height: Dimens.d16.responsive()),
              Row(
                children: [
                  Text(
                    'Ưu đãi đến 50%',
                    style: AppTextStyles.s14w400Primary().copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onBuyNowTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimens.d20.responsive(),
                        vertical: Dimens.d12.responsive(),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.ink,
                        borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
                      ),
                      child: Text(
                        'Mua ngay',
                        style: AppTextStyles.s14w400Primary().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
