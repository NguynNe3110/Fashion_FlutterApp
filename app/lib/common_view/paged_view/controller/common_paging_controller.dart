import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared/shared.dart';

class CommonPagingController<T> implements Disposable {
  CommonPagingController({
    this.firstPageKey = PagingConstants.initialPage,
  });

  final int firstPageKey;

  // The paging state that will be used by the new API
  PagingState<int, T> _state = PagingState<int, T>(
    pages: const [],
    keys: const [],
    hasNextPage: true,
    isLoading: false,
  );

  // Stream controller for state changes
  late final _stateController = ValueNotifier<PagingState<int, T>>(
    PagingState<int, T>(
      pages: const [],
      keys: const [],
      hasNextPage: true,
      isLoading: false,
    ),
  );

  // Callback for fetching pages
  void Function()? _onLoadMore;

  // Get current state
  PagingState<int, T> get state => _state;
  ValueNotifier<PagingState<int, T>> get stateNotifier => _stateController;

  // call when error
  set error(AppException? appException) {
    _updateState(_state.copyWith(error: appException, isLoading: false));
  }

  // call when initState to listen to trigger load more
  void listen({
    required VoidCallback onLoadMore,
  }) {
    _onLoadMore = onLoadMore;
  }

  // Function to trigger fetching next page
  void fetchNextPage() {
    if (!_state.hasNextPage || _state.isLoading) {
      return;
    }

    _updateState(_state.copyWith(isLoading: true));
    _onLoadMore?.call();
  }

  // call append data when load first page / more page success
  void appendLoadMoreOutput(LoadMoreOutput<T> loadMoreOutput) {
    if (loadMoreOutput.isRefreshSuccess) {
      refresh();
      return;
    }

    final currentPages = _state.pages ?? <List<T>>[];
    final currentKeys = _state.keys ?? <int>[];

    final newPages = List<List<T>>.from(currentPages)..add(loadMoreOutput.data);
    final newKeys = List<int>.from(currentKeys)..add(loadMoreOutput.page);

    _updateState(_state.copyWith(
      pages: newPages,
      keys: newKeys,
      hasNextPage: !loadMoreOutput.isLastPage,
      isLoading: false,
      error: null,
    ));
  }

  void refresh() {
    _updateState(PagingState<int, T>(
      pages: const [],
      keys: const [],
      hasNextPage: true,
      isLoading: false,
    ));
  }

  void _updateState(PagingState<int, T> newState) {
    _state = newState;
    _stateController.value = newState;
  }

  void insertItemAt(int index, T item) {
    final items = _state.items?.toList() ?? <T>[];
    if (index >= 0 && index <= items.length) {
      items.insert(index, item);
      _rebuildPagesFromItems(items);
    }
  }

  void insertAllItemsAt(int index, Iterable<T> items) {
    final currentItems = _state.items?.toList() ?? <T>[];
    if (index >= 0 && index <= currentItems.length) {
      currentItems.insertAll(index, items);
      _rebuildPagesFromItems(currentItems);
    }
  }

  void updateItemAt(int index, T newItem) {
    final items = _state.items?.toList() ?? <T>[];
    if (index >= 0 && index < items.length) {
      items[index] = newItem;
      _rebuildPagesFromItems(items);
    }
  }

  void removeItemAt(int index) {
    final items = _state.items?.toList() ?? <T>[];
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      _rebuildPagesFromItems(items);
    }
  }

  void removeRange(int start, int end) {
    final items = _state.items?.toList() ?? <T>[];
    if (start >= 0 && end <= items.length && start <= end) {
      items.removeRange(start, end);
      _rebuildPagesFromItems(items);
    }
  }

  void clear(int start, int end) {
    _updateState(PagingState<int, T>(
      pages: const [],
      keys: const [],
      hasNextPage: true,
      isLoading: false,
    ));
  }

  void _rebuildPagesFromItems(List<T> items) {
    // This is a simplified approach - in practice you might want to preserve page structure
    // For now, we'll put all items in a single page
    if (items.isEmpty) {
      _updateState(_state.copyWith(pages: const [], keys: const []));
    } else {
      final currentKeys = _state.keys ?? <int>[];
      _updateState(_state.copyWith(
        pages: [items],
        keys: currentKeys.isNotEmpty ? [currentKeys.first] : [firstPageKey],
      ));
    }
  }

  @override
  void dispose() {
    _stateController.dispose();
  }
}
