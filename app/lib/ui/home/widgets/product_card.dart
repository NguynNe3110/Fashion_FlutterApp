import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../../../../app.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.onTap,
    required this.onFavoriteTap,
    this.isFavorited = false,
    super.key,
  });

  final ProductEntity product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final bool isFavorited;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface2,
                    borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: product.primaryImageUrl != null
                      ? Image.network(product.primaryImageUrl!, fit: BoxFit.cover)
                      : const Center(child: Icon(Icons.image_outlined, color: AppColors.ink4)),
                ),
              ),
              Positioned(
                top: Dimens.d8.responsive(),
                right: Dimens.d8.responsive(),
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: Container(
                    padding: EdgeInsets.all(Dimens.d6.responsive()),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      size: Dimens.d18.responsive(),
                      color: isFavorited ? AppColors.sale : AppColors.ink,
                    ),
                  ),
                ),
              ),
              if (product.hasDiscount)
                Positioned(
                  bottom: Dimens.d8.responsive(),
                  left: Dimens.d8.responsive(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.d8.responsive(),
                      vertical: Dimens.d4.responsive(),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.sale,
                      borderRadius: BorderRadius.circular(Dimens.d4.responsive()),
                    ),
                    child: Text(
                      'SALE',
                      style: AppTextStyles.eyebrow().copyWith(
                        color: Colors.white,
                        fontSize: Dimens.d8.responsive(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: Dimens.d12.responsive()),
          Text(
            product.categoryName?.toUpperCase() ?? 'COLLECTION',
            style: AppTextStyles.eyebrow().copyWith(fontSize: Dimens.d9.responsive()),
          ),
          SizedBox(height: Dimens.d4.responsive()),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.s14w400Primary().copyWith(
              fontSize: Dimens.d14.responsive(),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: Dimens.d6.responsive()),
          Row(
            children: [
              Text(
                NumberFormatUtils.formatYen(product.effectivePrice.toDouble()),
                style: AppTextStyles.s14w400Primary().copyWith(
                  fontSize: Dimens.d14.responsive(),
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (product.hasDiscount) ...[
                SizedBox(width: Dimens.d8.responsive()),
                Text(
                  NumberFormatUtils.formatYen(product.price.toDouble()),
                  style: AppTextStyles.s14w400Secondary().copyWith(
                    fontSize: Dimens.d12.responsive(),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
