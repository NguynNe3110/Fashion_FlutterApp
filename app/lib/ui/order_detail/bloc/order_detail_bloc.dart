import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'order_detail.dart';

@injectable
class OrderDetailBloc extends BaseBloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc(this._getOrderByIdUseCase, this._getOrderItemsUseCase)
    : super(const OrderDetailState()) {
    on<OrderDetailPageInitiated>(_onOrderDetailPageInitiated);
  }

  final GetOrderByIdUseCase _getOrderByIdUseCase;
  final GetOrderItemsUseCase _getOrderItemsUseCase;

  FutureOr<void> _onOrderDetailPageInitiated(
    OrderDetailPageInitiated event,
    Emitter<OrderDetailState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(loadException: null));

        final results = await Future.wait([
          _getOrderByIdUseCase.execute(
            GetOrderByIdUseCaseInput(id: event.orderId),
          ),
          _getOrderItemsUseCase.execute(
            GetOrderItemsUseCaseInput(orderId: event.orderId),
          ),
        ]);

        final orderOutput = results[0] as GetOrderByIdUseCaseOutput;
        final itemsOutput = results[1] as GetOrderItemsUseCaseOutput;

        emit(
          state.copyWith(order: orderOutput.order, items: itemsOutput.items),
        );
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async =>
          emit(state.copyWith(isShimmerLoading: false)),
      doOnError: (e) async => emit(state.copyWith(loadException: e)),
      handleLoading: false,
    );
  }
}
