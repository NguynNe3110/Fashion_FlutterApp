import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends BasePageState<MainPage, MainBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return AutoTabsScaffold(
      routes: (navigator as AppNavigatorImpl).tabRoutes,
      bottomNavigationBuilder: (_, tabsRouter) {
        (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;

        // Cart has its own sticky checkout bar. Keep it full-screen so the two
        // bottom actions never overlap or compete for space.
        if (tabsRouter.activeIndex == BottomTab.cart.index) {
          return const SizedBox.shrink();
        }

        return SafeArea(
          bottom: true,
          child: Container(
            margin: EdgeInsets.fromLTRB(
              Dimens.d16.responsive(),
              Dimens.d6.responsive(),
              Dimens.d16.responsive(),
              Dimens.d10.responsive(),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.d10.responsive(),
              vertical: Dimens.d8.responsive(),
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.line),
              borderRadius: BorderRadius.circular(Dimens.d40.responsive()),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: BottomTab.values.map((tab) {
                final isSelected = tabsRouter.activeIndex == tab.index;

                return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      (navigator as AppNavigatorImpl)
                          .popUntilRootOfCurrentBottomTab();
                    }
                    tabsRouter.setActiveIndex(tab.index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected
                          ? Dimens.d16.responsive()
                          : Dimens.d12.responsive(),
                      vertical: Dimens.d8.responsive(),
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.surface2
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        Dimens.d30.responsive(),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildIcon(tab, isSelected),
                        if (isSelected) ...[
                          SizedBox(width: Dimens.d8.responsive()),
                          Text(
                            tab.title,
                            maxLines: 1,
                            style: AppTextStyles.s14w400Primary().copyWith(
                              fontSize: Dimens.d12.responsive(),
                              color: AppColors.ink,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIcon(BottomTab tab, bool isSelected) {
    final iconColor = isSelected ? AppColors.ink : AppColors.ink4;
    final iconData = (isSelected ? tab.activeIcon : tab.icon).icon;

    return Icon(iconData, color: iconColor, size: Dimens.d24.responsive());
  }
}
