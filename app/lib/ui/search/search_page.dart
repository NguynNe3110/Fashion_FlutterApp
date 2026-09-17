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
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    bloc.add(const SearchPageInitiated());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
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
                _buildSearchHeader(state),
                if (state.isShimmerLoading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(color: AppColors.ink),
                    ),
                  )
                else if (state.searchResults.isEmpty &&
                    state.keyword.isNotEmpty)
                  _buildEmptySearch()
                else if (state.searchResults.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
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
                      itemCount: state.searchResults.length,
                      itemBuilder: (context, index) {
                        final product = state.searchResults[index];
                        return ProductCard(
                          product: product,
                          onTap: () => bloc.add(
                            SearchProductClicked(productId: product.id),
                          ),
                          onFavoriteTap: () {},
                        );
                      },
                    ),
                  )
                else
                  const Expanded(child: SizedBox.shrink()),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchHeader(SearchState state) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimens.d12.responsive(),
        Dimens.d12.responsive(),
        Dimens.d16.responsive(),
        Dimens.d8.responsive(),
      ),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Quay lại',
            onPressed: () {
              _searchFocusNode.unfocus();
              bloc.add(const SearchBackPressed());
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.surface,
              side: const BorderSide(color: AppColors.line),
            ),
            icon: Icon(
              Icons.arrow_back_rounded,
              size: Dimens.d22.responsive(),
              color: AppColors.ink,
            ),
          ),
          SizedBox(width: Dimens.d10.responsive()),
          Expanded(
            child: SizedBox(
              height: Dimens.d48.responsive(),
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                autofocus: true,
                cursorColor: AppColors.ink,
                style: AppTextStyles.s14w400Primary(),
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm...',
                  hintStyle: AppTextStyles.s14w400Secondary().copyWith(
                    color: AppColors.ink4,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: Dimens.d20.responsive(),
                    color: AppColors.ink3,
                  ),
                  suffixIcon: state.keyword.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Xóa từ khóa',
                          onPressed: () {
                            _searchController.clear();
                            bloc.add(const SearchKeywordChanged(keyword: ''));
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: Dimens.d18.responsive(),
                          ),
                        ),
                  filled: true,
                  fillColor: AppColors.surface2,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimens.d16.responsive(),
                    vertical: Dimens.d12.responsive(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimens.d100.responsive(),
                    ),
                    borderSide: const BorderSide(color: AppColors.line),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimens.d100.responsive(),
                    ),
                    borderSide: const BorderSide(color: AppColors.ink),
                  ),
                ),
                onChanged: (value) =>
                    bloc.add(SearchKeywordChanged(keyword: value)),
                onSubmitted: (value) =>
                    bloc.add(SearchKeywordSubmitted(keyword: value)),
                textInputAction: TextInputAction.search,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearch() {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimens.d24.responsive()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: Dimens.d64.responsive(),
                color: AppColors.ink4,
              ),
              SizedBox(height: Dimens.d24.responsive()),
              Text('Không tìm thấy kết quả', style: AppTextStyles.h2Serif()),
              SizedBox(height: Dimens.d12.responsive()),
              Text(
                'Thử tìm kiếm với từ khóa khác nhé.',
                textAlign: TextAlign.center,
                style: AppTextStyles.s14w400Secondary(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
