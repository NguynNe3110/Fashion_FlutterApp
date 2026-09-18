import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'product_card.dart';
import '../../../../app.dart';

class HomeProductGrid extends StatelessWidget {
  const HomeProductGrid({
    required this.products,
    required this.favoriteProductIds,
    required this.onFavoriteTap,
    required this.onProductTap,
    super.key,
  });

  final List<ProductEntity> products;
  final Set<String> favoriteProductIds;
  final Function(ProductEntity, bool) onFavoriteTap;
  final Function(ProductEntity) onProductTap;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Dimens.d20.responsive() * 2;
    final crossAxisSpacing = Dimens.d12.responsive();
    final itemExtent = ProductCard.gridMainAxisExtent(
      context,
      horizontalPadding: horizontalPadding,
      crossAxisSpacing: crossAxisSpacing,
    );

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.d20.responsive(),
        vertical: Dimens.d12.responsive(),
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ProductCard.gridCrossAxisCount(context),
          mainAxisSpacing: Dimens.d12.responsive(),
          crossAxisSpacing: crossAxisSpacing,
          mainAxisExtent: itemExtent,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = products[index];
          final isFavorited = favoriteProductIds.contains(product.id);
          return ProductCard(
            product: product,
            isFavorited: isFavorited,
            onFavoriteTap: () => onFavoriteTap(product, isFavorited),
            onTap: () => onProductTap(product),
          );
        }, childCount: products.length),
      ),
    );
  }
}
