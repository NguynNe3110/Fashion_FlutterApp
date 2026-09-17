import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/item_detail.dart';

@RoutePage()
class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState
    extends BasePageState<ItemDetailPage, ItemDetailBloc> {
  int _imageIndex = 0;
  ProductVariantEntity? _selectedVariant;
  int _quantity = 1;

  ProductVariantEntity? get _firstAvailableVariant {
    for (final variant in widget.product.variants) {
      if (variant.stockQuantity > 0) return variant;
    }
    return widget.product.variants.isEmpty
        ? null
        : widget.product.variants.first;
  }

  @override
  void initState() {
    super.initState();
    _selectedVariant = _firstAvailableVariant;
    bloc.add(const ItemDetailPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    final product = widget.product;
    return CommonScaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 430,
            elevation: 0,
            backgroundColor: AppColors.background,
            foregroundColor: AppColors.ink,
            leading: _roundIcon(
              Icons.arrow_back_rounded,
              () => navigator.pop(),
            ),
            actions: [
              BlocBuilder<ItemDetailBloc, ItemDetailState>(
                buildWhen: (previous, current) =>
                    previous.isFavorite != current.isFavorite ||
                    previous.isUpdatingFavorite != current.isUpdatingFavorite,
                builder: (context, state) => _roundIcon(
                  state.isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  state.isUpdatingFavorite
                      ? () {}
                      : () => bloc.add(
                          ItemDetailFavoritePressed(productId: product.id),
                        ),
                ),
              ),
              const SizedBox(width: 12),
            ],
            flexibleSpace: FlexibleSpaceBar(background: _buildGallery(product)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (product.categoryName ?? 'NORD').toUpperCase(),
                        style: AppTextStyles.eyebrow(),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFB66A3C),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            product.reviewCount == 0
                                ? 'Mới'
                                : '${product.ratingAverage.toStringAsFixed(1)} (${product.reviewCount})',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: AppTextStyles.h2Serif(fontSize: 28),
                  ),
                  const SizedBox(height: 10),
                  _buildPrice(product),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Divider(color: AppColors.line, height: 1),
                  ),
                  if (product.variants.isNotEmpty) ...[
                    _buildVariantPicker(product.variants),
                    const SizedBox(height: 24),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SỐ LƯỢNG', style: AppTextStyles.eyebrow()),
                      _buildQuantityPicker(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Divider(color: AppColors.line, height: 1),
                  ),
                  Text('CHI TIẾT', style: AppTextStyles.eyebrow()),
                  const SizedBox(height: 12),
                  Text(
                    product.description?.trim().isNotEmpty == true
                        ? product.description!
                        : 'Thiết kế tối giản, dễ phối và phù hợp cho nhịp sống hằng ngày.',
                    style: AppTextStyles.s14w400Secondary().copyWith(
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _infoRow(
                    Icons.local_shipping_outlined,
                    'Giao hàng miễn phí',
                    'Đơn từ 500.000₫ · Nhận trong 2–4 ngày',
                  ),
                  const SizedBox(height: 16),
                  _infoRow(
                    Icons.replay_rounded,
                    'Đổi trả trong 30 ngày',
                    'Miễn phí đổi trả nếu sản phẩm không vừa ý',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(top: BorderSide(color: AppColors.line)),
          ),
          child: BlocBuilder<ItemDetailBloc, ItemDetailState>(
            buildWhen: (previous, current) =>
                previous.isAddingToCart != current.isAddingToCart,
            builder: (context, state) {
              final canAdd =
                  _selectedVariant != null &&
                  _selectedVariant!.stockQuantity >= _quantity &&
                  !state.isAddingToCart;
              return SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: canAdd
                      ? () => bloc.add(
                          ItemDetailAddToCartPressed(
                            productId: product.id,
                            variantId: _selectedVariant!.id,
                            quantity: _quantity,
                          ),
                        )
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.ink,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: AppColors.ink4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: state.isAddingToCart
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          canAdd
                              ? 'Thêm vào giỏ · ${NumberFormatUtils.formatYen(product.effectivePrice * _quantity.toDouble())}'
                              : 'Sản phẩm tạm hết hàng',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGallery(ProductEntity product) {
    final images = product.imageUrls;
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: AppColors.phWarm,
          child: images.isEmpty
              ? const Icon(
                  Icons.image_outlined,
                  size: 72,
                  color: AppColors.ink4,
                )
              : PageView.builder(
                  itemCount: images.length,
                  onPageChanged: (index) => setState(() => _imageIndex = index),
                  itemBuilder: (_, index) => Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.broken_image_outlined,
                      size: 64,
                      color: AppColors.ink4,
                    ),
                  ),
                ),
        ),
        if (images.length > 1)
          Positioned(
            right: 18,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.ink.withValues(alpha: .72),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                '${_imageIndex + 1}/${images.length}',
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPrice(ProductEntity product) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        Text(
          NumberFormatUtils.formatYen(product.effectivePrice.toDouble()),
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        if (product.hasDiscount)
          Text(
            NumberFormatUtils.formatYen(product.price.toDouble()),
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.ink4,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        if (product.hasDiscount)
          Text(
            '-${(((product.price - product.effectivePrice) / product.price) * 100).round()}%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.sale,
            ),
          ),
      ],
    );
  }

  Widget _buildVariantPicker(List<ProductVariantEntity> variants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('KÍCH CỠ / MÀU', style: AppTextStyles.eyebrow()),
            TextButton(
              onPressed: _showSizeGuide,
              child: const Text('Bảng size ↗'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: variants
              .map((variant) {
                final selected = variant.id == _selectedVariant?.id;
                final available = variant.stockQuantity > 0;
                return ChoiceChip(
                  label: Text('${variant.size} · ${variant.color}'),
                  selected: selected,
                  onSelected: available
                      ? (_) => setState(() => _selectedVariant = variant)
                      : null,
                  selectedColor: AppColors.ink,
                  backgroundColor: AppColors.surface,
                  disabledColor: AppColors.surface2,
                  side: BorderSide(
                    color: selected ? AppColors.ink : AppColors.line2,
                  ),
                  labelStyle: TextStyle(
                    color: selected
                        ? Colors.white
                        : available
                        ? AppColors.ink
                        : AppColors.ink4,
                    fontSize: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              })
              .toList(growable: false),
        ),
      ],
    );
  }

  Widget _buildQuantityPicker() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.line2),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
            icon: const Icon(Icons.remove, size: 16),
          ),
          Text(
            '$_quantity',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          IconButton(
            onPressed:
                _selectedVariant != null &&
                    _quantity < _selectedVariant!.stockQuantity
                ? () => setState(() => _quantity++)
                : null,
            icon: const Icon(Icons.add, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.ink3, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(color: AppColors.ink3, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _roundIcon(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton.filledTonal(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: .9),
          foregroundColor: AppColors.ink,
        ),
      ),
    );
  }

  Future<void> _showSizeGuide() async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: AppColors.surface,
      builder: (_) => const Padding(
        padding: EdgeInsets.fromLTRB(24, 8, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bảng kích cỡ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            _SizeRow('S', 'Ngực 82–86', 'Eo 64–68'),
            _SizeRow('M', 'Ngực 87–91', 'Eo 69–73'),
            _SizeRow('L', 'Ngực 92–97', 'Eo 74–79'),
            _SizeRow('XL', 'Ngực 98–104', 'Eo 80–86'),
          ],
        ),
      ),
    );
  }
}

class _SizeRow extends StatelessWidget {
  const _SizeRow(this.size, this.bust, this.waist);

  final String size;
  final String bust;
  final String waist;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              size,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Text(bust, style: const TextStyle(color: AppColors.ink3)),
          ),
          Expanded(
            child: Text(waist, style: const TextStyle(color: AppColors.ink3)),
          ),
        ],
      ),
    );
  }
}
