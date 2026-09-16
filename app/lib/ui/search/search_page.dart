import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/search.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends BasePageState<SearchPage, SearchBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const SearchPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Dimens.d16.responsive()),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => navigator.pop(),
                        child: Icon(Icons.arrow_back_ios_new_rounded, size: Dimens.d20.responsive(), color: AppColors.ink),
                      ),
                      SizedBox(width: Dimens.d16.responsive()),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
                          decoration: BoxDecoration(
                            color: AppColors.surface2,
                            borderRadius: BorderRadius.circular(Dimens.d100.responsive()),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Tìm kiếm sản phẩm...',
                              hintStyle: AppTextStyles.s14w400Secondary().copyWith(color: AppColors.ink4),
                              border: InputBorder.none,
                              icon: Icon(Icons.search_rounded, size: Dimens.d20.responsive(), color: AppColors.ink3),
                            ),
                            onChanged: (val) => bloc.add(SearchKeywordChanged(keyword: val)),
                            onSubmitted: (val) => bloc.add(SearchKeywordSubmitted(keyword: val)),
                            textInputAction: TextInputAction.search,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.isShimmerLoading)
                  const Expanded(child: Center(child: CircularProgressIndicator(color: AppColors.ink))),
                if (!state.isShimmerLoading && state.searchResults.isEmpty && state.keyword.isNotEmpty)
                  _buildEmptySearch(),
                if (!state.isShimmerLoading && state.searchResults.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(Dimens.d20.responsive()),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Dimens.d24.responsive(),
                        crossAxisSpacing: Dimens.d12.responsive(),
                        childAspectRatio: 0.6,
                      ),
                      itemCount: state.searchResults.length,
                      itemBuilder: (context, index) {
                        final product = state.searchResults[index];
                        return ProductCard(
                          product: product,
                          onTap: () => bloc.add(SearchProductClicked(productId: product.id)),
                          onFavoriteTap: () {
                            // TODO: implement favorite
                          },
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptySearch() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: Dimens.d64.responsive(), color: AppColors.ink4),
            SizedBox(height: Dimens.d24.responsive()),
            Text('Không tìm thấy kết quả', style: AppTextStyles.h2Serif()),
            SizedBox(height: Dimens.d12.responsive()),
            Text(
              'Thử tìm kiếm với từ khóa khác nhé.',
              style: AppTextStyles.s14w400Secondary(),
            ),
          ],
        ),
      ),
    );
  }
}
