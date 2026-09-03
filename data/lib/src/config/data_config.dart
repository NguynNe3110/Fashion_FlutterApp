import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../di/di.dart' as di;

class DataConfig extends Config {
  DataConfig._();

  factory DataConfig.getInstance() {
    return _instance;
  }

  static final DataConfig _instance = DataConfig._();

  @override
  // Future<void> config() async => di.configureInjection();

  Future<void> config() async {
    final supabaseConstants = SupabaseConstants();
    supabaseConstants.validate();

    await Supabase.initialize(
      url: supabaseConstants.supabaseUrl,
      publishableKey: supabaseConstants.supabasePublisableKey,
    );

    di.configureInjection();
  }
}
