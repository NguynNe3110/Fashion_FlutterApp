// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get fakeLogin => 'Fake Login';

  @override
  String get logout => 'Logout';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

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
  String get cancel => 'Cancel';

  @override
  String get retry => 'Retry';

  @override
  String get close => 'Close';

  @override
  String get search => 'Search';

  @override
  String get myPage => 'My Page';

  @override
  String get home => 'Home';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get japanese => 'Japanese';
}
