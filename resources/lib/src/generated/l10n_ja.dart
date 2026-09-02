// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class SJa extends S {
  SJa([String locale = 'ja']) : super(locale);

  @override
  String get login => 'ログイン';

  @override
  String get fakeLogin => 'Fake Login';

  @override
  String get logout => 'ログアウト';

  @override
  String get email => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String unknownException(Object errorCode) {
    return 'unknownException ($errorCode)';
  }

  @override
  String get parseException => 'parseException';

  @override
  String get cancellationException => 'cancellationException';

  @override
  String get noInternetException => 'noInternetException';

  @override
  String get timeoutException => 'timeoutException';

  @override
  String get badCertificateException => 'badCertificateException';

  @override
  String get canNotConnectToHost => 'Can not connect to this host';

  @override
  String get tokenExpired => 'tokenExpired';

  @override
  String get emptyEmail => 'emptyEmail';

  @override
  String get invalidEmail => 'invalidEmail';

  @override
  String get invalidPassword => 'invalidPassword';

  @override
  String get invalidUserName => 'invalidUserName';

  @override
  String get invalidPhoneNumber => 'invalidPhoneNumber';

  @override
  String get invalidDateTime => 'invalidDateTime';

  @override
  String get passwordsAreNotMatch => 'passwordsAreNotMatch';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get retry => 'リトライ';

  @override
  String get close => '近い';

  @override
  String get search => '探す';

  @override
  String get myPage => 'マイページ';

  @override
  String get home => 'ホームページ';

  @override
  String get darkTheme => '暗いテーマ';

  @override
  String get japanese => '日本語';
}
