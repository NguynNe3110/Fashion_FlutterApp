import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BaseGoRouter {
  BaseGoRouter({
    required List<RouteBase> routes,
    String initialLocation = '/',
    GlobalKey<NavigatorState>? navigatorKey,
    GoRouterRedirect? redirect,
  }) : router = GoRouter(
         initialLocation: initialLocation,
         navigatorKey: navigatorKey,
         redirect: redirect,
         routes: routes,
       );

  final GoRouter router;

  RouterConfig<Object> get routerConfig => router;

  String get currentLocation =>
      router.routerDelegate.currentConfiguration.uri.toString();

  void go(String location, {Object? extra}) =>
      router.go(location, extra: extra);

  Future<T?> push<T extends Object?>(String location, {Object? extra}) =>
      router.push<T>(location, extra: extra);

  void pop<T extends Object?>([T? result]) => router.pop(result);
}
