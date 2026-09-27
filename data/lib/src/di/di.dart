import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../objectbox.g.dart';

import 'di.config.dart';

@module
abstract class ServiceModule {
  // khoi tao supabase client
  @singleton
  SupabaseClient get supabaseClient => Supabase.instance.client; //sup

  @preResolve // chờ await xong
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance(); // preference

  @preResolve
  Future<FlutterSecureStorage> get secureStorage async { // SecureStorage
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @preResolve
  Future<Store> getStore() async { //objectBox
    final dir = await getApplicationDocumentsDirectory();

    return Store(
      getObjectBoxModel(),
      directory: '${dir.path}/${DatabaseConstants.databaseName}',
    );
  }
}

final GetIt getIt = GetIt.instance;

@injectableInit // tạo ra file config.dart
void configureInjection() => getIt.init();
