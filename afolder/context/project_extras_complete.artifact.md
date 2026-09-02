# 📦 PROJECT EXTRAS - CHI TIẾT TỪNG FILE

> **Scope**: Chỉ cover các packages KHÔNG PHẢI domain, data, app. Các packages: `shared`, `initializer`, `resources`, `nals_lints`

---

## MỤC LỤC

1. [initializer](#1-initializer)
2. [shared/src](#2-sharedsrc)
3. [resources](#3-resources)
4. [nals_lints](#4-nals_lints)

---

# 1. INITIALIZER

## 1.1 Cấu Trúc

```
initializer/lib/
├── src/
│   └── app_initializer.dart       ← Orchestrate app startup
└── initializer.dart              ← Export file
```

## 1.2 File Chi Tiết

### `initializer/lib/src/app_initializer.dart`

**Tác dụng**: Điều phối thứ tự khởi tạo các packages khi app start.

**Code**:
```dart
abstract class ApplicationConfig extends Config {}

class AppInitializer {
  AppInitializer(this._applicationConfig);
  final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    // 1. Load environment variables từ build args
    EnvConstants.init();

    // 2. Init shared: preferences, logging config
    await SharedConfig.getInstance().init();

    // 3. Init data: Dio, Database, Preferences
    await DataConfig.getInstance().init();

    // 4. Init domain: UseCase dependencies
    await DomainConfig.getInstance().init();

    // 5. Init app-specific config
    await _applicationConfig.init();
  }
}
```

**Tại sao cần**: Đảm bảo thứ tự khởi tạo đúng - shared trước, rồi data, rồi domain, cuối cùng là app.

**Sử dụng ở đâu**: `main.dart` gọi `AppInitializer().init()` trước `runApp()`.

---

# 2. SHARED/SRC

## 2.1 Cấu Trúc Tổng Quan

```
shared/lib/src/
├── di/                              ← Dependency Injection setup
│   └── di.dart
├── config/                          ← Configuration classes
│   ├── config.dart
│   ├── log_config.dart
│   └── shared_config.dart
├── constants/                       ← Constants groups
│   ├── env_constants.dart
│   ├── url_constants.dart
│   ├── database_constants.dart
│   ├── duration_constants.dart
│   ├── symbol_constants.dart
│   ├── shared_preference_constants.dart
│   ├── locale_constants.dart
│   ├── uni_links_constants.dart
│   ├── ui/
│   │   ├── ui_constants.dart
│   │   ├── device_constants.dart
│   │   └── paging_constants.dart
│   ├── format/
│   └── server/
├── helper/                          ← Helper classes
│   ├── stream/
│   │   ├── dispose_bag.dart
│   │   ├── disposable.dart
│   │   └── stream_logger.dart
│   ├── function/
│   │   └── function.dart
│   ├── run_catching/
│   └── app_info.dart
├── exception/                       ← Exception classes
│   ├── app_exception.dart
│   ├── remote_exception.dart
│   ├── validation_exception.dart
│   ├── uncaught_exception.dart
│   └── app_exception_wrapper.dart
├── mixin/                           ← Mixins
│   └── log_mixin.dart
├── model/                           ← Shared models
│   ├── big_decimal.dart
│   ├── shared_enum.dart
│   └── typedef.dart
└── utils/                           ← Utility classes (13 files)
    ├── log_utils.dart
    ├── num_utils.dart
    ├── file_utils.dart
    ├── view_utils.dart
    ├── parse_utils.dart
    ├── device_utils.dart
    ├── intent_utils.dart
    ├── object_utils.dart
    ├── string_utils.dart
    ├── date_time_utils.dart
    ├── collection_utils.dart
    ├── validation_utils.dart
    └── number_format_utils.dart
```

---

## 2.2 DI - Dependency Injection

### `shared/lib/src/di/di.dart`

**Tác dụng**: Setup GetIt + Injectable để quản lý dependencies toàn app.

**Code**:
```dart
final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
```

**Cách hoạt động**:
- `getIt` là global instance của GetIt
- `@injectableInit` annotation tự động sinh code đăng ký dependencies
- Mỗi package (data, domain, app) gọi `configureInjection()` trong Config của mình

---

## 2.3 CONFIG - Configuration Classes

### `shared/lib/src/config/config.dart`

**Tác dụng**: Abstract base class cho tất cả Config classes.

**Code**:
```dart
abstract class Config {
  Future<void> config() async {}
}
```

### `shared/lib/src/config/log_config.dart`

**Tác dụng**: Kiểm soát logging trong Debug vs Production mode.

**Chi tiết từng flag**:

| Flag | Default | Mục đích |
|------|---------|----------|
| `enableGeneralLog` | `kDebugMode` | Bật/tắt logging toàn cục |
| `isPrettyJson` | `kDebugMode` | JSON output format đẹp |
| `logOnBlocEvent` | `kDebugMode` | Log BLoC events |
| `enableNavigatorObserverLog` | `kDebugMode` | Log navigation |
| `enableLogInterceptor` | `kDebugMode` | Log HTTP requests |
| `enableLogUseCaseInput` | `kDebugMode` | Log UseCase inputs |
| `logOnBlocChange` | `false` | Log state changes |
| `logOnBlocCreate` | `false` | Log BLoC creation |
| `logOnDisposeBagLog` | `false` | Log dispose actions |

**Code đầy đủ**:
```dart
class LogConfig {
  const LogConfig._();

  // General
  static const enableGeneralLog = kDebugMode;
  static const isPrettyJson = kDebugMode;

  // BLoC Observer - debug only
  static const logOnBlocEvent = kDebugMode;
  static const logOnBlocChange = false;
  static const logOnBlocCreate = false;
  static const logOnBlocClose = false;
  static const logOnBlocError = false;
  static const logOnBlocTransition = false;

  // Navigator
  static const enableNavigatorObserverLog = kDebugMode;

  // DisposeBag
  static const enableDisposeBagLog = false;

  // Streams
  static const logOnStreamListen = false;
  static const logOnStreamData = false;
  static const logOnStreamError = false;
  static const logOnStreamDone = false;
  static const logOnStreamCancel = false;

  // HTTP Interceptor
  static const enableLogInterceptor = kDebugMode;
  static const enableLogRequestInfo = kDebugMode;
  static const enableLogSuccessResponse = kDebugMode;
  static const enableLogErrorResponse = kDebugMode;

  // UseCase
  static const enableLogUseCaseInput = kDebugMode;
  static const enableLogUseCaseOutput = kDebugMode;
  static const enableLogUseCaseError = kDebugMode;
}
```

### `shared/lib/src/config/shared_config.dart`

**Tác dụng**: Singleton config cho shared package.

**Code**:
```dart
class SharedConfig extends Config {
  factory SharedConfig.getInstance() => _instance;
  static final SharedConfig _instance = SharedConfig._();

  @override
  Future<void> config() async {
    // Init SharedPreferences
    await SharedPreferences.getInstance();

    // Setup shared dependencies
  }
}
```

---

## 2.4 CONSTANTS - Hằng Số

### `shared/lib/src/constants/env_constants.dart`

**Tác dụng**: Đọc environment variables từ build arguments.

**Code**:
```dart
class EnvConstants {
  const EnvConstants._();

  static const flavorKey = 'FLAVOR';
  static const appBasicAuthNameKey = 'APP_BASIC_AUTH_NAME';
  static const appBasicAuthPasswordKey = 'APP_BASIC_AUTH_PASSWORD';

  // Đọc từ --dart-define trong build
  static late Flavor flavor =
      Flavor.values.byName(const String.fromEnvironment(flavorKey, defaultValue: 'develop'));
  static late String appBasicAuthName = const String.fromEnvironment(appBasicAuthNameKey);
  static late String appBasicAuthPassword = const String.fromEnvironment(appBasicAuthPasswordKey);

  static void init() {
    Log.d(flavor, name: flavorKey);
    Log.d(appBasicAuthName, name: appBasicAuthNameKey);
    Log.d(appBasicAuthPassword, name: appBasicAuthPasswordKey);
  }
}
```

**Sử dụng**: Build với `--dart-define=FLAVOR=production`

### `shared/lib/src/constants/duration_constants.dart`

**Tác dụng**: Tập trung các Duration values dùng chung.

**Code**:
```dart
class DurationConstants {
  const DurationConstants._();

  static const defaultListGridTransitionDuration = Duration(milliseconds: 500);
  static const defaultEventTransfomDuration = Duration(milliseconds: 500);
  static const defaultGeneralDialogTransitionDuration = Duration(milliseconds: 200);
  static const defaultSnackBarDuration = Duration(seconds: 3);
  static const defaultErrorVisibleDuration = Duration(seconds: 3);
}
```

### `shared/lib/src/constants/shared_preference_constants.dart`

**Tác dụng**: Keys cho SharedPreferences.

**Code**:
```dart
class SharedPreferenceKeys {
  const SharedPreferenceKeys._();

  // Normal preferences
  static const isDarkMode = 'is_dark_mode';
  static const deviceToken = 'device_token';
  static const languageCode = 'language_code';
  static const isFirstLogin = 'is_first_login';
  static const isFirstLaunchApp = 'is_first_launch_app';
  static const currentUser = 'current_user';

  // Secure storage (encrypted)
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';
}
```

### `shared/lib/src/constants/url_constants.dart`

**Tác dụng**: URLs cho API endpoints.

### `shared/lib/src/constants/database_constants.dart`

**Tác dụng**: Database configuration constants.

### `shared/lib/src/constants/symbol_constants.dart`

**Tác dụng**: Symbol/character constants.

### `shared/lib/src/constants/locale_constants.dart`

**Tác dụng**: Locale/language codes.

### `shared/lib/src/constants/uni_links_constants.dart`

**Tác dụng**: Universal links/deep links constants.

---

### `shared/lib/src/constants/ui/ui_constants.dart`

**Tác dụng**: UI-related constants.

**Code**:
```dart
class UiConstants {
  const UiConstants._();

  // Shimmer
  static const shimmerItemCount = 20;

  // Material App
  static const materialAppTitle = 'My App';
  static const taskMenuMaterialAppColor = Color.fromARGB(255, 153, 154, 251);

  // Orientation
  static const mobileOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  static const tabletOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  // Status bar
  static const systemUiOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Color.fromARGB(255, 153, 154, 251),
  );

  static const textFieldTextStyleHeight = 1.3;
}
```

### `shared/lib/src/constants/ui/device_constants.dart`

**Tác dụng**: Device-specific constants.

### `shared/lib/src/constants/ui/paging_constants.dart`

**Tác dụng**: Pagination constants.

---

## 2.5 HELPER - Helper Classes

### `shared/lib/src/helper/stream/dispose_bag.dart`

**Tác dụng**: Tự động cleanup resources (subscriptions, controllers) khi BLoC close.

**Chi tiết**:

```dart
class DisposeBag with LogMixin {
  final List<Object> _disposable = [];

  void addDisposable(Object disposable) {
    _disposable.add(disposable);
  }

  void dispose() {
    _disposable.forEach((disposable) {
      if (disposable is StreamSubscription) {
        disposable.cancel();
        if (_enableLogging) logD('Canceled $disposable');
      } else if (disposable is StreamController) {
        disposable.close();
      } else if (disposable is ChangeNotifier) {
        disposable.dispose();
      } else if (disposable is Disposable) {
        disposable.dispose();
      }
    });
    _disposable.clear();
  }
}

// Extensions cho convenient usage
extension StreamSubscriptionExtensions<T> on StreamSubscription<T> {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension StreamControllerExtensions<T> on StreamController<T> {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension ChangeNotifierExtensions on ChangeNotifier {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension DisposableExtensions on Disposable {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}
```

**Sử dụng trong BLoC**:
```dart
class MyBloc extends BaseBloc<MyEvent, MyState> {
  MyBloc(this._repository) : super(const MyState()) {
    _subscription = _repository.getStream()
      .listen((data) => emit(state.copyWith(data: data)))
      .disposedBy(disposeBag);
  }

  final _repository;
  final _disposeBag = DisposeBag();
  StreamSubscription? _subscription;

  @override
  Future<void> close() {
    _disposeBag.dispose();  // Auto cleanup
    return super.close();
  }
}
```

### `shared/lib/src/helper/stream/disposable.dart`

**Tác dụng**: Interface cho các class cần dispose.

**Code**:
```dart
abstract class Disposable {
  void dispose();
}
```

### `shared/lib/src/helper/stream/stream_logger.dart`

**Tác dụng**: Log stream events cho debugging.

**Code**:
```dart
extension StreamExt<T> on Stream<T> {
  Stream<T> log(
    String name, {
    bool logOnListen = false,
    bool logOnData = false,
    bool logOnError = false,
    bool logOnDone = false,
    bool logOnCancel = false,
  }) {
    return doOnListen(() {
      if (LogConfig.logOnStreamListen && logOnListen) {
        Log.d('▶️ onSubscribed', time: DateTime.now(), name: name);
      }
    }).doOnData((event) {
      if (LogConfig.logOnStreamData && logOnData) {
        Log.d('🟢 onEvent: $event', time: DateTime.now(), name: name);
      }
    }).doOnCancel(() {
      if (LogConfig.logOnStreamCancel && logOnCancel) {
        Log.d('🟡 onCanceled', time: DateTime.now(), name: name);
      }
    }).doOnError((e, _) {
      if (LogConfig.logOnStreamError && logOnError) {
        Log.e('🔴 onError $e', time: DateTime.now(), name: name);
      }
    }).doOnDone(() {
      if (LogConfig.logOnStreamDone && logOnDone) {
        Log.d('☑️️ onCompleted', time: DateTime.now(), name: name);
      }
    });
  }
}
```

**Sử dụng**:
```dart
Stream<int> stream = Stream.fromIterable([1, 2, 3])
  .log('myStream', logOnData: true);
```

### `shared/lib/src/helper/function/function.dart`

**Tác dụng**: Type-safe function references cho callbacks.

**Chi tiết từng class**:

| Class | Tham số | Return | Ví dụ |
|-------|---------|--------|-------|
| `Func0<R>` | 0 | R | `() => print("hi")` |
| `Func1<P0, R>` | 1 | R | `(name) => print(name)` |
| `Func2<P0, P1, R>` | 2 | R | `(a, b) => a + b` |
| `Func3<P0, P1, P2, R>` | 3 | R | - |
| `Func4<P0, P1, P2, P3, R>` | 4 | R | - |
| `Func5<P0, P1, P2, P3, P4, R>` | 5 | R | - |

**Code mẫu**:
```dart
class Func0<R> {
  Func0(this.function);
  final R Function() function;

  @override
  int get hashCode => 0;  // Always equal (for comparison)

  R call() => function.call();

  @override
  bool operator ==(Object other) => true;
}
```

**Sử dụng thay thế**:
```dart
// Thay vì
void showSnackBar({Function()? onDismiss});

// Dùng
void showSnackBar({Func0<void>? onDismiss});

onDismiss?.call();  // Type-safe
```

### `shared/lib/src/helper/app_info.dart`

**Tác dụng**: Lấy thông tin app (version, build number, etc).

---

## 2.6 EXCEPTION - Exception Classes

### `shared/lib/src/exception/app_exception.dart`

**Tác dụng**: Base class cho tất cả exceptions trong app.

### `shared/lib/src/exception/remote_exception.dart`

**Tác dụng**: Exception cho HTTP/API errors.

**Code**:
```dart
enum RemoteExceptionKind {
  badCertificate,
  noInternet,
  network,
  serverDefined,
  serverUndefined,
  timeout,
  cancellation,
  unknown,
  refreshTokenFailed,
  decodeError,
}

class RemoteException extends AppException {
  const RemoteException({
    required this.kind,
    this.generalServerMessage,
  });

  final RemoteExceptionKind kind;
  final String? generalServerMessage;
}
```

### `shared/lib/src/exception/validation_exception.dart`

**Tác dụng**: Exception cho validation errors.

**Code**:
```dart
enum ValidationExceptionKind {
  emptyEmail,
  invalidEmail,
  invalidPassword,
  invalidUserName,
  invalidPhoneNumber,
  invalidDateTime,
  passwordsAreNotMatch,
}

class ValidationException extends AppException {
  const ValidationException(this.kind);
  final ValidationExceptionKind kind;
}
```

### `shared/lib/src/exception/uncaught_exception.dart`

**Tác dụng**: Exception cho uncaught errors.

### `shared/lib/src/exception/app_exception_wrapper.dart`

**Tác dụng**: Wrapper chứa exception + retry action.

**Code**:
```dart
class AppExceptionWrapper {
  const AppExceptionWrapper({
    required this.appException,
    this.overrideMessage,
    this.doOnRetry,
  });

  final AppException appException;
  final String? overrideMessage;
  final VoidCallback? doOnRetry;
}
```

---

## 2.7 MIXIN - Mixins

### `shared/lib/src/mixin/log_mixin.dart`

**Tác dụng**: Mixin cung cấp logging methods cho các class.

**Code**:
```dart
mixin LogMixin on Object {
  void logD(String message, {DateTime? time}) {
    Log.d(message, name: runtimeType.toString(), time: time);
  }

  void logE(
    Object? errorMessage, {
    Object? clazz,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    Log.e(
      errorMessage,
      name: runtimeType.toString(),
      errorObject: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }
}
```

**Sử dụng**:
```dart
class MyService with LogMixin {
  void doSomething() {
    logD('Starting...');      // Log.d với tên class tự động
    try {
      // ...
    } catch (e, st) {
      logE('Error', errorObject: e, stackTrace: st);
    }
  }
}
```

---

## 2.8 MODEL - Shared Models

### `shared/lib/src/model/big_decimal.dart`

**Tác dụng**: Xử lý số thập phân chính xác (tránh floating point errors).

**Vấn đề**:
```dart
// Floating point error
var a = 0.1;
var b = 0.2;
print(a + b);  // 0.30000000000000004 ❌

// BigDecimal - chính xác
var a = BigDecimal.parse('0.1');
var b = BigDecimal.parse('0.2');
print(a + b);   // 0.3 ✅
```

**API đầy đủ**:

| Method/Operator | Mô tả |
|-----------------|-------|
| `parse(String)` | Parse từ string |
| `fromInt(int)` | Tạo từ int |
| `zero` | Constant 0 |
| `+`, `-`, `*`, `/`, `%` | Operators |
| `abs()`, `floor()`, `ceil()`, `round()` | Math methods |
| `pow(int)` | Power |
| `toDouble()` | Convert sang double |
| `toStringAsFixed(int)` | Format decimal |
| `compareTo()` | So sánh |

### `shared/lib/src/model/shared_enum.dart`

**Tác dụng**: Enums dùng chung.

**Code**:
```dart
enum Flavor { develop, qa, staging, production }

enum DeviceType { mobile, tablet }
```

### `shared/lib/src/model/typedef.dart`

**Tác dụng**: Type definitions dùng chung.

---

## 2.9 UTILS - Utility Classes (13 files)

### `shared/lib/src/utils/log_utils.dart`

**Tác dụng**: Logging utilities.

### `shared/lib/src/utils/num_utils.dart`

**Tác dụng**: Number extensions.

**Code**:
```dart
extension NumExtensions on num {
  num plus(num other) => this + other;
  num minus(num other) => this - other;
  num times(num other) => this * other;
  num div(num other) => this / other;
}

extension IntExtensions on int {
  int plus(int other) => this + other;
  int minus(int other) => this - other;
  int times(int other) => this * other;
  double div(int other) => this / other;
  int truncateDiv(int other) => this ~/ other;
}

extension DoubleExtensions on double {
  // ... tương tự
}
```

### `shared/lib/src/utils/file_utils.dart`

**Tác dụng**: File operations utilities.

### `shared/lib/src/utils/view_utils.dart`

**Tác dụng**: UI/View utilities.

### `shared/lib/src/utils/parse_utils.dart`

**Tác dụng**: Parse utilities (JSON, etc).

### `shared/lib/src/utils/device_utils.dart`

**Tác dụng**: Device detection utilities.

### `shared/lib/src/utils/intent_utils.dart`

**Tác dụng**: Intent/Action utilities.

### `shared/lib/src/utils/object_utils.dart`

**Tác dụng**: Object/null safety utilities.

**Code**:
```dart
T run<T>(T Function() block) {
  return block();
}

extension ObjectUtils<T> on T? {
  R? safeCast<R>() {
    final that = this;
    if (that is R) {
      return that;
    }
    Log.e('Error: safeCast: $this is not $R');
    return null;
  }

  R? let<R>(R Function(T)? cb) {
    if (this == null) return null;
    return cb?.call(this as T);
  }
}

T? safeCast<T>(dynamic value) {
  if (value is T) return value;
  Log.e('Error: safeCast: $value is not $T');
  return null;
}
```

### `shared/lib/src/utils/string_utils.dart`

**Tác dụng**: String extensions.

**Code**:
```dart
extension StringExtensions on String {
  String plus(String other) => this + other;

  bool equalsIgnoreCase(String secondString) =>
      toLowerCase().contains(secondString.toLowerCase());
}
```

### `shared/lib/src/utils/date_time_utils.dart`

**Tác dụng**: DateTime manipulation utilities.

**Code**:
```dart
class DateTimeUtils {
  DateTimeUtils._();

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static int timezoneOffset() {
    return DateTime.now().timeZoneOffset.inHours;
  }

  static DateTime toLocalFromTimestamp({required int utcTimestampMillis}) {
    return DateTime.fromMillisecondsSinceEpoch(
      utcTimestampMillis,
      isUtc: true,
    ).toLocal();
  }

  static DateTime toUtcFromTimestamp(int localTimestampMillis) {
    return DateTime.fromMillisecondsSinceEpoch(
      localTimestampMillis,
      isUtc: false,
    ).toUtc();
  }

  static DateTime startTimeOfDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime? toDateTime(String dateTimeString, {bool isUtc = false}) {
    final dateTime = DateTime.tryParse(dateTimeString);
    if (dateTime != null) {
      if (isUtc) {
        return DateTime.utc(/* ... */);
      }
    }
    return dateTime;
  }
}
```

### `shared/lib/src/utils/collection_utils.dart`

**Tác dụng**: Collection/List extensions.

**Code**:
```dart
extension NullableListExtensions<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension ListExtensions<T> on List<T> {
  List<T> appendOrExceptElement(T item) {
    return contains(item)
        ? exceptElement(item).toList(growable: false)
        : appendElement(item).toList(growable: false);
  }

  List<T> plus(T element) => appendElement(element).toList(growable: false);
  List<T> minus(T element) => exceptElement(item).toList(growable: false);
  List<T> plusAll(List<T> elements) => append(elements).toList(growable: false);
  List<T> minusAll(List<T> elements) => except(elements).toList(growable: false);
}

extension SetExtensions<T> on Set<T> {
  // Tương tự cho Set
}
```

### `shared/lib/src/utils/validation_utils.dart`

**Tác dụng**: Validation functions.

**Code**:
```dart
class ValidationUtils {
  const ValidationUtils._();

  static bool isValidPassword(String password) => password.isNotEmpty;

  static bool isEmptyPhoneNumber(String phoneNumber) => phoneNumber.isNotEmpty;

  static bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,11}$)')
        .hasMatch(phoneNumber.trim());
  }

  static bool isEmptyEmail(String email) => email.isNotEmpty;

  static bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
        .hasMatch(email.trim());
  }

  static bool isValidDateTime(String dateTime) {
    return RegExp(/* date pattern */).hasMatch(dateTime);
  }

  static bool isAlphanumeric(String text) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text.trim());
  }

  static bool isLink(String text) => Uri.parse(text).isAbsolute;
}
```

### `shared/lib/src/utils/number_format_utils.dart`

**Tác dụng**: Number formatting utilities.

---

# 3. RESOURCES

## 3.1 Cấu Trúc

```
resources/lib/
├── src/
│   └── l10n/                    ← Localization files
│       ├── intl_en.arb          ← English
│       └── intl_ja.arb          ← Japanese
└── resources.dart               ← Export file
```

## 3.2 File Chi Tiết

### `resources/lib/src/l10n/intl_en.arb`

**Tác dụng**: English translations cho app.

**Format**: ARB (Application Resource Bundle) - JSON format cho Flutter i18n.

**Code đầy đủ**:
```json
{
  "login": "Login",
  "fakeLogin": "Fake Login",
  "logout": "Logout",
  "email": "Email",
  "password": "Password",
  "unknownException": "unknownException ({errorCode})",
  "parseException": "parseException",
  "cancellationException": "cancellationException",
  "noInternetException": "noInternetException",
  "timeoutException": "timeoutException",
  "badCertificateException": "badCertificateException",
  "canNotConnectToHost": "Can not connect to this host",
  "tokenExpired": "tokenExpired",
  "emptyEmail": "emptyEmail",
  "invalidEmail": "invalidEmail",
  "invalidPassword": "invalidPassword",
  "invalidUserName": "invalidUserName",
  "invalidPhoneNumber": "invalidPhoneNumber",
  "invalidDateTime": "invalidDateTime",
  "passwordsAreNotMatch": "passwordsAreNotMatch",
  "ok": "OK",
  "cancel": "Cancel",
  "retry": "Retry",
  "close": "Close",
  "search": "Search",
  "myPage": "My Page",
  "home": "Home",
  "darkTheme": "Dark Theme",
  "japanese": "Japanese"
}
```

**Cách sử dụng**:
```dart
// Generated S class từ flutter_localizations
Text(S.current.login);              // "Login"
Text(S.current.email);             // "Email"

// Với parameters
S.current.unknownException('UE-01'); // "unknownException (UE-01)"
```

### `resources/lib/src/l10n/intl_ja.arb`

**Tác dụng**: Japanese translations.

---

# 4. NALS_LINTS

## 4.1 Cấu Trúc

```
nals_lints/lib/
├── src/
│   ├── lints/                    ← 13 lint rules
│   ├── model/                   ← Lint models
│   ├── utils/                   ← Lint utilities
│   └── ast_visitor/             ← AST visitor helpers
├── analysis_options.yaml         ← Lint configuration
└── nals_lints.dart              ← Export file
```

## 4.2 File Chi Tiết

### `nals_lints/lib/src/lints/missing_build_when.dart`

**Tác dụng**: Bắt buộc dùng `buildWhen` trong `BlocBuilder`.

**Code**:
```dart
// ❌ Error
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) => Text(state.value),
)

// ✅ OK
BlocBuilder<MyBloc, MyState>(
  buildWhen: (previous, current) => previous.value != current.value,
  builder: (context, state) => Text(state.value),
)
```

### `nals_lints/lib/src/lints/missing_listen_when.dart`

**Tác dụng**: Bắt buộc dùng `listenWhen` trong `BlocListener`.

### `nals_lints/lib/src/lints/incorrect_todo_comment.dart`

**Tác dụng**: Format TODO comment phải theo chuẩn `TODO(nals): message`.

**Code**:
```dart
// ❌ Error
// TODO: fix this
// TODO: something

// ✅ OK
// TODO(nals): fix this bug
```

### `nals_lints/lib/src/lints/prefer_is_empty_string.dart`

**Tác dụng**: Dùng `.isEmpty` thay vì `== ''`.

**Code**:
```dart
// ❌ Error
if (text == '')

// ✅ OK
if (text.isEmpty)
```

### `nals_lints/lib/src/lints/avoid_hard_coded_colors.dart`

**Tác dụng**: Không hardcode màu trực tiếp.

**Code**:
```dart
// ❌ Error
Container(color: Colors.red)
Text('Hello', style: TextStyle(color: Colors.blue))

// ✅ OK - Dùng theme hoặc constants
Container(color: context.theme.primaryColor)
```

### `nals_lints/lib/src/lints/prefer_named_parameters.dart`

**Tác dụng**: Ưu tiên named parameters cho readability.

### `nals_lints/lib/src/lints/missing_run_bloc_catching.dart`

**Tác dụng**: Bắt buộc dùng `runBlocCatching` cho async actions.

**Code**:
```dart
// ❌ Error
Future<void> _onSubmit() async {
  await _useCase.execute();
}

// ✅ OK
Future<void> _onSubmit() {
  return runBlocCatching(
    action: () => _useCase.execute(),
  );
}
```

### `nals_lints/lib/src/lints/missing_calling_responsive.dart`

**Tác dụng**: Bắt buộc gọi responsive helpers.

### `nals_lints/lib/src/lints/prefer_is_not_empty_string.dart`

**Tác dụng**: Dùng `.isNotEmpty` thay vì `!= ''`.

**Code**:
```dart
// ❌ Error
if (text != '')

// ✅ OK
if (text.isNotEmpty)
```

### `nals_lints/lib/src/lints/avoid_hard_coded_text_style.dart`

**Tác dụng**: Không hardcode text style.

**Code**:
```dart
// ❌ Error
Text('Hello', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))

// ✅ OK - Dùng AppTextStyles
Text('Hello', style: AppTextStyles.s14w400Primary())
```

### `nals_lints/lib/src/lints/lines_longer_than_100_chars.dart`

**Tác dụng**: Giới hạn 100 ký tự mỗi dòng.

### `nals_lints/lib/src/lints/avoid_unnecessary_async_function.dart`

**Tác dụng**: Không dùng `async` nếu không cần.

**Code**:
```dart
// ❌ Error
Future<void> func() async {
  doSomething();
}

// ✅ OK
void func() {
  doSomething();
}
```

### `nals_lints/lib/src/lints/missing_build_when_or_listen_when.dart`

**Tác dụng**: Tổng hợp của `missing_build_when` và `missing_listen_when`.

---

# TÓM TẮT THEO FOLDER

## initializer/

| File | Tác dụng |
|------|----------|
| `app_initializer.dart` | Điều phối startup order các packages |

## shared/lib/src/

| Folder | File | Tác dụng |
|--------|------|----------|
| **di/** | `di.dart` | GetIt + Injectable setup |
| **config/** | `config.dart` | Abstract base Config |
| | `log_config.dart` | Logging flags (13 flags) |
| | `shared_config.dart` | Singleton shared config |
| **constants/** | `env_constants.dart` | Environment variables |
| | `duration_constants.dart` | Duration values |
| | `shared_preference_constants.dart` | Prefs keys |
| | `url_constants.dart` | API URLs |
| | `database_constants.dart` | DB config |
| | `symbol_constants.dart` | Symbols |
| | `locale_constants.dart` | Locale codes |
| | `uni_links_constants.dart` | Deep links |
| | `ui/ui_constants.dart` | UI constants |
| | `ui/device_constants.dart` | Device constants |
| | `ui/paging_constants.dart` | Pagination constants |
| **helper/** | `stream/dispose_bag.dart` | Auto cleanup subscriptions |
| | `stream/disposable.dart` | Disposable interface |
| | `stream/stream_logger.dart` | Stream logging |
| | `function/function.dart` | Func0-Func5 types |
| | `app_info.dart` | App info utilities |
| **exception/** | `app_exception.dart` | Base exception |
| | `remote_exception.dart` | HTTP errors |
| | `validation_exception.dart` | Validation errors |
| | `uncaught_exception.dart` | Uncaught errors |
| | `app_exception_wrapper.dart` | Exception + retry wrapper |
| **mixin/** | `log_mixin.dart` | Logging mixin |
| **model/** | `big_decimal.dart` | Precision decimal |
| | `shared_enum.dart` | Flavor, DeviceType enums |
| | `typedef.dart` | Type definitions |
| **utils/** | `log_utils.dart` | Logging utils |
| | `num_utils.dart` | Number extensions |
| | `file_utils.dart` | File operations |
| | `view_utils.dart` | UI utils |
| | `parse_utils.dart` | Parse utils |
| | `device_utils.dart` | Device detection |
| | `intent_utils.dart` | Intent utils |
| | `object_utils.dart` | Object/null utils |
| | `string_utils.dart` | String extensions |
| | `date_time_utils.dart` | DateTime utils |
| | `collection_utils.dart` | List/Set extensions |
| | `validation_utils.dart` | Validation functions |
| | `number_format_utils.dart` | Number formatting |

## resources/

| File | Tác dụng |
|------|----------|
| `l10n/intl_en.arb` | English translations (35 keys) |
| `l10n/intl_ja.arb` | Japanese translations |

## nals_lints/

| File | Tác dụng |
|------|----------|
| `lints/missing_build_when.dart` | Bắt buộc buildWhen |
| `lints/missing_listen_when.dart` | Bắt buộc listenWhen |
| `lints/incorrect_todo_comment.dart` | TODO format chuẩn |
| `lints/prefer_is_empty_string.dart` | .isEmpty thay == '' |
| `lints/avoid_hard_coded_colors.dart` | Không hardcode màu |
| `lints/prefer_named_parameters.dart` | Ưu tiên named params |
| `lints/missing_run_bloc_catching.dart` | Bắt buộc runBlocCatching |
| `lints/missing_calling_responsive.dart` | Gọi responsive helpers |
| `lints/prefer_is_not_empty_string.dart` | .isNotEmpty thay != '' |
| `lints/avoid_hard_coded_text_style.dart` | Không hardcode text style |
| `lints/lines_longer_than_100_chars.dart` | Giới hạn 100 chars |
| `lints/avoid_unnecessary_async_function.dart` | Không async void thừa |
| `lints/missing_build_when_or_listen_when.dart` | Tổng hợp buildWhen/listenWhen |

---

# FILES CÒN THIẾU CẦN EXPLORE THÊM

Sau khi review, một số files cần explore thêm:
- `shared/lib/src/helper/run_catching/` - Chi tiết run catching helpers
- `shared/lib/src/constants/format/` - Format constants
- `shared/lib/src/constants/server/` - Server constants
- `data/lib/src/repository/source/api/middleware/base_interceptor.dart` - Chi tiết interceptor base
- `data/lib/src/repository/source/api/middleware/connectivity_interceptor.dart` - Chi tiết connectivity
- `data/lib/src/repository/source/api/middleware/header_interceptor.dart` - Chi tiết headers
- `data/lib/src/repository/source/api/middleware/basic_auth_interceptor.dart` - Chi tiết basic auth
- `data/lib/src/repository/source/api/middleware/custom_log_interceptor.dart` - Chi tiết log interceptor
- `nals_lints/lib/src/model/` - Chi tiết lint models
- `nals_lints/lib/src/utils/` - Chi tiết lint utilities
- `nals_lints/lib/src/ast_visitor/` - Chi tiết AST visitor

Bạn có muốn tôi explore chi tiết thêm các files trên không?
