// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(errorCode) => "unknownException (${errorCode})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "badCertificateException": MessageLookupByLibrary.simpleMessage(
      "badCertificateException",
    ),
    "canNotConnectToHost": MessageLookupByLibrary.simpleMessage(
      "Can not connect to this host",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancellationException": MessageLookupByLibrary.simpleMessage(
      "cancellationException",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Dark Theme"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emptyEmail": MessageLookupByLibrary.simpleMessage("emptyEmail"),
    "fakeLogin": MessageLookupByLibrary.simpleMessage("Fake Login"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "invalidDateTime": MessageLookupByLibrary.simpleMessage("invalidDateTime"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage("invalidEmail"),
    "invalidPassword": MessageLookupByLibrary.simpleMessage("invalidPassword"),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "invalidPhoneNumber",
    ),
    "invalidUserName": MessageLookupByLibrary.simpleMessage("invalidUserName"),
    "japanese": MessageLookupByLibrary.simpleMessage("Japanese"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "myPage": MessageLookupByLibrary.simpleMessage("My Page"),
    "noInternetException": MessageLookupByLibrary.simpleMessage(
      "noInternetException",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "parseException": MessageLookupByLibrary.simpleMessage("parseException"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordsAreNotMatch": MessageLookupByLibrary.simpleMessage(
      "passwordsAreNotMatch",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "timeoutException": MessageLookupByLibrary.simpleMessage(
      "timeoutException",
    ),
    "tokenExpired": MessageLookupByLibrary.simpleMessage("tokenExpired"),
    "unknownException": m0,
  };
}
