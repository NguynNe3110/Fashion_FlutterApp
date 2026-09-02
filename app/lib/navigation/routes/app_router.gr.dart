// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:app/navigation/routes/app_router.dart' as _i2;
import 'package:app/ui/home/home_page.dart' as _i1;
import 'package:app/ui/item_detail/item_detail_page.dart' as _i3;
import 'package:app/ui/login/login_page.dart' as _i4;
import 'package:app/ui/main/main_page.dart' as _i5;
import 'package:app/ui/my_page/my_page_page.dart' as _i6;
import 'package:app/ui/search/search_page.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:domain/domain.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.HomeTabPage]
class HomeTab extends _i8.PageRouteInfo<void> {
  const HomeTab({List<_i8.PageRouteInfo>? children})
    : super(HomeTab.name, initialChildren: children);

  static const String name = 'HomeTab';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeTabPage();
    },
  );
}

/// generated route for
/// [_i3.ItemDetailPage]
class ItemDetailRoute extends _i8.PageRouteInfo<ItemDetailRouteArgs> {
  ItemDetailRoute({
    required _i9.User user,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ItemDetailRoute.name,
         args: ItemDetailRouteArgs(user: user, key: key),
         initialChildren: children,
       );

  static const String name = 'ItemDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ItemDetailRouteArgs>();
      return _i3.ItemDetailPage(user: args.user, key: args.key);
    },
  );
}

class ItemDetailRouteArgs {
  const ItemDetailRouteArgs({required this.user, this.key});

  final _i9.User user;

  final _i10.Key? key;

  @override
  String toString() {
    return 'ItemDetailRouteArgs{user: $user, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ItemDetailRouteArgs) return false;
    return user == other.user && key == other.key;
  }

  @override
  int get hashCode => user.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainPage();
    },
  );
}

/// generated route for
/// [_i6.MyPagePage]
class MyPageRoute extends _i8.PageRouteInfo<void> {
  const MyPageRoute({List<_i8.PageRouteInfo>? children})
    : super(MyPageRoute.name, initialChildren: children);

  static const String name = 'MyPageRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.MyPagePage();
    },
  );
}

/// generated route for
/// [_i2.MyPageTabPage]
class MyPageTab extends _i8.PageRouteInfo<void> {
  const MyPageTab({List<_i8.PageRouteInfo>? children})
    : super(MyPageTab.name, initialChildren: children);

  static const String name = 'MyPageTab';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.MyPageTabPage();
    },
  );
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute({List<_i8.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchPage();
    },
  );
}

/// generated route for
/// [_i2.SearchTabPage]
class SearchTab extends _i8.PageRouteInfo<void> {
  const SearchTab({List<_i8.PageRouteInfo>? children})
    : super(SearchTab.name, initialChildren: children);

  static const String name = 'SearchTab';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.SearchTabPage();
    },
  );
}
