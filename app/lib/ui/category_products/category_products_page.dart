import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import '../home/widgets/product_card.dart';

@RoutePage()
class CategoryProductsPage extends StatefulWidget {
  const CategoryProductsPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  @override
  State<StatefulWidget> createState() {
    return _CategoryProductsPageState();
  }
}

class _CategoryProductsPageState
    extends BasePageState<CategoryProductsPage, CategoryProductsBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(CategoryProductsPageInitiated(categoryId: widget.categoryId));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: widget.categoryName,
        titleTextStyle: AppTextStyles.h2Serif().copyWith(
          fontSize: Dimens.d20.responsive(),
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
        leadingIcon: LeadingIcon.back,
      ),
      body: SafeArea(
        child: BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
          builder: (context, state) {
            if (state.isShimmerLoading && state.products.isEmpty) {
              return _buildLoader();
            }

            if (state.products.isEmpty) {
              return _buildEmptyState();
            }

            return GridView.builder(
              padding: EdgeInsets.all(Dimens.d20.responsive()),
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
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                  onTap: () => navigator.push(AppRouteInfo.itemDetail(product)),
                  onFavoriteTap: () {
                    // TODO: call home bloc toggle favorite or common favorite bloc
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: Dimens.d64.responsive(),
            color: AppColors.ink4,
          ),
          SizedBox(height: Dimens.d24.responsive()),
          Text('Chưa có sản phẩm', style: AppTextStyles.h2Serif()),
          SizedBox(height: Dimens.d12.responsive()),
          Text(
            'Danh mục này hiện đang được cập nhật sản phẩm mới.',
            style: AppTextStyles.s14w400Secondary(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoader() {
    return GridView.builder(
      padding: EdgeInsets.all(Dimens.d20.responsive()),
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
