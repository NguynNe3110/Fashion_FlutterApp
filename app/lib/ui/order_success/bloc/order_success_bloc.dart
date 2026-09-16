import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'order_success.dart';

@injectable
class OrderSuccessBloc
    extends BaseBloc<OrderSuccessEvent, OrderSuccessState> {
  OrderSuccessBloc() : super(const OrderSuccessState()) {
    on<ContinueShoppingPressed>(_onContinueShoppingPressed);
    on<ViewOrderHistoryPressed>(_onViewOrderHistoryPressed);
  }

  FutureOr<void> _onContinueShoppingPressed(
    ContinueShoppingPressed event,
    Emitter<OrderSuccessState> emit,
  ) async {
    await navigator.replace(const AppRouteInfo.main());
  }

  FutureOr<void> _onViewOrderHistoryPressed(
    ViewOrderHistoryPressed event,
    Emitter<OrderSuccessState> emit,
  ) async {
    await navigator.push(const AppRouteInfo.orderHistory());
  }
}
