import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../app.dart';
import 'notification.dart';

@injectable
class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<NotificationPageInitiated>(_onNotificationPageInitiated);
  }

  FutureOr<void> _onNotificationPageInitiated(
    NotificationPageInitiated event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(isShimmerLoading: true));
    await Future.delayed(const Duration(seconds: 1)); // Mock delay

    const mockData = [
      {
        'title': 'Đơn hàng đã được xác nhận',
        'content':
            'Đơn hàng #ORD12345 của bạn đã được hệ thống xác nhận và đang chờ đóng gói.',
        'time': '2 giờ trước',
      },
      {
        'title': 'Ưu đãi đặc biệt dành cho bạn',
        'content': 'Nhập mã NORD50 để được giảm giá 50k cho đơn hàng từ 500k.',
        'time': '5 giờ trước',
      },
      {
        'title': 'Chào mừng bạn đến với Nord Fashion',
        'content':
            'Cảm ơn bạn đã gia nhập cộng đồng của chúng tôi. Chúc bạn có trải nghiệm mua sắm tuyệt vời!',
        'time': '1 ngày trước',
      },
    ];

    emit(state.copyWith(notifications: mockData, isShimmerLoading: false));
  }
}
