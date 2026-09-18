import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import '../home/widgets/product_card.dart';
import 'bloc/favorite.dart';

@RoutePage()
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavoritePageState();
  }
}

class _FavoritePageState extends BasePageState<FavoritePage, FavoriteBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const FavoritePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Yêu thích',
        titleTextStyle: AppTextStyles.h2Serif().copyWith(
          fontSize: Dimens.d20.responsive(),
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
        leadingIcon: LeadingIcon.none,
        actions: [
          IconButton(
            onPressed: () => navigator.push(const AppRouteInfo.search()),
            icon: Icon(
              Icons.search_rounded,
              size: Dimens.d24.responsive(),
              color: AppColors.ink,
            ),
          ),
          SizedBox(width: Dimens.d8.responsive()),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildSubHeader(),
            Divider(height: 1, color: AppColors.line2),
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                buildWhen: (previous, current) =>
                    previous.products != current.products ||
                    previous.isShimmerLoading != current.isShimmerLoading,
                builder: (context, state) {
                  if (state.isShimmerLoading && state.products.data.isEmpty) {
                    return _buildLoader();
                  }

                  if (state.products.data.isEmpty) {
                    return _buildEmptyState();
                  }

                  return GridView.builder(
                    padding: EdgeInsets.fromLTRB(
                      Dimens.d20.responsive(),
                      Dimens.d20.responsive(),
                      Dimens.d20.responsive(),
                      Dimens.d128.responsive(),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ProductCard.gridCrossAxisCount(context),
                      mainAxisSpacing: Dimens.d24.responsive(),
                      crossAxisSpacing: Dimens.d12.responsive(),
                      mainAxisExtent: ProductCard.gridMainAxisExtent(
                        context,
                        horizontalPadding: Dimens.d20.responsive() * 2,
                        crossAxisSpacing: Dimens.d12.responsive(),
                      ),
                    ),
                    itemCount: state.products.data.length,
                    itemBuilder: (context, index) {
                      final product = state.products.data[index];
                      return ProductCard(
                        product: product,
                        isFavorited: true,
                        onFavoriteTap: () {
                          bloc.add(
                            FavoriteToggleFavorite(
                              productId: product.id,
                              isFavorited: true,
                            ),
                          );
                        },
                        onTap: () =>
                            navigator.push(AppRouteInfo.itemDetail(product)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubHeader() {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      buildWhen: (previous, current) =>
          previous.products.data.length != current.products.data.length ||
          previous.sort != current.sort,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.d20.responsive(),
            vertical: Dimens.d16.responsive(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${state.products.data.length} SẢN PHẨM',
                style: AppTextStyles.eyebrow().copyWith(
                  fontSize: Dimens.d9.responsive(),
                ),
              ),
              PopupMenuButton<FavoriteSort>(
                initialValue: state.sort,
                onSelected: (sort) => bloc.add(FavoriteFilter(sort: sort)),
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: FavoriteSort.recent,
                    child: Text('Gần nhất'),
                  ),
                  PopupMenuItem(
                    value: FavoriteSort.priceLow,
                    child: Text('Giá thấp đến cao'),
                  ),
                  PopupMenuItem(
                    value: FavoriteSort.priceHigh,
                    child: Text('Giá cao đến thấp'),
                  ),
                  PopupMenuItem(
                    value: FavoriteSort.name,
                    child: Text('Tên A–Z'),
                  ),
                ],
                child: Row(
                  children: [
                    Text(
                      _sortLabel(state.sort),
                      style: AppTextStyles.s14w400Primary().copyWith(
                        fontSize: Dimens.d12.responsive(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: Dimens.d4.responsive()),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: Dimens.d16.responsive(),
                      color: AppColors.ink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _sortLabel(FavoriteSort sort) => switch (sort) {
    FavoriteSort.recent => 'Gần nhất',
    FavoriteSort.priceLow => 'Giá tăng dần',
    FavoriteSort.priceHigh => 'Giá giảm dần',
    FavoriteSort.name => 'Tên A–Z',
  };

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimens.d32.responsive()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimens.d80.responsive(),
              height: Dimens.d80.responsive(),
              decoration: const BoxDecoration(
                color: AppColors.surface2,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: Dimens.d32.responsive(),
                color: AppColors.ink4,
              ),
            ),
            SizedBox(height: Dimens.d24.responsive()),
            Text('Danh sách trống', style: AppTextStyles.h2Serif()),
            SizedBox(height: Dimens.d12.responsive()),
            Text(
              'Hãy lưu lại những sản phẩm bạn yêu thích để dễ dàng tìm kiếm và mua sắm sau này.',
              textAlign: TextAlign.center,
              style: AppTextStyles.s14w400Secondary().copyWith(height: 1.5),
            ),
            SizedBox(height: Dimens.d32.responsive()),
            GestureDetector(
              onTap: () => navigator.popUntilRootOfCurrentBottomTab(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.d32.responsive(),
                  vertical: Dimens.d16.responsive(),
                ),
                decoration: BoxDecoration(
                  color: AppColors.ink,
                  borderRadius: BorderRadius.circular(Dimens.d99.responsive()),
                ),
                child: Text(
                  'Khám phá ngay',
                  style: AppTextStyles.s14w400Primary().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(
        Dimens.d20.responsive(),
        Dimens.d20.responsive(),
        Dimens.d20.responsive(),
        Dimens.d128.responsive(),
      ),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: Dimens.d24.responsive(),
        crossAxisSpacing: Dimens.d12.responsive(),
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) => const _LoadingItem(),
    );
  }
}

class _LoadingItem extends StatelessWidget {
  const _LoadingItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: RoundedRectangleShimmer(
            width: double.infinity,
            height: double.infinity,
            borderRadius: Dimens.d12.responsive(),
          ),
        ),
        SizedBox(height: Dimens.d12.responsive()),
        RoundedRectangleShimmer(
          width: Dimens.d60.responsive(),
          height: Dimens.d10.responsive(),
        ),
        SizedBox(height: Dimens.d8.responsive()),
        RoundedRectangleShimmer(
          width: double.infinity,
          height: Dimens.d14.responsive(),
        ),
      ],
    );
  }
}
