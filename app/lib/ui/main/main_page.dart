import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage, MainBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return AutoTabsRouter(
      routes: (navigator as AppNavigatorImpl).tabRoutes,
      homeIndex: 0,
      lazyLoad: true,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;

        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: child,
          ),
          bottomNavigationBar: _buildFloatingBar(tabsRouter),
        );
      },
    );
  }

  Widget _buildFloatingBar(TabsRouter tabsRouter) {
    final radius = BorderRadius.circular(Dimens.d40.responsive());

    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            Dimens.d16.responsive(),
            Dimens.d6.responsive(),
            Dimens.d16.responsive(),
            Dimens.d10.responsive(),
          ),
          child: Container(
            // Shadow nằm NGOÀI ClipRRect (để trong sẽ bị cắt mất)
            decoration: BoxDecoration(
              borderRadius: radius,
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: radius,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.d10.responsive(),
                    vertical: Dimens.d8.responsive(),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.65),
                    border: Border.all(color: AppColors.line),
                    borderRadius: radius,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: BottomTab.values.map((tab) {
                      final isSelected = tabsRouter.activeIndex == tab.index;

                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
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
                                  style: AppTextStyles.s14w400Primary()
                                      .copyWith(
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BottomTab tab, bool isSelected) {
    final iconColor = isSelected ? AppColors.ink : AppColors.ink4;
    final iconData = (isSelected ? tab.activeIcon : tab.icon).icon;

    return Icon(iconData, color: iconColor, size: Dimens.d24.responsive());
  }
}
