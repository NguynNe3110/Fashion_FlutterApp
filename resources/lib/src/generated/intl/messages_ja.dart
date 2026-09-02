// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(errorCode) => "unknownException (${errorCode})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "badCertificateException": MessageLookupByLibrary.simpleMessage(
      "badCertificateException",
    ),
    "canNotConnectToHost": MessageLookupByLibrary.simpleMessage(
      "Can not connect to this host",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "cancellationException": MessageLookupByLibrary.simpleMessage(
      "cancellationException",
    ),
    "close": MessageLookupByLibrary.simpleMessage("近い"),
    "darkTheme": MessageLookupByLibrary.simpleMessage("暗いテーマ"),
    "email": MessageLookupByLibrary.simpleMessage("メールアドレス"),
    "emptyEmail": MessageLookupByLibrary.simpleMessage("emptyEmail"),
    "fakeLogin": MessageLookupByLibrary.simpleMessage("Fake Login"),
    "home": MessageLookupByLibrary.simpleMessage("ホームページ"),
    "invalidDateTime": MessageLookupByLibrary.simpleMessage("invalidDateTime"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage("invalidEmail"),
    "invalidPassword": MessageLookupByLibrary.simpleMessage("invalidPassword"),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "invalidPhoneNumber",
    ),
    "invalidUserName": MessageLookupByLibrary.simpleMessage("invalidUserName"),
    "japanese": MessageLookupByLibrary.simpleMessage("日本語"),
    "login": MessageLookupByLibrary.simpleMessage("ログイン"),
    "logout": MessageLookupByLibrary.simpleMessage("ログアウト"),
    "myPage": MessageLookupByLibrary.simpleMessage("マイページ"),
    "noInternetException": MessageLookupByLibrary.simpleMessage(
      "noInternetException",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "parseException": MessageLookupByLibrary.simpleMessage("parseException"),
    "password": MessageLookupByLibrary.simpleMessage("パスワード"),
    "passwordsAreNotMatch": MessageLookupByLibrary.simpleMessage(
      "passwordsAreNotMatch",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("リトライ"),
    "search": MessageLookupByLibrary.simpleMessage("探す"),
    "timeoutException": MessageLookupByLibrary.simpleMessage(
      "timeoutException",
    ),
    "tokenExpired": MessageLookupByLibrary.simpleMessage("tokenExpired"),
    "unknownException": m0,
  };
}
