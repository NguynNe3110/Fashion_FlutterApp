// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:app/app.dart' as _i137;
import 'package:app/app/bloc/app_bloc.dart' as _i356;
import 'package:app/base/bloc/common/common_bloc.dart' as _i639;
import 'package:app/helper/local_push_notification_helper.dart' as _i418;
import 'package:app/navigation/app_navigator_impl.dart' as _i101;
import 'package:app/navigation/mapper/app_popup_info_mapper.dart' as _i203;
import 'package:app/navigation/mapper/app_route_info_mapper.dart' as _i48;
import 'package:app/navigation/middleware/route_guard.dart' as _i513;
import 'package:app/navigation/routes/app_router.dart' as _i931;
import 'package:app/ui/home/bloc/home_bloc.dart' as _i87;
import 'package:app/ui/item_detail/bloc/item_detail_bloc.dart' as _i193;
import 'package:app/ui/login/bloc/login_bloc.dart' as _i152;
import 'package:app/ui/main/bloc/main_bloc.dart' as _i269;
import 'package:app/ui/my_page/bloc/my_page_bloc.dart' as _i998;
import 'package:app/ui/search/bloc/search_bloc.dart' as _i177;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i193.ItemDetailBloc>(() => _i193.ItemDetailBloc());
    gh.factory<_i269.MainBloc>(() => _i269.MainBloc());
    gh.factory<_i177.SearchBloc>(() => _i177.SearchBloc());
    gh.lazySingleton<_i418.LocalPushNotificationHelper>(
      () => _i418.LocalPushNotificationHelper(),
    );
    gh.lazySingleton<_i931.AppRouter>(() => _i931.AppRouter());
    gh.lazySingleton<_i137.BaseRouteInfoMapper>(
      () => _i48.AppRouteInfoMapper(),
    );
    gh.lazySingleton<_i137.BasePopupInfoMapper>(
      () => _i203.AppPopupInfoMapper(),
    );
    gh.factory<_i639.CommonBloc>(
      () => _i639.CommonBloc(gh<_i494.ClearCurrentUserDataUseCase>()),
    );
    gh.factory<_i152.LoginBloc>(
      () => _i152.LoginBloc(
        gh<_i494.LoginUseCase>(),
        gh<_i494.FakeLoginUseCase>(),
      ),
    );
    gh.factory<_i998.MyPageBloc>(
      () => _i998.MyPageBloc(gh<_i494.LogoutUseCase>()),
    );
    gh.lazySingleton<_i356.AppBloc>(
      () => _i356.AppBloc(
        gh<_i494.GetInitialAppDataUseCase>(),
        gh<_i494.SaveIsDarkModeUseCase>(),
        gh<_i494.SaveLanguageCodeUseCase>(),
      ),
    );
    gh.factory<_i87.HomeBloc>(() => _i87.HomeBloc(gh<_i494.GetUsersUseCase>()));
    gh.factory<_i513.RouteGuard>(
      () => _i513.RouteGuard(gh<_i494.IsLoggedInUseCase>()),
    );
    gh.lazySingleton<_i494.AppNavigator>(
      () => _i101.AppNavigatorImpl(
        gh<_i137.AppRouter>(),
        gh<_i137.BasePopupInfoMapper>(),
        gh<_i137.BaseRouteInfoMapper>(),
      ),
    );
    return this;
  }
}
