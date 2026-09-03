// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:data/data.dart' as _i437;
import 'package:data/src/di/di.dart' as _i102;
import 'package:data/src/repository/repository_impl.dart' as _i1013;
import 'package:data/src/repository/source/api/app_api_service.dart' as _i865;
import 'package:data/src/repository/source/api/client/auth_app_server_api_client.dart'
    as _i1071;
import 'package:data/src/repository/source/api/client/none_auth_app_server_api_client.dart'
    as _i756;
import 'package:data/src/repository/source/api/client/random_user_api_client.dart'
    as _i522;
import 'package:data/src/repository/source/api/client/raw_api_client.dart'
    as _i324;
import 'package:data/src/repository/source/api/client/refresh_token_api_client.dart'
    as _i762;
import 'package:data/src/repository/source/api/mapper/api_image_url_data_mapper.dart'
    as _i955;
import 'package:data/src/repository/source/api/mapper/api_notification_data_mapper.dart'
    as _i1040;
import 'package:data/src/repository/source/api/mapper/api_token_data_mapper.dart'
    as _i392;
import 'package:data/src/repository/source/api/mapper/api_user_data_mapper.dart'
    as _i332;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/firebase_storage_error_response_mapper.dart'
    as _i413;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/goong_error_response_mapper.dart'
    as _i105;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/json_array_error_response_mapper.dart'
    as _i156;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/json_object_error_response_mapper.dart'
    as _i24;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/line_error_response_mapper.dart'
    as _i886;
import 'package:data/src/repository/source/api/mapper/base/base_error_response_mapper/twitter_error_response_mapper.dart'
    as _i305;
import 'package:data/src/repository/source/api/middleware/access_token_interceptor.dart'
    as _i511;
import 'package:data/src/repository/source/api/middleware/connectivity_interceptor.dart'
    as _i1037;
import 'package:data/src/repository/source/api/middleware/header_interceptor.dart'
    as _i825;
import 'package:data/src/repository/source/api/middleware/refresh_token_interceptor.dart'
    as _i1073;
import 'package:data/src/repository/source/api/refresh_token_api_service.dart'
    as _i654;
import 'package:data/src/repository/source/database/app_database.dart' as _i905;
import 'package:data/src/repository/source/database/mapper/local_image_url_data_mapper.dart'
    as _i975;
import 'package:data/src/repository/source/database/mapper/local_user_data_mapper.dart'
    as _i19;
import 'package:data/src/repository/source/preference/app_preferences.dart'
    as _i28;
import 'package:data/src/repository/source/preference/mapper/preference_user_data_mapper.dart'
    as _i611;
import 'package:data/src/repository/source/shared/mapper/gender_data_mapper.dart'
    as _i174;
import 'package:data/src/repository/source/shared/mapper/language_code_data_mapper.dart'
    as _i647;
import 'package:domain/domain.dart' as _i494;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:objectbox/objectbox.dart' as _i1034;
import 'package:shared/shared.dart' as _i811;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceModule = _$ServiceModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => serviceModule.secureStorage,
      preResolve: true,
    );
    await gh.factoryAsync<_i1034.Store>(
      () => serviceModule.getStore(),
      preResolve: true,
    );
    gh.factory<_i955.ApiImageUrlDataMapper>(
      () => _i955.ApiImageUrlDataMapper(),
    );
    gh.factory<_i1040.ApiNotificationDataMapper>(
      () => _i1040.ApiNotificationDataMapper(),
    );
    gh.factory<_i392.ApiTokenDataMapper>(() => _i392.ApiTokenDataMapper());
    gh.factory<_i413.FirebaseStorageErrorResponseMapper>(
      () => _i413.FirebaseStorageErrorResponseMapper(),
    );
    gh.factory<_i105.GoongErrorResponseMapper>(
      () => _i105.GoongErrorResponseMapper(),
    );
    gh.factory<_i156.JsonArrayErrorResponseMapper>(
      () => _i156.JsonArrayErrorResponseMapper(),
    );
    gh.factory<_i24.JsonObjectErrorResponseMapper>(
      () => _i24.JsonObjectErrorResponseMapper(),
    );
    gh.factory<_i886.LineErrorResponseMapper>(
      () => _i886.LineErrorResponseMapper(),
    );
    gh.factory<_i305.TwitterErrorResponseMapper>(
      () => _i305.TwitterErrorResponseMapper(),
    );
    gh.factory<_i1037.ConnectivityInterceptor>(
      () => _i1037.ConnectivityInterceptor(),
    );
    gh.factory<_i975.LocalImageUrlDataMapper>(
      () => _i975.LocalImageUrlDataMapper(),
    );
    gh.factory<_i611.PreferenceUserDataMapper>(
      () => _i611.PreferenceUserDataMapper(),
    );
    gh.factory<_i174.GenderDataMapper>(() => _i174.GenderDataMapper());
    gh.factory<_i647.LanguageCodeDataMapper>(
      () => _i647.LanguageCodeDataMapper(),
    );

    gh.singleton<_i454.SupabaseClient>(() => serviceModule.supabaseClient);

    gh.lazySingleton<_i522.RandomUserApiClient>(
      () => _i522.RandomUserApiClient(),
    );
    gh.lazySingleton<_i324.RawApiClient>(() => _i324.RawApiClient());
    gh.lazySingleton<_i905.AppDatabase>(
      () => _i905.AppDatabase(gh<_i1034.Store>()),
    );
    gh.factory<_i19.LocalUserDataMapper>(
      () => _i19.LocalUserDataMapper(
        gh<_i437.GenderDataMapper>(),
        gh<_i437.LocalImageUrlDataMapper>(),
      ),
    );
    gh.factory<_i825.HeaderInterceptor>(
      () => _i825.HeaderInterceptor(gh<_i811.AppInfo>()),
    );
    gh.lazySingleton<_i28.AppPreferences>(
      () => _i28.AppPreferences(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i332.ApiUserDataMapper>(
      () => _i332.ApiUserDataMapper(
        gh<_i437.GenderDataMapper>(),
        gh<_i437.ApiImageUrlDataMapper>(),
      ),
    );
    gh.factory<_i511.AccessTokenInterceptor>(
      () => _i511.AccessTokenInterceptor(gh<_i437.AppPreferences>()),
    );
    gh.lazySingleton<_i756.NoneAuthAppServerApiClient>(
      () => _i756.NoneAuthAppServerApiClient(gh<_i437.HeaderInterceptor>()),
    );
    gh.lazySingleton<_i762.RefreshTokenApiClient>(
      () => _i762.RefreshTokenApiClient(
        gh<_i437.HeaderInterceptor>(),
        gh<_i437.AccessTokenInterceptor>(),
      ),
    );
    gh.lazySingleton<_i654.RefreshTokenApiService>(
      () => _i654.RefreshTokenApiService(gh<_i437.RefreshTokenApiClient>()),
    );
    gh.factory<_i1073.RefreshTokenInterceptor>(
      () => _i1073.RefreshTokenInterceptor(
        gh<_i437.AppPreferences>(),
        gh<_i437.RefreshTokenApiService>(),
        gh<_i437.NoneAuthAppServerApiClient>(),
      ),
    );
    gh.lazySingleton<_i1071.AuthAppServerApiClient>(
      () => _i1071.AuthAppServerApiClient(
        gh<_i437.HeaderInterceptor>(),
        gh<_i437.AccessTokenInterceptor>(),
        gh<_i437.RefreshTokenInterceptor>(),
      ),
    );
    gh.lazySingleton<_i865.AppApiService>(
      () => _i865.AppApiService(
        gh<_i437.NoneAuthAppServerApiClient>(),
        gh<_i437.AuthAppServerApiClient>(),
        gh<_i437.RandomUserApiClient>(),
      ),
    );
    gh.lazySingleton<_i494.Repository>(
      () => _i1013.RepositoryImpl(
        gh<_i437.AppApiService>(),
        gh<_i437.AppPreferences>(),
        gh<_i437.AppDatabase>(),
        gh<_i437.PreferenceUserDataMapper>(),
        gh<_i437.ApiUserDataMapper>(),
        gh<_i437.LanguageCodeDataMapper>(),
        gh<_i437.GenderDataMapper>(),
        gh<_i437.LocalUserDataMapper>(),
      ),
    );
    return this;
  }
}

class _$ServiceModule extends _i102.ServiceModule {}
