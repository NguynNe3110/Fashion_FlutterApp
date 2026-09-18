import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app.dart';

class HomeFlashSale extends StatefulWidget {
  const HomeFlashSale({required this.onBuyNowTap, super.key});

  final VoidCallback onBuyNowTap;

  @override
  State<HomeFlashSale> createState() => _HomeFlashSaleState();
}

class _HomeFlashSaleState extends State<HomeFlashSale> {
  static const _pageCount = 4;
  static const _autoPlayDuration = Duration(seconds: 5);

  final PageController _pageController = PageController();
  Timer? _autoPlayTimer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(_autoPlayDuration, (_) {
      if (!_pageController.hasClients) {
        return;
      }

      _pageController.animateToPage(
        (_currentPage + 1) % _pageCount,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(Dimens.d20.responsive()),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(
              height: Dimens.d204.responsive(),
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                allowImplicitScrolling: true,
                children: [
                  _FlashSalePage(onBuyNowTap: widget.onBuyNowTap),
                  const _ImagePage(
                    imagePath: AppImages.page1,
                    semanticLabel: 'Bộ sưu tập thời trang Nord 1',
                  ),
                  const _ImagePage(
                    imagePath: AppImages.page2,
                    semanticLabel: 'Bộ sưu tập thời trang Nord 2',
                  ),
                  const _ImagePage(
                    imagePath: AppImages.page3,
                    semanticLabel: 'Bộ sưu tập thời trang Nord 3',
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimens.d12.responsive()),
            _PageIndicator(count: _pageCount, currentPage: _currentPage),
          ],
        ),
      ),
    );
  }
}

class _FlashSalePage extends StatelessWidget {
  const _FlashSalePage({required this.onBuyNowTap});

  final VoidCallback onBuyNowTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(Dimens.d24.responsive()),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.page0,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          Padding(
            padding: EdgeInsets.all(Dimens.d24.responsive()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FLASH SALE',
                  style: AppTextStyles.eyebrow().copyWith(
                    color: AppColors.sale,
                  ),
                ),
                SizedBox(height: Dimens.d12.responsive()),
                Text(
                  'Bộ sưu tập\nThu Đông 2024',
                  style: AppTextStyles.h1Serif(
                    fontSize: Dimens.d32.responsive(),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ưu đãi đến 50%',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.s14w400Primary().copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: Dimens.d12.responsive()),
                    GestureDetector(
                      onTap: onBuyNowTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.d20.responsive(),
                          vertical: Dimens.d8.responsive(),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(
                            Dimens.d100.responsive(),
                          ),
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
        ],
      ),
    );
  }
}

class _ImagePage extends StatelessWidget {
  const _ImagePage({required this.imagePath, required this.semanticLabel});

  final String imagePath;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.d24.responsive()),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        semanticLabel: semanticLabel,
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.count, required this.currentPage});

  final int count;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentPage;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: (isActive ? Dimens.d24 : Dimens.d6).responsive(),
          height: Dimens.d6.responsive(),
          margin: EdgeInsets.symmetric(horizontal: Dimens.d3.responsive()),
          decoration: BoxDecoration(
            color: isActive ? AppColors.ink : AppColors.line2,
            borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
          ),
        );
      }),
    );
  }
}
