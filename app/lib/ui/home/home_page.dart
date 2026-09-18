import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'widgets/home_categories.dart';
import 'widgets/home_editorial_banner.dart';
import 'widgets/home_flash_sale.dart';
import 'widgets/home_header.dart';
import 'widgets/home_product_grid.dart';
import 'widgets/home_section_title.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
  late final _pagingController = CommonPagingController<ProductEntity>()
    ..disposeBy(disposeBag);
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    bloc.add(const HomePageInitiated());
    _pagingController.listen(
      onLoadMore: () => bloc.add(const HomeLoadMoreProducts()),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients &&
        _scrollController.position.extentAfter < 320) {
      _pagingController.fetchNextPage();
    }
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (previous, current) =>
              previous.products != current.products,
          listener: (context, state) {
            _pagingController.appendLoadMoreOutput(state.products);
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (previous, current) =>
              previous.loadException != current.loadException,
          listener: (context, state) {
            _pagingController.error = state.loadException;
          },
        ),
      ],
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.products != current.products ||
              previous.categories != current.categories ||
              previous.profile != current.profile ||
              previous.favoriteProductIds != current.favoriteProductIds ||
              previous.isShimmerLoading != current.isShimmerLoading ||
              previous.loadException != current.loadException,
          builder: (context, state) {
            if (state.loadException != null && state.products.data.isEmpty) {
              return _buildErrorState();
            }

            return RefreshIndicator(
              onRefresh: () {
                final completer = Completer<void>();
                _pagingController.refresh();
                bloc.add(HomePageRefreshed(completer: completer));
                return completer.future;
              },
              child: CustomScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  HomeHeader(
                    profile: state.profile,
                    onSearchTap: _onSearchTap,
                    onNotificationTap: _onNotificationTap,
                  ),
                  HomeFlashSale(onBuyNowTap: _onFlashSaleTap),
                  HomeCategories(
                    categories: state.categories,
                    onSeeAll: _onSeeAllCategories,
                    onCategoryTap: _onCategoryTap,
                  ),
                  const HomeSectionTitle(title: 'Mới về', eyebrow: 'TUẦN NÀY'),
                  HomeProductGrid(
                    products: state.products.data.take(4).toList(),
                    favoriteProductIds: state.favoriteProductIds,
                    onFavoriteTap: _onToggleFavorite,
                    onProductTap: _onProductTap,
                  ),
                  const HomeEditorialBanner(),
                  const HomeSectionTitle(
                    title: 'Bán chạy',
                    eyebrow: 'PHỔ BIẾN',
                  ),
                  HomeProductGrid(
                    products: state.products.data.skip(4).toList(),
                    favoriteProductIds: state.favoriteProductIds,
                    onFavoriteTap: _onToggleFavorite,
                    onProductTap: _onProductTap,
                  ),
                  SliverToBoxAdapter(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: state.products.isLastPage
                          ? const SizedBox.shrink()
                          : Padding(
                              key: const ValueKey('home-load-more'),
                              padding: EdgeInsets.symmetric(
                                vertical: Dimens.d24.responsive(),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.ink,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: Dimens.d128.responsive()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimens.d24.responsive()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_rounded,
              size: Dimens.d60.responsive(),
              color: AppColors.ink4,
            ),
            SizedBox(height: Dimens.d12.responsive()),
            Text('Không thể kết nối', style: AppTextStyles.h2Serif()),
            SizedBox(height: Dimens.d20.responsive()),
            GestureDetector(
              onTap: () => bloc.add(const HomePageInitiated()),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.d32.responsive(),
                  vertical: Dimens.d12.responsive(),
                ),
                decoration: BoxDecoration(
                  color: AppColors.ink,
                  borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
                ),
                child: Text(
                  'Thử lại',
                  style: AppTextStyles.s14w400Primary().copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchTap() => navigator.push(const AppRouteInfo.search());
  void _onNotificationTap() =>
      navigator.push(const AppRouteInfo.notification());
  void _onFlashSaleTap() => navigator.push(const AppRouteInfo.search());
  void _onSeeAllCategories() => navigator.push(
    const AppRouteInfo.categoryProducts(
      categoryId: '',
      categoryName: 'Danh mục',
    ),
  );

  void _onCategoryTap(CategoryEntity category) {
    navigator.push(
      AppRouteInfo.categoryProducts(
        categoryId: category.id,
        categoryName: category.name,
      ),
    );
  }

  void _onToggleFavorite(ProductEntity product, bool isFavorited) {
    bloc.add(
      HomeToggleFavorite(productId: product.id, isFavorited: isFavorited),
    );
  }

  void _onProductTap(ProductEntity product) {
    navigator.push(AppRouteInfo.itemDetail(product));
  }
}
