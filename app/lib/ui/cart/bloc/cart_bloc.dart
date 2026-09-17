import 'dart:async';

import 'package:app/app.dart';
import 'package:app/ui/cart/bloc/cart.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartBloc extends BaseBloc<CartEvent, CartState> {
  CartBloc(
    this._deleteCartItemUseCase,
    this._getCartItemsUseCase,
    this._updateCartItemQuantityUseCase,
    this._getMeUseCase,
  ) : super(const CartState()) {
    on<CartPageInitiated>(_onCartPageInitiated, transformer: log());
    on<CartItemQuantityChanged>(_onCartItemQuantityChanged, transformer: log());
    on<CartItemRemoved>(_onCartItemRemoved, transformer: log());
    on<CartItemSelectionToggled>(
      _onCartItemSelectionToggled,
      transformer: log(),
    );
    on<CartAllItemsSelectionToggled>(
      _onCartAllItemsSelectionToggled,
      transformer: log(),
    );
    on<CartCheckOutPressed>(_onCartCheckOutPressed, transformer: log());
    on<CartSelectedItemsRemoved>(
      _onCartSelectedItemsRemoved,
      transformer: log(),
    );
  }

  final DeleteCartItemUseCase _deleteCartItemUseCase;
  final GetCartItemsUseCase _getCartItemsUseCase;
  final UpdateCartItemQuantityUseCase _updateCartItemQuantityUseCase;
  final GetMeUseCase _getMeUseCase;

  FutureOr<void> _onCartPageInitiated(
    CartPageInitiated event,
    Emitter<CartState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(loadException: null));
        final user = await _getMeUseCase.execute(GetMeUseCaseInput());
        final userId = user.profile.id.toString();

        final cartItemOutput = await _getCartItemsUseCase.execute(
          GetCartItemsUseCaseInput(userId: userId),
        );

        emit(
          state.copyWith(
            items: cartItemOutput.cartItems,
            products: cartItemOutput.products,
            summary: cartItemOutput.summary,
          ),
        );
      },
      doOnSubscribe: () async =>
          emit(state.copyWith(isShimmerLoading: true)), // trước action
      doOnSuccessOrError: () async =>
          emit(state.copyWith(isShimmerLoading: false)), // sau action
      doOnError: (e) async => emit(state.copyWith(loadException: e)),
      handleLoading: false, // tự xử lý loading
    );
  }

  FutureOr<void> _onCartItemQuantityChanged(
    CartItemQuantityChanged event,
    Emitter<CartState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        // tìm item đang click
        final itemIndex = state.items.indexWhere(
          (i) => i.id == event.cartItemId,
        );
        if (itemIndex == -1) return;

        final currentItem = state.items[itemIndex];
        final newQuantity = currentItem.quantity + event.delta;

        if (newQuantity < 1) {
          navigator.showErrorSnackBar('Số lượng sản phẩm tối thiểu là 1');
          return;
        }

        await _updateCartItemQuantityUseCase.execute(
          UpdateCartItemQuantityUseCaseInput(
            cartItemId: event.cartItemId,
            quantity: newQuantity,
          ),
        );

        final updatedItems = List<CartItemEntity>.from(state.items);
        updatedItems[itemIndex] = currentItem.copyWith(quantity: newQuantity);

        final newSummary = CartSummaryEntity.calculateTotalPrice(
          cartItems: updatedItems,
          products: state.products,
        );

        emit(state.copyWith(items: updatedItems, summary: newSummary));
      },
      handleLoading: false, // k  cần
    );
  }

  FutureOr<void> _onCartItemSelectionToggled(
    CartItemSelectionToggled event,
    Emitter<CartState> emit,
  ) async {
    // ds item selected
    final updatedIds = List<String>.from(state.selectedItemIds);

    if (updatedIds.contains(event.cartItemId)) {
      updatedIds.remove(event.cartItemId);
    } else {
      updatedIds.add(event.cartItemId);
    }

    final selectedItems = state.items
        .where((i) => updatedIds.contains(i.id))
        .toList();
    final newSummary = CartSummaryEntity.calculateTotalPrice(
      cartItems: selectedItems,
      products: state.products,
    );

    emit(
      state.copyWith(
        selectedItemIds: updatedIds, //here
        summary: newSummary,
      ),
    );
  }

  void _onCartAllItemsSelectionToggled(
    CartAllItemsSelectionToggled event,
    Emitter<CartState> emit,
  ) {
    final selectedIds = state.isAllSelected
        ? <String>[]
        : state.items.map((item) => item.id).toList(growable: false);
    final selectedItems = state.items
        .where((item) => selectedIds.contains(item.id))
        .toList(growable: false);

    emit(
      state.copyWith(
        selectedItemIds: selectedIds,
        summary: CartSummaryEntity.calculateTotalPrice(
          cartItems: selectedItems,
          products: state.products,
        ),
      ),
    );
  }

  FutureOr<void> _onCartItemRemoved(
    //xóa r update
    CartItemRemoved event,
    Emitter<CartState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _deleteCartItemUseCase.execute(
          DeleteCartItemUseCaseInput(cartItemId: event.cartItemId),
        );

        final updatedItems = state.items
            .where((i) => i.id != event.cartItemId)
            .toList();
        final updatedSelectedIds = state.selectedItemIds
            .where((id) => id != event.cartItemId)
            .toList();

        final selectedItems = updatedItems
            .where((i) => updatedSelectedIds.contains(i.id))
            .toList();
        final newSummary = CartSummaryEntity.calculateTotalPrice(
          cartItems: selectedItems,
          products: state.products,
        );

        emit(
          state.copyWith(
            items: updatedItems,
            selectedItemIds: updatedSelectedIds,
            summary: newSummary,
          ),
        );
      },
      handleLoading: false,
    );
  }

  FutureOr<void> _onCartCheckOutPressed(
    CartCheckOutPressed event,
    Emitter<CartState> emit,
  ) async {
    if (state.selectedItemIds.isEmpty) return;

    await navigator.push(
      AppRouteInfo.checkout(
        selectedItems: state.selectedItems,
        products: state.products,
        summary: state.summary,
      ),
    );
  }

  FutureOr<void> _onCartSelectedItemsRemoved(
    CartSelectedItemsRemoved event,
    Emitter<CartState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        if (state.selectedItemIds.isEmpty) return;

        for (final id in state.selectedItemIds) {
          await _deleteCartItemUseCase.execute(
            DeleteCartItemUseCaseInput(cartItemId: id),
          );
        }

        final remainingItems = state.items
            .where((i) => !state.selectedItemIds.contains(i.id))
            .toList();
        final newSummary = CartSummaryEntity.calculateTotalPrice(
          cartItems: remainingItems,
          products: state.products,
        );

        emit(
          state.copyWith(
            items: remainingItems,
            selectedItemIds: [],
            summary: newSummary,
          ),
        );
      },
    );
  }
}
