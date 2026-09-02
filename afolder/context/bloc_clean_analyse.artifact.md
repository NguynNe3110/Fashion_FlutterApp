# Flutter BLoC Clean Architecture - Phân Tích Chi Tiết

## 📋 Tổng Quan Cấu Trúc Project

Đây là một **monorepo** với **9 packages** được quản lý bởi **Melos**:

```
flutter_bloc_clean/
├── app/           # Application layer - UI, BLoC, Navigation
├── data/          # Data layer - API, Local Storage, Repository Implementation
├── domain/        # Domain layer - Entities, Use Cases, Repository Interfaces
├── shared/        # Shared utilities - Models, Exceptions, DI, Utils
├── resources/     # Localization, Assets
├── initializer/   # App initialization
├── nals_lints/    # Custom linting rules
└── tools/         # Build tools
```

---

## 🏗️ Clean Architecture Layers (Chi Tiết)

### Layer 1: **DOMAIN** (Inner - Không phụ thuộc gì bên ngoài)

**Mục đích**: Định nghĩa business logic thuần túy, không quan tâm implementation cụ thể.

#### 1.1 `Entity` - Đối tượng nghiệp vụ thuần túy

| File | Mục đích | Vấn đề giải quyết |
|------|----------|-------------------|
| `user.dart` | Thông tin user | Mô hình hóa dữ liệu người dùng |
| `token.dart` | Access/Refresh tokens | Quản lý authentication tokens |
| `base/process_state.dart` | ⚠️ **DEPRECATED** | Đã thay bằng `Result<T>` trong shared |
| `base/paged_list.dart` | Danh sách phân trang | Xử lý pagination |

#### 1.2 `UseCase` - Các hành động nghiệp vụ

**Cấu trúc UseCase Pattern**:
```
BaseUseCase<Input, Output>
├── BaseFutureUseCase    → execute() trả Future<Output>
├── BaseSyncUseCase      → execute() trả Output trực tiếp
├── BaseStreamUseCase     → execute() trả Stream<Output>
└── BaseIOUseCase        → xử lý Input/Output operations
```

**Tại sao cần UseCase?**
- **Separation of Concerns**: Tách business logic khỏi BLoC
- **Testability**: Dễ unit test từng use case riêng lẻ
- **Reusability**: Cùng một logic có thể dùng ở nhiều nơi
- **Single Responsibility**: Mỗi use case chỉ làm một việc

**Ví dụ**: `LoginUseCase` - chỉ lo việc login, không quan tâm UI hay API cụ thể

#### 1.3 `Repository` Interface - Hợp đồng với Data layer

```dart
abstract class Repository {
  bool get isLoggedIn;
  Future<void> login({required String email, required String password});
  Future<void> logout();
  // ...
}
```

**Tại sao cần Interface ở đây?**
- Domain không biết gì về implementation (API? Local DB?)
- Data layer implement interface này
- Dependency Injection sẽ inject implementation vào domain

---

### Layer 2: **DATA** (Implement Domain)

**Mục đích**: Implement các interface từ Domain, xử lý data thực tế (API, Local DB)

#### 2.1 `RepositoryImpl`

```dart
class RepositoryImpl implements Repository {
  final AppApiService _appApiService;      // Gọi API
  final AppPreferences _appPreferences;     // Local storage
  final AppDatabase _appDatabase;           // Local DB
  final *DataMapper _mapper;               // Convert API response → Entity
}
```

**Tại sao cần DataMapper?**
- API trả về JSON/DTO (Data Transfer Object)
- Domain cần Entity thuần túy
- Mapper chuyển đổi giữa 2 thế giới này
- Giữ cho Domain không phụ thuộc vào structure của API

#### 2.2 `DataMapper` Pattern

```
API Response (JSON)
    ↓
ApiUserDataMapper
    ↓
User Entity (Domain)
```

---

### Layer 3: **SHARED** (Utilities - Dùng chung)

#### 3.1 Exception System - Xử lý lỗi tập trung

```
AppException (base)
├── RemoteException        → Lỗi API (network, server, timeout...)
├── ParseException         → Lỗi parse JSON
├── ValidationException    → Lỗi validation input
├── RemoteConfigException  → Lỗi remote config
└── AppUncaughtException   → Lỗi không xác định
```

**Tại sao cần hệ thống Exception phức tạp như vậy?**

1. **Phân loại rõ ràng**: Biết lỗi từ đâu để xử lý đúng
2. **Hiển thị message phù hợp**: Lỗi network ≠ lỗi server
3. **Retry logic khác nhau**: Timeout thì retry, validation thì không
4. **Localization**: Mỗi loại lỗi có message khác nhau cho user

**RemoteExceptionKind** (Chi tiết):
| Kind | Ý nghĩa | Xử lý |
|------|---------|-------|
| `noInternet` | Mất kết nối | Retry |
| `timeout` | Server phản hồi chậm | Retry |
| `refreshTokenFailed` | Token hết hạn | Force logout |
| `serverDefined` | Lỗi server có message | Hiển thị message |
| `serverUndefined` | Lỗi server không message | Hiển thị generic error |

#### 3.2 `Result<T>` - Thay thế ProcessState

```dart
@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Success;
  const factory Result.failure(AppException exception) = _Error;
}
```

**Tại sao thay thế ProcessState?**

1. **Immutability**: Freezed generated code là immutable
2. **Pattern Matching**: Dùng được với switch expression
3. **Exhaustive Checking**: Compiler cảnh báo nếu thiếu case

#### 3.3 `runCatching` / `runAsyncCatching` - Try-catch wrapper

```dart
// Thay vì:
try {
  final result = await api.login();
  return Result.success(result);
} catch (e) {
  return Result.failure(e is AppException ? e : AppUncaughtException(e));
}

// Viết:
return runAsyncCatching(() => api.login());
```

---

### Layer 4: **APP** (Presentation - UI)

#### 4.1 Base BLoC Pattern - Trái tim của architecture

```
BaseBlocEvent (abstract)
    ↓
CommonEvent
├── ExceptionEmitted
├── LoadingVisibilityEmitted
└── ForceLogoutButtonPressed

BaseBlocState (abstract)
    ↓
CommonState
├── appExceptionWrapper
├── loadingCount (int)
└── isLoading (bool)
```

#### 4.2 BaseBloc - Class cha cho tất cả BLoC

```dart
abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S>
    with EventTransformerMixin, LogMixin {
  // Tất cả BLoC đều có:
  late final AppNavigator navigator;        // Navigate
  late final ExceptionHandler handler;      // Handle error
  late final DisposeBag disposeBag;         // Cleanup

  // CommonBloc dùng chung cho loading/error
  CommonBloc get commonBloc;
}
```

**Tại sao cần BaseBloc?**

1. **Code reuse**: Không lặp lại logic loading/error
2. **Consistency**: Tất cả BLoC có interface giống nhau
3. **Centralized control**: Loading/error được quản lý ở một chỗ

#### 4.3 `runBlocCatching` - Cốt lõi xử lý error

```dart
Future<void> runBlocCatching({
  required Future<void> Function() action,
  bool handleLoading = true,       // Tự động show/hide loading
  bool handleError = true,         // Tự động handle error
  bool handleRetry = true,         // Có retry button không
  String? overrideErrorMessage,    // Override message
  Future<void> Function(AppException)? doOnError,  // Custom error callback
  // ...
}) async
```

**Flow của runBlocCatching:**

```
1. doOnSubscribe?.call()
2. showLoading() (nếu handleLoading=true)
3. action() - thực hiện business logic
4. hideLoading()
5. doOnSuccessOrError?.call()

Nếu có exception:
6. hideLoading()
7. doOnError?.call(e)
8. addException() → CommonBloc nhận
9. ExceptionHandler hiển thị dialog/snackbar
10. doOnRetry?.call() nếu user bấm retry
```

#### 4.4 CommonBloc - Global state cho app

```dart
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  // Quản lý loading visibility
  // - loadingCount: đếm số request đang chạy
  // - isLoading: true khi count > 0

  // Quản lý exception toàn cục
  // - appExceptionWrapper: exception hiện tại
}
```

**Tại sao CommonBloc riêng?**

1. **Shared state**: Nhiều BLoC có thể show loading cùng lúc
2. **Avoid circular dependency**: BLoC A gọi BLoC B trực tiếp = phức tạp
3. **Single source of truth**: Tất cả loading/error ở một chỗ

---

## 🔄 Data Flow Chi Tiết

### Flow 1: Login thành công

```
┌─────────────────────────────────────────────────────────────┐
│  UI Layer (LoginPage)                                       │
│  - User nhập email/password                                  │
│  - Bấm nút Login                                            │
│  - Gọi: loginBloc.add(LoginButtonPressed())                │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  BLoC Layer (LoginBloc)                                    │
│  - Nhận event LoginButtonPressed                            │
│  - Gọi: runBlocCatching(                                   │
│        action: () => _loginUseCase.execute(...))           │
│    ↓                                                        │
│    ├── showLoading() → CommonBloc                          │
│    ├── LoginUseCase.execute()                               │
│    ├── hideLoading() → CommonBloc                          │
│    └── navigator.replace(AppRouteInfo.main())               │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  Domain Layer (LoginUseCase)                                │
│  - buildUseCase(): Gọi repository.login()                   │
│  - KHÔNG biết API hay local storage                        │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  Data Layer (RepositoryImpl)                                │
│  - Gọi: _appApiService.login()                             │
│  - Parse response                                          │
│  - Save token to preferences                               │
└─────────────────────────────────────────────────────────────┘
```

### Flow 2: Login thất bại (Network Error)

```
1. action() throw RemoteException(RemoteExceptionKind.noInternet)
2. catch (AppException e)
3. hideLoading()
4. doOnError?.call(e)  // Có thể override
5. addException(AppExceptionWrapper(
     appException: e,
     doOnRetry: () => runBlocCatching(action: action, ...) // recursive retry
   ))
6. CommonBloc nhận ExceptionEmitted
7. emit(state.copyWith(appExceptionWrapper: wrapper))
8. BlocListener trong App root nhận được exception
9. ExceptionHandler.handleException() được gọi
10. navigator.showDialog(AppPopupInfo.errorWithRetryDialog(...))
```

---

## 🎯 Mỗi Class Giải Quyết Vấn Đề Gì?

### Vấn đề 1: Xử lý Loading state

| Class | Giải pháp |
|-------|-----------|
| `CommonBloc` | Quản lý loadingCount để handle multiple requests |
| `BaseBloc.showLoading()` | Mỗi BLoC gọi show/hide |
| `BaseBloc.hideLoading()` | Khi nào cũng gọi trong finally |

**Tại sao dùng count thay vì boolean?**
```dart
// User click login (count = 1, isLoading = true)
// Trong khi đang loading, gọi API khác (count = 2, vẫn true)
// API thứ 2 xong (count = 1, vẫn true)
// API đầu xong (count = 0, isLoading = false)
```
→ Đảm bảo loading indicator chỉ ẩn khi TẤT CẢ requests hoàn thành

### Vấn đề 2: Xử lý Error tập trung

| Class | Giải pháp |
|-------|-----------|
| `AppException` hierarchy | Phân loại error chi tiết |
| `ExceptionHandler` | Map exception → UI action |
| `ExceptionMessageMapper` | Map exception → localized message |
| `CommonBloc` | Global state cho error |

**Tại sao không handle error trong từng BLoC?**
- Trùng lặp code
- Không consistent
- Khó thay đổi behavior chung

### Vấn đề 3: Navigation

| Class | Giải pháp |
|-------|-----------|
| `AppNavigator` (interface) | Abstract navigation methods |
| `AppNavigatorImpl` | Implement với AutoRoute |
| `AppRouteInfo` | Type-safe route definitions |
| `BaseRouteInfoMapper` | Map AppRouteInfo → AutoRoute |

**Tại sao không dùng Navigator trực tiếp?**
- Dependency inversion: BLoC phụ thuộc interface, không implementation
- Dễ mock trong test
- Đổi thư viện navigation (GoRouter → auto_route) không ảnh hưởng BLoC

### Vấn đề 4: Event Transformation

| Mixin | Mục đích |
|-------|----------|
| `throttleTime` | Tránh spam click |
| `debounceTime` | Chờ user ngừng gõ |
| `exhaustMap` | Bỏ qua event khi đang xử lý |
| `switchMap` | Hủy event cũ, xử lý event mới |
| `distinct` | Bỏ duplicate events |

---

## 📦 Dependency Injection (DI)

### Tại sao cần DI?

1. **Testability**: Mock dependencies trong unit test
2. **Loose coupling**: Class không tạo dependencies, nhận vào
3. **Lifecycle management**: Injectable quản lý scope (singleton, lazy)

### Trong project này:

```dart
@Injectable()           // Tạo mới mỗi lần inject
@Singleton()            // Chỉ tạo một lần, shared
@LazySingleton()        // Tạo khi lần đầu được inject
@Injectable(as: X)()    // Implement interface X
```

### DI Container:

```dart
getIt.registerFactory<LoginBloc>(() => LoginBloc(
  getIt<LoginUseCase>(),
  getIt<FakeLoginUseCase>(),
));

getIt.registerLazySingleton<CommonBloc>(() => CommonBloc(
  getIt<ClearCurrentUserDataUseCase>(),
));
```

---

## 🔗 Tóm Tắt Quan Hệ Giữa Các Layers

```
┌──────────────────────────────────────────────────────────────┐
│                        APP (Presentation)                     │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │ LoginPage   │───→│ LoginBloc   │───→│ CommonBloc      │  │
│  │             │    │ (BLoC)      │    │ (Loading/Error) │  │
│  └─────────────┘    └──────┬──────┘    └─────────────────┘  │
│                            │                                 │
│                            │ uses                            │
│                            ↓                                 │
│  ┌──────────────────────────────────────────────────────┐  │
│  │ AppNavigator ────> AutoRoute                          │  │
│  │ ExceptionHandler ───> Dialogs/Snackbars               │  │
│  └──────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────┘
                              │
                              │ calls
                              ↓
┌──────────────────────────────────────────────────────────────┐
│                        DOMAIN                                │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │ Entity      │    │ UseCase     │    │ Repository (I)  │  │
│  │ (User,Token)│←───│ (Login)     │───→│ (interface)     │  │
│  └─────────────┘    └─────────────┘    └─────────────────┘  │
└──────────────────────────────────────────────────────────────┘
                              │
                              │ implements
                              ↓
┌──────────────────────────────────────────────────────────────┐
│                        DATA                                  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │ RepositoryImpl ──→ AppApiService (GraphQL/REST)      │  │
│  │         │        ──→ AppPreferences (Local)          │  │
│  │         │        ──→ AppDatabase (SQLite)             │  │
│  │         │                                             │  │
│  │         └──→ DataMappers (DTO → Entity)              │  │
│  └──────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────┘
                              │
                              │ uses
                              ↓
┌──────────────────────────────────────────────────────────────┐
│                        SHARED                                │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────┐  │
│  │ Exception   │    │ Result<T>   │    │ DI (get_it)     │  │
│  │ Hierarchy   │    │ runCatching │    │                 │  │
│  └─────────────┘    └─────────────┘    └─────────────────┘  │
└──────────────────────────────────────────────────────────────┘
```

---

## ❓ FAQ - Các câu hỏi thường gặp

### Q: Tại sao có CommonBloc riêng thay vì mỗi BLoC tự quản lý loading?

**A**:
- **Nhiều BLoC có thể loading cùng lúc** (VD: Login đang loading, user navigate sang tab khác, tab đó cũng load data)
- **Tránh circular dependency**: BLoC A cần gọi BLoC B để show loading = phức tạp
- **Consistent behavior**: Tất cả loading/error xử lý giống nhau

### Q: Tại sao dùng UseCase thay vì gọi Repository trực tiếp từ BLoC?

**A**:
- **Separation**: BLoC chỉ lo UI state, UseCase lo business logic
- **Reuse**: Logic login có thể dùng ở nhiều BLoC khác nhau
- **Test**: Test UseCase độc lập, không cần mock BLoC
- **Single Responsibility**: Mỗi class chỉ làm một việc

### Q: Tại sao có Freezed cho các class như CommonState, CommonEvent?

**A**:
- **Immutable**: Không thể thay đổi state sau khi tạo
- **Value equality**: So sánh bằng giá trị, không phải reference
- **Exhaustive matching**: Compiler cảnh báo nếu thiếu case trong switch
- **Auto-generation**: Không cần viết boilerplate code

### Q: EventTransformerMixin dùng để làm gì?

**A**: Kiểm soát cách events được xử lý:
- `throttleTime`: Tránh user click nhiều lần liên tục
- `debounceTime`: Chờ user ngừng gõ (search input)
- `exhaustMap`: Bỏ qua click mới khi đang xử lý click cũ

### Q: Tại sao cần AppNavigator thay vì dùng Navigator trực tiếp?

**A**:
- **Dependency Inversion**: BLoC phụ thuộc interface, không implementation
- **Testability**: Dễ mock navigator trong test
- **Abstraction**: Đổi thư viện navigation không cần sửa BLoC

---

## 🎓 Kết Luận

Project này implement **Clean Architecture + BLoC Pattern** với:

1. **3 Layers rõ ràng**: Domain → Data → App
2. **Shared utilities**: Exception, Result, DI, Utils
3. **Base classes mạnh**: BaseBloc, BaseUseCase giảm boilerplate
4. **Centralized state**: CommonBloc cho loading/error
5. **Type-safe**: Freezed, RouteInfo, strong typing
6. **Testable**: Mọi thứ đều có interface, dễ mock

**Điểm mấu chốt**: Tất cả error handling được centralize thông qua `CommonBloc` → `ExceptionHandler` → `ExceptionMessageMapper`, đảm bảo consistent UX cho user.
