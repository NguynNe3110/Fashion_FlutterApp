import 'dart:async';

import 'package:app/app.dart';
import 'package:app/ui/order_history/bloc/order_history.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderHistoryBloc extends BaseBloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc(this._getOrderHistoryUseCase, this._getMeUseCase)
    : super(const OrderHistoryState()) {
    on<OrderHistoryPageInitiated>(
      _onOrderHistoryPageInitiated,
      transformer: log(),
    );
    on<OrderHistoryLoadMore>(_onOrderHistoryLoadMore, transformer: log());
  }

  final GetOrderHistoryUseCase _getOrderHistoryUseCase;
  final GetMeUseCase _getMeUseCase;

  FutureOr<void> _onOrderHistoryPageInitiated(
    OrderHistoryPageInitiated event,
    Emitter<OrderHistoryState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final user = await _getMeUseCase.execute(const GetMeUseCaseInput());
        final userId = user.profile.id.toString();

        final output = await _getOrderHistoryUseCase.execute(
          GetOrderHistoryUseCaseInput(userId: userId),
        );

        emit(state.copyWith(orders: output.orders, isShimmerLoading: false));
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      handleLoading: false,
    );
  }

  FutureOr<void> _onOrderHistoryLoadMore(
    OrderHistoryLoadMore event,
    Emitter<OrderHistoryState> emit,
  ) async {
    // TODO: implement pagination logic
  }
}
