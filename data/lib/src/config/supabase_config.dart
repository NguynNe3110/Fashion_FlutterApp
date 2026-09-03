//cũng có thể tách ra như sau

// import 'package:shared/shared.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// import '../di/di.dart' as di;
//
// class SupabaseConfig extends Config {
//   SupabaseConfig._();
//
//   factory SupabaseConfig.getInstance() {
//     return _instance;
//   }
//
//   static final SupabaseConfig _instance = SupabaseConfig._();
//
//   @override
//   Future<void> config() async{
//     final supabaseConstants = SupabaseConstants();
//     supabaseConstants.validate();
//
//     await Supabase.initialize(
//       url: supabaseConstants.supabaseUrl,
//       publishableKey: supabaseConstants.supabasePublisableKey,
//     );
//
//     di.configureInjection();
//   }
// }