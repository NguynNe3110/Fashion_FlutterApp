import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../../app.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    required this.categories,
    required this.onSeeAll,
    required this.onCategoryTap,
    super.key,
  });

  final List<CategoryEntity> categories;
  final VoidCallback onSeeAll;
  final Function(CategoryEntity) onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Khám phá', style: AppTextStyles.sectionTitle()),
                GestureDetector(
                  onTap: onSeeAll,
                  child: Text('Tất cả', style: AppTextStyles.linkText()),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimens.d16.responsive()),
          SizedBox(
            height: Dimens.d110.responsive(),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.d20.responsive(),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) =>
                  SizedBox(width: Dimens.d16.responsive()),
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () => onCategoryTap(category),
                  child: Column(
                    children: [
                      Container(
                        width: Dimens.d72.responsive(),
                        height: Dimens.d72.responsive(),
                        decoration: const BoxDecoration(
                          color: AppColors.surface2,
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: category.imageUrl != null
                            ? Image.network(
                                category.imageUrl!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.category_outlined,
                                color: AppColors.ink4,
                              ),
                      ),
                      SizedBox(height: Dimens.d8.responsive()),
                      SizedBox(
                        width: Dimens.d76.responsive(),
                        child: Text(
                          category.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.s14w400Primary().copyWith(
                            fontSize: Dimens.d12.responsive(),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: Dimens.d24.responsive()),
        ],
      ),
    );
  }
}
