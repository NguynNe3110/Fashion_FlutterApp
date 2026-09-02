# 🏗️ PROJECT ORGANIZATION - TỔNG HỢP TOÀN BỘ

## Mục Lục

1. [Tổng Quan Cấu Trúc Monorepo](#1-tổng-quan-cấu-trúc-monorepo)
2. [Packages Chi Tiết](#2-packages-chi-tiết)
   - [shared - Shared Utilities](#21-shared---shared-utilities)
   - [domain - Domain Layer](#22-domain---domain-layer)
   - [data - Data Layer](#23-data---data-layer)
   - [app - Application Layer](#24-app---application-layer)
   - [initializer - App Initialization](#25-initializer---app-initialization)
   - [resources - Localization](#26-resources---localization)
   - [nals_lints - Custom Linting Rules](#27-nals_lints---custom-linting-rules)
3. [Helper & Utils Classes](#3-helper--utils-classes)
4. [Config System](#4-config-system)
5. [Common Views](#5-common-views)

---

# 1. TỔNG QUAN CẤU TRÚC MONOREPO

```
flutter_bloc_clean/
│
├── 📦 packages/ (Melos managed)
│   ├── domain/          ← Business logic, entities, use cases
│   ├── data/            ← API, database, preferences implementation
│   ├── shared/          ← Utilities, constants, DI, helpers
│   ├── app/             ← UI, BLoC, navigation, common views
│   ├── initializer/     ← App initialization
│   └── resources/       ← Localization (i18n)
│
├── 🏗️ nals_lints/        ← Custom linting rules
│
└── melos.yaml           ← Melos configuration
```

---

# 2. PACKAGES CHI TIẾT

## 2.1 shared - Shared Utilities

> **Purpose**: Chứa tất cả utilities, helpers, constants, configs dùng chung.

### 2.1.1 Folder Structure

```
shared/lib/src/
├── di/                     ← Dependency Injection
│   └── di.dart             ← GetIt + injectable setup
│
├── model/                  ← Shared Models
│   ├── typedef.dart        ← Type definitions
│   ├── big_decimal.dart    ← BigDecimal implementation
│   └── shared_enum.dart    ← Flavor, DeviceType enums
│
├── utils/                  ← Utility Classes (13 files)
│   ├── log_utils.dart
│   ├── num_utils.dart
│   ├── file_utils.dart
│   ├── view_utils.dart
│   ├── parse_utils.dart
│   ├── device_utils.dart
│   ├── intent_utils.dart
│   ├── object_utils.dart
│   ├── string_utils.dart
│   ├── date_time_utils.dart
│   ├── collection_utils.dart
│   ├── validation_utils.dart
│   └── number_format_utils.dart
│
├── constants/              ← Constants Groups (6 subfolders)
│   ├── ui/
│   ├── format/
│   ├── server/
│   ├── firebase/
│   ├── env_constants.dart
│   ├── url_constants.dart
│   ├── locale_constants.dart
│   ├── symbol_constants.dart
│   ├── database_constants.dart
│   ├── duration_constants.dart
│   ├── uni_links_constants.dart
│   └── shared_preference_constants.dart
│
├── config/                 ← Configuration
│   ├── config.dart
│   ├── log_config.dart     ← Debug/Production log settings
│   └── shared_config.dart
│
├── helper/                  ← Helper Classes
│   ├── stream/
│   │   ├── disposable.dart
│   │   ├── dispose_bag.dart
│   │   └── stream_logger.dart
│   ├── function/
│   │   └── function.dart   ← Func0-Func5 type definitions
│   ├── run_catching/
│   └── app_info.dart
│
└── exception/              ← Exception Base Classes
    ├── app_exception.dart
    ├── remote_exception.dart
    ├── validation_exception.dart
    ├── uncaught_exception.dart
    └── app_exception_wrapper.dart
```

### 2.1.2 Chi Tiết Từng Thành Phần

#### **di/ - Dependency Injection**

```dart
// shared/lib/src/di/di.dart

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
```

**Purpose**: Setup GetIt + Injectable để quản lý dependencies.

---

#### **model/ - Shared Models**

##### big_decimal.dart

```dart
class BigDecimal implements Comparable<BigDecimal> {
  factory BigDecimal.parse(String value);
  factory BigDecimal.fromBigInt(BigInt value);
  factory BigDecimal.fromInt(int value);

  static const zero = BigDecimal._();

  // Operators
  BigDecimal operator +(BigDecimal other);
  BigDecimal operator -(BigDecimal other);
  BigDecimal operator *(BigDecimal other);
  BigDecimal operator %(BigDecimal other);

  // Methods
  BigDecimal abs();
  BigDecimal floor();
  BigDecimal ceil();
  BigDecimal round();
  BigDecimal pow(int exponent);
  double toDouble();
  String toStringAsFixed(int fractionDigits);
}
```

**Purpose**: Xử lý số thập phân lớn, tránh floating point errors.

##### shared_enum.dart

```dart
enum Flavor { develop, qa, staging, production }
enum DeviceType { mobile, tablet }
```

---

#### **utils/ - Utility Classes**

##### validation_utils.dart

```dart
class ValidationUtils {
  static bool isValidPassword(String password);
  static bool isEmptyPhoneNumber(String phoneNumber);
  static bool isValidPhoneNumber(String phoneNumber);
  static bool isEmptyEmail(String email);
  static bool isValidEmail(String email);
  static bool isEmptyDateTime(String dateTime);
  static bool isValidDateTime(String dateTime);
  static bool isAlphanumeric(String text);
  static bool isLink(String text);
}
```

##### date_time_utils.dart

```dart
class DateTimeUtils {
  static DateTime? tryParse({
    required String? date,
    required String format,
  });
  // Parse datetime với format cụ thể
}
```

##### string_utils.dart

```dart
class StringUtils {
  static String capitalize(String text);
  static String truncate(String text, int maxLength);
  // ... more string utilities
}
```

##### collection_utils.dart

```dart
class CollectionUtils {
  static bool isNullOrEmpty<T>(List<T>? list);
  static List<T> safeList<T>(List<T>? list);
  // ... more collection utilities
}
```

##### num_utils.dart

```dart
class NumUtils {
  static int? tryParseInt(String? value);
  static double? tryParseDouble(String? value);
  // ... more number utilities
}
```

---

#### **constants/ - Constants**

##### duration_constants.dart

```dart
class DurationConstants {
  static const defaultListGridTransitionDuration = Duration(milliseconds: 500);
  static const defaultEventTransfomDuration = Duration(milliseconds: 500);
  static const defaultGeneralDialogTransitionDuration = Duration(milliseconds: 200);
  static const defaultSnackBarDuration = Duration(seconds: 3);
  static const defaultErrorVisibleDuration = Duration(seconds: 3);
}
```

##### shared_preference_constants.dart

```dart
class SharedPreferenceKeys {
  static const isDarkMode = 'is_dark_mode';
  static const deviceToken = 'device_token';
  static const languageCode = 'language_code';
  static const isFirstLogin = 'is_first_login';
  static const isFirstLaunchApp = 'is_first_launch_app';
  static const accessToken = 'access_token';      // Secure storage
  static const refreshToken = 'refresh_token';    // Secure storage
  static const currentUser = 'current_user';
}
```

---

#### **config/ - Configuration**

##### log_config.dart

```dart
class LogConfig {
  // Debug mode check
  static const enableGeneralLog = kDebugMode;
  static const isPrettyJson = kDebugMode;

  // BLoC Observer
  static const logOnBlocChange = false;
  static const logOnBlocCreate = false;
  static const logOnBlocClose = false;
  static const logOnBlocError = false;
  static const logOnBlocEvent = kDebugMode;
  static const logOnBlocTransition = false;

  // Navigator Observer
  static const enableNavigatorObserverLog = kDebugMode;

  // DisposeBag
  static const enableDisposeBagLog = false;

  // Stream Events
  static const logOnStreamListen = false;
  static const logOnStreamData = false;
  static const logOnStreamError = false;
  static const logOnStreamDone = false;
  static const logOnStreamCancel = false;

  // HTTP Interceptor Logs
  static const enableLogInterceptor = kDebugMode;
  static const enableLogRequestInfo = kDebugMode;
  static const enableLogSuccessResponse = kDebugMode;
  static const enableLogErrorResponse = kDebugMode;

  // UseCase Logs
  static const enableLogUseCaseInput = kDebugMode;
  static const enableLogUseCaseOutput = kDebugMode;
  static const enableLogUseCaseError = kDebugMode;
}
```

**Purpose**: Control logging in Debug vs Production mode.

---

#### **helper/stream/ - Stream Helpers**

##### dispose_bag.dart

```dart
class DisposeBag with LogMixin {
  final List<Object> _disposable = [];

  void addDisposable(Object disposable);
  void dispose();
}

// Extensions
extension StreamSubscriptionExtensions<T> on StreamSubscription<T> {
  void disposeBy(DisposeBag disposeBag);
}

extension StreamControllerExtensions<T> on StreamController<T> {
  void disposeBy(DisposeBag disposeBag);
}

extension ChangeNotifierExtensions on ChangeNotifier {
  void disposeBy(DisposeBag disposeBag);
}
```

**Purpose**: Tự động cleanup subscriptions khi BLoC close.

```dart
// Usage in BLoC
class MyBloc extends BaseBloc<MyEvent, MyState> {
  MyBloc(this._repository) : super(const MyState()) {
    _subscription = _repository.getStream()
      .listen((data) { /* ... */ })
      .disposedBy(disposeBag);
  }

  final _repository;
  StreamSubscription? _subscription;
  final _disposeBag = DisposeBag();
}
```

##### disposable.dart

```dart
abstract class Disposable {
  void dispose();
}
```

---

#### **helper/function/ - Function Types**

##### function.dart

```dart
class Func0<R> {
  final R Function() function;
  R call();
}

class Func1<P0, R> {
  final R Function(P0) function;
  R call(P0 p0);
}

class Func2<P0, P1, R> {
  final R Function(P0, P1) function;
  R call(P0 p0, P1 p1);
}

// ... Func3, Func4, Func5
```

**Purpose**: Type-safe function references cho callbacks.

---

## 2.2 domain - Domain Layer

### 2.2.1 Folder Structure

```
domain/lib/src/
├── bloc/
│   ├── base_bloc.dart
│   ├── base_bloc_event.dart
│   ├── base_bloc_state.dart
│   ├── base_bloc_delegate.dart
│   └── common_bloc.dart
│
├── usecase/
│   ├── base_input.dart
│   ├── base_output.dart
│   ├── base_use_case.dart
│   ├── base_future_use_case.dart
│   ├── base_sync_use_case.dart
│   ├── base_stream_use_case.dart
│   ├── base_load_more_use_case.dart
│   └── (feature folders...)
│       └── (use_case_name)/
│           ├── (use_case_name)_use_case.dart
│           ├── (use_case_name)_input.dart
│           └── (use_case_name)_output.dart
│
├── repository/
│   └── repository.dart            ← Interface
│
├── entity/
│   ├── user.dart
│   └── ...
│
├── navigation/
│   └── app_route_info.dart
│
└── (feature folders...)
```

---

## 2.3 data - Data Layer

### 2.3.1 Folder Structure

```
data/lib/src/
├── repository/
│   ├── repository_impl.dart        ← Implement Repository interface
│   └── source/
│       ├── api/                    ← HTTP/API
│       │   ├── app_api_service.dart
│       │   ├── client/
│       │   ├── model/              ← DTO (API responses)
│       │   ├── mapper/             ← Response → Entity mappers
│       │   └── middleware/          ← Interceptors
│       │       ├── access_token_interceptor.dart
│       │       ├── error_interceptor.dart
│       │       ├── log_interceptor.dart
│       │       └── refresh_token_interceptor.dart
│       │
│       ├── database/               ← Local DB (ObjectBox)
│       │   ├── app_database.dart
│       │   ├── model/
│       │   ├── mapper/
│       │   └── generated/          ← ObjectBox generated code
│       │
│       └── preference/             ← SharedPreferences
│           ├── app_preferences.dart
│           ├── model/
│           └── mapper/
│
├── mapper/
│   └── data_mapper.dart
│
└── config/
    ├── config.dart
    └── data_config.dart
```

### 2.3.2 Chi Tiết Data Sources

#### **api/app_api_service.dart** - HTTP Client

```dart
@Injectable()
class AppApiService {
  AppApiService(this._dio);

  final Dio _dio;

  @GET('/users/{id}')
  Future<UserResponse> getUser(@Path('id') int userId);

  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  // ... more endpoints
}
```

#### **database/app_database.dart** - ObjectBox

```dart
@LazySingleton()
class AppDatabase {
  AppDatabase(this.store);
  final Store store;

  int putUser(LocalUserData user);
  Stream<List<LocalUserData>> getUsersStream();
  List<LocalUserData> getUsers();
  LocalUserData? getUser(int id);
  int deleteAllUsersAndImageUrls();
}
```

#### **preference/app_preferences.dart** - SharedPreferences

```dart
@LazySingleton()
class AppPreferences {
  AppPreferences(this._sharedPreference, this._secureStorage);

  // Getters (sync)
  bool get isDarkMode;
  String get deviceToken;
  String get languageCode;
  bool get isFirstLogin;
  bool get isFirstLaunchApp;
  bool get isLoggedIn;
  PreferenceUserData? get currentUser;

  // Getters (async - for secure storage)
  Future<String> get accessToken;
  Future<String> get refreshToken;

  // Setters
  Future<bool> saveLanguageCode(String languageCode);
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<bool> saveCurrentUser(PreferenceUserData user);
  Future<bool> saveIsDarkMode(bool isDarkMode);

  // Clear
  Future<void> clearCurrentUserData();
}
```

---

## 2.4 app - Application Layer

### 2.4.1 Folder Structure

```
app/lib/
├── main.dart                     ← Entry point
├── app.dart                      ← Root widget
│
├── di/                           ← App DI
│   └── app_di.dart
│
├── config/                       ← App config
│   ├── app_config.dart
│   └── app_router.dart           ← AutoRoute setup
│
├── base/                         ← Base Classes (BLoC, UI)
│   ├── bloc/
│   │   └── ...
│   └── ui/
│       └── base_page.dart
│
├── ui/                           ← Feature UI
│   ├── auth/
│   │   ├── login/
│   │   └── bloc/
│   ├── home/
│   └── ...
│
├── common_view/                  ← Reusable UI Components
│   ├── common_app_bar.dart
│   ├── common_scaffold.dart
│   ├── popup/
│   │   ├── common_dialog.dart
│   │   ├── popup_type.dart
│   │   └── popup_button.dart
│   ├── shimmer/
│   │   ├── shimmer.dart
│   │   ├── circle_shimmer.dart
│   │   ├── shimmer_loading.dart
│   │   └── rounded_rectangle_shimmer.dart
│   └── paged_view/               ← Pagination UI
│       ├── common_paged_list_view.dart
│       ├── common_paged_grid_view.dart
│       ├── controller/
│       ├── error_view/
│       ├── loading_view/
│       ├── no_more_items_view/
│       └── no_items_found_view/
│
├── navigation/
│   └── mapper/
│       └── app_route_info_mapper.dart
│
├── exception_handler/
│   ├── exception_handler.dart
│   └── exception_message_mapper.dart
│
├── shared_view/                  ← Shared widgets
└── utils/                        ← App-specific utils
```

### 2.4.2 Common Views Chi Tiết

#### **popup/ - Dialog System**

```dart
// Popup types
enum PopupType { android, ios, adaptive }

// Popup buttons
class PopupButton {
  final String? text;
  final VoidCallback? onPressed;
  final bool isDefault;  // Highlight default action
}

// Usage
CommonDialog.adaptive(
  title: 'Error',
  message: 'Something went wrong',
  actions: [
    PopupButton(
      text: S.current.cancel,
      isDefault: false,
      onPressed: () {},
    ),
    PopupButton(
      text: S.current.ok,
      isDefault: true,
      onPressed: () {},
    ),
  ],
);
```

#### **shimmer/ - Loading Skeleton**

```dart
// Circle shimmer (avatar placeholder)
CircleShimmer(
  size: 50,
)

// Rounded rectangle shimmer (card placeholder)
RoundedRectangleShimmer(
  width: 200,
  height: 20,
  borderRadius: 8,
)

// Shimmer loading wrapper
ShimmerLoading(
  isLoading: true,
  child: MyContent(),
)
```

#### **paged_view/ - Pagination**

```dart
// CommonPagedListView
CommonPagedListView<User>(
  pagingController: _pagingController,
  itemBuilder: (context, user, index) => UserTile(user: user),
  firstPageErrorIndicator: ErrorView(onRetry: () {}),
  newPageProgressIndicator: CircularProgressIndicator(),
  noMoreItemsIndicator: NoMoreItemsView(),
  noItemsFoundIndicator: NoItemsFoundView(),
);

// CommonPagedGridView
CommonPagedGridView<User>(
  pagingController: _pagingController,
  itemBuilder: (context, user, index) => UserCard(user: user),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
);
```

---

## 2.5 initializer - App Initialization

```dart
// initializer/lib/src/app_initializer.dart

class AppInitializer {
  AppInitializer(this._applicationConfig);
  final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    // 1. Init environment
    EnvConstants.init();

    // 2. Init shared config
    await SharedConfig.getInstance().init();

    // 3. Init data config
    await DataConfig.getInstance().init();

    // 4. Init domain config
    await DomainConfig.getInstance().init();

    // 5. Init app-specific config
    await _applicationConfig.init();
  }
}
```

**Purpose**: Quản lý initialization order của các packages.

---

## 2.6 resources - Localization

### 2.6.1 Structure

```
resources/lib/src/l10n/
├── intl_en.arb     ← English translations
└── intl_ja.arb     ← Japanese translations
```

### 2.6.2 Usage

```dart
// Generated S class
S.current.login;           // "Login"
S.current.email;           // "Email"
S.current.noInternetException;  // "noInternetException"

// With parameters
S.current.unknownException('UE-01');  // "unknownException (UE-01)"
```

### 2.6.3 Supported Keys

```json
{
  // Auth
  "login": "Login",
  "logout": "Logout",
  "email": "Email",
  "password": "Password",

  // Errors
  "unknownException": "unknownException ({errorCode})",
  "noInternetException": "noInternetException",
  "timeoutException": "timeoutException",
  "tokenExpired": "tokenExpired",
  "emptyEmail": "emptyEmail",
  "invalidEmail": "invalidEmail",
  "invalidPassword": "invalidPassword",

  // Common
  "ok": "OK",
  "cancel": "Cancel",
  "retry": "Retry",
  "close": "Close",
  "search": "Search",

  // Settings
  "darkTheme": "Dark Theme",
  "japanese": "Japanese"
}
```

---

## 2.7 nals_lints - Custom Linting Rules

### 2.7.1 Purpose

Custom lint rules được team tự tạo để enforce coding standards.

### 2.7.2 Available Lints

| File | Purpose |
|------|---------|
| `missing_build_when.dart` | Bắt buộc dùng `buildWhen` |
| `missing_listen_when.dart` | Bắt buộc dùng `listenWhen` |
| `incorrect_todo_comment.dart` | Format TODO comment chuẩn |
| `prefer_is_empty_string.dart` | Dùng `.isEmpty` thay vì `== ''` |
| `avoid_hard_coded_colors.dart` | Không hardcode màu |
| `prefer_named_parameters.dart` | Ưu tiên named parameters |
| `missing_run_bloc_catching.dart` | Bắt buộc dùng `runBlocCatching` |
| `missing_calling_responsive.dart` | Gọi responsive utilities |
| `prefer_is_not_empty_string.dart` | Dùng `.isNotEmpty` thay vì `!= ''` |
| `avoid_hard_coded_text_style.dart` | Không hardcode text style |
| `lines_longer_than_100_chars.dart` | Giới hạn 100 chars/line |
| `avoid_unnecessary_async_function.dart` | Không async void không cần thiết |
| `missing_build_when_or_listen_when.dart` | Tổng hợp cả hai |

### 2.7.3 analysis_options.yaml

```yaml
include: package:nals_lints/lints.yaml

linter:
  rules:
    missing_build_when: true
    missing_listen_when: true
    prefer_is_empty_string: true
    # ... more rules
```

---

# 3. HELPER & UTILS CLASSES

## 3.1 Summary Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         HELPER CLASSES OVERVIEW                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐      │
│  │  DisposeBag     │     │   Func0-5       │     │   BigDecimal    │      │
│  │  - addDisposable│     │   - call()      │     │   - +, -, *, /  │      │
│  │  - dispose()    │     │   - Type-safe   │     │   - toDouble()  │      │
│  └─────────────────┘     └─────────────────┘     └─────────────────┘      │
│                                                                             │
│  ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐      │
│  │  StreamLogger   │     │  ValidationUtil │     │  DateTimeUtils  │      │
│  │  - logListen()  │     │  - isValidEmail │     │  - tryParse()   │      │
│  │  - logData()    │     │  - isValidPhone │     │                 │      │
│  └─────────────────┘     └─────────────────┘     └─────────────────┘      │
│                                                                             │
│  ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐      │
│  │  StringUtils    │     │ CollectionUtils │     │  NumUtils       │      │
│  │  - capitalize() │     │  - isNullOrEmpty│     │  - tryParseInt()│      │
│  │  - truncate()   │     │  - safeList()   │     │  - tryParseDbl()│      │
│  └─────────────────┘     └─────────────────┘     └─────────────────┘      │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

# 4. CONFIG SYSTEM

## 4.1 Initialization Flow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           APP START                                          │
│                           main()                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  AppInitializer.init()                                                       │
│                                                                             │
│  1. EnvConstants.init()          ← Load environment variables              │
│  2. SharedConfig.getInstance()    ← Init shared preferences, logging        │
│  3. DataConfig.getInstance()     ← Init Dio, Database, Preferences         │
│  4. DomainConfig.getInstance()   ← Init domain dependencies                 │
│  5. AppConfig.init()             ← Init app-specific config                 │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  configureInjection()           ← GetIt + Injectable setup                  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  runApp()                                                                      │
└─────────────────────────────────────────────────────────────────────────────┘
```

## 4.2 Config Classes

| Config | Purpose | Key Initialization |
|--------|---------|-------------------|
| `EnvConstants` | Environment variables | `EnvConstants.init()` |
| `SharedConfig` | Logging, app info | `SharedConfig.getInstance().init()` |
| `DataConfig` | Dio, Database | `DataConfig.getInstance().init()` |
| `DomainConfig` | Domain DI | `DomainConfig.getInstance().init()` |
| `AppConfig` | App-specific | `_applicationConfig.init()` |

---

# 5. COMMON VIEWS

## 5.1 Component Hierarchy

```
common_view/
├── common_app_bar.dart           ← Custom AppBar
├── common_scaffold.dart          ← Custom Scaffold
│
├── popup/                        ← Dialog System
│   ├── common_dialog.dart        ← Adaptive dialog (iOS/Android)
│   ├── popup_type.dart           ← PopupType enum
│   └── popup_button.dart         ← Button configuration
│
├── shimmer/                      ← Loading Skeletons
│   ├── shimmer.dart             ← Base shimmer
│   ├── circle_shimmer.dart       ← Avatar placeholder
│   ├── shimmer_loading.dart     ← Loading wrapper
│   └── rounded_rectangle_shimmer.dart ← Card placeholder
│
└── paged_view/                   ← Pagination Components
    ├── common_paged_list_view.dart
    ├── common_paged_grid_view.dart
    ├── controller/
    ├── error_view/
    ├── loading_view/
    ├── no_more_items_view/
    └── no_items_found_view/
```

## 5.2 Usage Examples

### Dialog

```dart
// Show dialog
await navigator.showDialog(
  CommonDialog.adaptive(
    title: 'Confirm',
    message: 'Are you sure?',
    actions: [
      PopupButton(text: 'Cancel', onPressed: () => navigator.pop()),
      PopupButton(text: 'OK', isDefault: true, onPressed: () => navigator.pop()),
    ],
  ),
);

// Error dialog with retry
await navigator.showDialog(
  AppPopupInfo.errorWithRetryDialog(
    message: 'Network error',
    onRetryPressed: () => retry(),
  ),
);
```

### Shimmer Loading

```dart
ShimmerLoading(
  isLoading: isLoading,
  child: Content(),
)

// Or use individual shimmer types
if (isLoading)
  Column(
    children: [
      CircleShimmer(size: 50),
      RoundedRectangleShimmer(width: 200, height: 20),
    ],
  )
```

---

# TÓM TẮT

## Package Responsibilities

| Package | Responsibility |
|---------|---------------|
| **shared** | Utilities, constants, helpers, DI, exceptions |
| **domain** | Business logic, entities, use cases, repository interfaces |
| **data** | API, database, preferences, repository implementations |
| **app** | UI, BLoC, navigation, common views, exception handling |
| **initializer** | App initialization orchestration |
| **resources** | Localization (i18n) |
| **nals_lints** | Custom linting rules |

## Key Patterns

1. **Dependency Injection**: GetIt + Injectable
2. **Error Handling**: AppException hierarchy + ExceptionHandler
3. **State Management**: BLoC pattern với Base classes
4. **Data Flow**: DTO → DataMapper → Entity → UseCase
5. **Initialization**: Config classes với singleton pattern

---

Bạn có muốn tôi đi sâu hơn vào phần nào cụ thể không?
