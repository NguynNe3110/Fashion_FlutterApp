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
import 'package:data/src/repository/address_repository_impl.dart' as _i938;
import 'package:data/src/repository/cart_item_repository_impl.dart' as _i23;
import 'package:data/src/repository/category_repository_impl.dart' as _i942;
import 'package:data/src/repository/favorite_repository_impl.dart' as _i495;
import 'package:data/src/repository/order_item_repository_impl.dart' as _i131;
import 'package:data/src/repository/order_repository_impl.dart' as _i677;
import 'package:data/src/repository/product_image_repository_impl.dart'
    as _i537;
import 'package:data/src/repository/product_repository_impl.dart' as _i118;
import 'package:data/src/repository/repository_impl.dart' as _i1013;
import 'package:data/src/repository/review_repository_impl.dart' as _i538;
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
import 'package:data/src/repository/source/supabase/mapper/address_mapper.dart'
    as _i111;
import 'package:data/src/repository/source/supabase/mapper/cart_item_mapper.dart'
    as _i49;
import 'package:data/src/repository/source/supabase/mapper/favorite_mapper.dart'
    as _i958;
import 'package:data/src/repository/source/supabase/mapper/order_item_mapper.dart'
    as _i444;
import 'package:data/src/repository/source/supabase/mapper/order_mapper.dart'
    as _i330;
import 'package:data/src/repository/source/supabase/mapper/product_image_mapper.dart'
    as _i844;
import 'package:data/src/repository/source/supabase/mapper/product_mapper.dart'
    as _i901;
import 'package:data/src/repository/source/supabase/mapper/product_variant_mapper.dart'
    as _i438;
import 'package:data/src/repository/source/supabase/mapper/profile_mapper.dart'
    as _i733;
import 'package:data/src/repository/source/supabase/mapper/review_mapper.dart'
    as _i166;
import 'package:data/src/repository/source/supabase/service/address_supabase_service.dart'
    as _i641;
import 'package:data/src/repository/source/supabase/service/cart_item_supabase_service.dart'
    as _i1039;
import 'package:data/src/repository/source/supabase/service/category_supabase_service.dart'
    as _i551;
import 'package:data/src/repository/source/supabase/service/favorite_supabase_service.dart'
    as _i923;
import 'package:data/src/repository/source/supabase/service/order_item_supabase_service.dart'
    as _i1045;
import 'package:data/src/repository/source/supabase/service/order_supabase_service.dart'
    as _i784;
import 'package:data/src/repository/source/supabase/service/product_image_supabase_service.dart'
    as _i363;
import 'package:data/src/repository/source/supabase/service/product_supabase_service.dart'
    as _i988;
import 'package:data/src/repository/source/supabase/service/profile_supabase_service.dart'
    as _i369;
import 'package:data/src/repository/source/supabase/service/review_supabase_service.dart'
    as _i351;
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
    gh.factory<_i111.AddressMapper>(() => _i111.AddressMapper());
    gh.factory<_i49.CartItemMapper>(() => _i49.CartItemMapper());
    gh.factory<_i958.FavoriteMapper>(() => _i958.FavoriteMapper());
    gh.factory<_i444.OrderItemMapper>(() => _i444.OrderItemMapper());
    gh.factory<_i330.OrderMapper>(() => _i330.OrderMapper());
    gh.factory<_i844.ProductImageMapper>(() => _i844.ProductImageMapper());
    gh.factory<_i438.ProductVariantMapper>(() => _i438.ProductVariantMapper());
    gh.factory<_i733.ProfileMapper>(() => _i733.ProfileMapper());
    gh.factory<_i166.ReviewMapper>(() => _i166.ReviewMapper());
    gh.singleton<_i454.SupabaseClient>(() => serviceModule.supabaseClient);
    gh.lazySingleton<_i522.RandomUserApiClient>(
      () => _i522.RandomUserApiClient(),
    );
    gh.lazySingleton<_i324.RawApiClient>(() => _i324.RawApiClient());
    gh.lazySingleton<_i905.AppDatabase>(
      () => _i905.AppDatabase(gh<_i1034.Store>()),
    );
    gh.factory<_i901.ProductMapper>(
      () => _i901.ProductMapper(gh<_i437.ProductVariantMapper>()),
    );
    gh.lazySingleton<_i988.ProductSupabaseService>(
      () => _i988.ProductSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i641.AddressSupabaseService>(
      () => _i641.AddressSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i1039.CartItemSupabaseService>(
      () => _i1039.CartItemSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i551.CategorySupabaseService>(
      () => _i551.CategorySupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i923.FavoriteSupabaseService>(
      () => _i923.FavoriteSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i1045.OrderItemSupabaseService>(
      () => _i1045.OrderItemSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i784.OrderSupabaseService>(
      () => _i784.OrderSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i363.ProductImageSupabaseService>(
      () => _i363.ProductImageSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i369.ProfileSupabaseService>(
      () => _i369.ProfileSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i351.ReviewSupabaseService>(
      () => _i351.ReviewSupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i494.OrderItemRepository>(
      () => _i131.OrderItemRepositoryImpl(
        gh<_i437.OrderItemMapper>(),
        gh<_i437.OrderItemSupabaseService>(),
      ),
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
    gh.lazySingleton<_i494.AddressRepository>(
      () => _i938.AddressRepositoryImpl(
        gh<_i437.AddressMapper>(),
        gh<_i437.AddressSupabaseService>(),
      ),
    );
    gh.lazySingleton<_i494.ReviewRepository>(
      () => _i538.ReviewRepositoryImpl(
        gh<_i437.ReviewMapper>(),
        gh<_i437.ReviewSupabaseService>(),
      ),
    );
    gh.lazySingleton<_i494.OrderRepository>(
      () => _i677.OrderRepositoryImpl(
        gh<_i437.OrderMapper>(),
        gh<_i437.OrderSupabaseService>(),
      ),
    );
    gh.lazySingleton<_i494.FavoriteRepository>(
      () => _i495.FavoriteRepositoryImpl(
        gh<_i437.FavoriteMapper>(),
        gh<_i437.FavoriteSupabaseService>(),
      ),
    );
    gh.lazySingleton<_i494.CategoryRepository>(
      () => _i942.CategoryRepositoryImpl(
        gh<_i437.CategoryMapper>(),
        gh<_i437.CategorySupabaseService>(),
      ),
    );
    gh.factory<_i511.AccessTokenInterceptor>(
      () => _i511.AccessTokenInterceptor(gh<_i437.AppPreferences>()),
    );
    gh.lazySingleton<_i756.NoneAuthAppServerApiClient>(
      () => _i756.NoneAuthAppServerApiClient(gh<_i437.HeaderInterceptor>()),
    );
    gh.lazySingleton<_i494.CartItemRepository>(
      () => _i23.CartItemRepositoryImpl(
        gh<_i437.CartItemMapper>(),
        gh<_i437.CartItemSupabaseService>(),
      ),
    );
    gh.lazySingleton<_i494.ProductRepository>(
      () => _i118.ProductRepositoryImpl(
        gh<_i437.ProductSupabaseService>(),
        gh<_i437.ProductMapper>(),
      ),
    );
    gh.lazySingleton<_i762.RefreshTokenApiClient>(
      () => _i762.RefreshTokenApiClient(
        gh<_i437.HeaderInterceptor>(),
        gh<_i437.AccessTokenInterceptor>(),
      ),
    );
    gh.lazySingleton<_i494.ProductImageRepository>(
      () => _i537.ProductImageRepositoryImpl(
        gh<_i437.ProductImageMapper>(),
        gh<_i437.ProductImageSupabaseService>(),
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
