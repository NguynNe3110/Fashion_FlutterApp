import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'app_route_info.freezed.dart';

/// page the intent
@freezed
class AppRouteInfo with _$AppRouteInfo {
  // factory có thể tự quyết định kiểu trả về của nó, ở đây trả về _Login và nó extend AppRouteInfo
  const factory AppRouteInfo.login() = _Login;

  const factory AppRouteInfo.register() = _Register;

  const factory AppRouteInfo.address() = _Address;

  const factory AppRouteInfo.orderDetail({required String orderId}) =
      _OrderDetail;

  const factory AppRouteInfo.categoryProducts({
    required String categoryId,
    required String categoryName,
  }) = _CategoryProducts;

  const factory AppRouteInfo.review({
    required String productId,
    required String productName,
  }) = _Review;

  const factory AppRouteInfo.onboarding() = _Onboarding;

  const factory AppRouteInfo.forgotPassword() = _ForgotPassword;

  const factory AppRouteInfo.orderSuccess({required String orderCode}) =
      _OrderSuccess;

  const factory AppRouteInfo.vouchers() = _Vouchers;

  const factory AppRouteInfo.paymentMethods() = _PaymentMethods;

  const factory AppRouteInfo.favorite() = _Favorite;

  const factory AppRouteInfo.cart() = _Cart;

  // screen thì k cần tham số
  const factory AppRouteInfo.main() = _Main;

  // màn hình chi tiết thì phải truyền object
  const factory AppRouteInfo.itemDetail(ProductEntity product) = _UserDetail;

  const factory AppRouteInfo.checkout({
    required List<CartItemEntity> selectedItems,
    required List<ProductEntity> products,
    required CartSummaryEntity summary,
  }) = _Checkout;

  const factory AppRouteInfo.orderHistory() = _OrderHistory;
  const factory AppRouteInfo.search() = _Search;

  const factory AppRouteInfo.notification() = _Notification;

  const factory AppRouteInfo.personalInfo() = _PersonalInfo;

  const factory AppRouteInfo.help() = _Help;
}
