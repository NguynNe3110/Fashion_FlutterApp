

import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConstants {

  String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  String get supabasePublisableKey => dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? ''; //Anon is PUBLISHABLE. (older -> new)

  // static final String baseUrl = dotenv.env['SUPABASE_URL'] ?? "";
  // static final String apiKey = dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? "";

  void validate() {
    if(supabaseUrl.isEmpty || supabasePublisableKey.isEmpty) {
      throw Exception(
          'Missing Supabase environment variables. Check again!'
      );
    }
  }
}