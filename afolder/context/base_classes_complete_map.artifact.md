# 🗺️ BẢN ĐỒ TOÀN BỘ BASE CLASSES

## Tổng Quan

Project này có **17 Base classes** được chia thành **5 nhóm chính**:

```
┌─────────────────────────────────────────────────────────────────┐
│                     BASE CLASSES MAP                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────┐                                               │
│  │ 1. BLoC     │──► BaseBlocEvent, BaseBlocState              │
│  │             │──► BaseBloc, BaseBlocDelegate                 │
│  └─────────────┘                                               │
│          │                                                      │
│          ▼                                                      │
│  ┌─────────────┐                                               │
│  │ 2. UseCase  │──► BaseInput, BaseOutput                      │
│  │             │──► BaseUseCase                                │
│  │             │──► BaseFutureUseCase, BaseSyncUseCase         │
│  │             │──► BaseStreamUseCase, BaseLoadMoreUseCase     │
│  └─────────────┘                                               │
│          │                                                      │
│          ▼                                                      │
│  ┌─────────────┐                                               │
│  │ 3. Data     │──► BaseDataMapper                            │
│  │             │──► BaseSuccessResponseMapper                  │
│  │             │──► BaseErrorResponseMapper                    │
│  │             │──► BaseInterceptor                            │
│  └─────────────┘                                               │
│          │                                                      │
│          ▼                                                      │
│  ┌─────────────┐                                               │
│  │ 4. Nav      │──► BaseRouteInfoMapper                       │
│  │             │──► BasePopupInfoMapper                        │
│  └─────────────┘                                               │
│          │                                                      │
│          ▼                                                      │
│  ┌─────────────┐                                               │
│  │ 5. UI       │──► BasePageState                             │
│  │             │──► BasePageStateDelegate                      │
│  └─────────────┘                                               │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

# 🔷 NHÓM 1: BLoC LAYER

## 1.1 BaseBlocEvent

**File**: `app/lib/base/bloc/base_bloc_event.dart`

```dart
abstract class BaseBlocEvent {
  const BaseBlocEvent();
}
```

| Thông tin | Chi tiết |
|-----------|----------|
| **Vai trò** | Marker class cho tất cả Events |
| **Mục đích** | Type-safe constraint cho Generic `<E extends BaseBlocEvent>` |
| **Cách dùng** | Tất cả Events phải extend nó |

**Ví dụ sử dụng:**
```dart
// Mỗi BLoC có Event riêng
abstract class LoginEvent extends BaseBlocEvent { ... }
abstract class ProfileEvent extends BaseBlocEvent { ... }
abstract class CartEvent extends BaseBlocEvent { ... }
```

---

## 1.2 BaseBlocState

**File**: `app/lib/base/bloc/base_bloc_state.dart`

```dart
abstract class BaseBlocState {
  const BaseBlocState();
}
```

| Thông tin | Chi tiết |
|-----------|----------|
| **Vai trò** | Marker class cho tất cả States |
| **Mục đích** | Type-safe constraint cho Generic `<S extends BaseBlocState>` |
| **Cách dùng** | Tất cả States phải extend nó |

---

## 1.3 BaseBlocDelegate

**File**: `app/lib/base/bloc/base_bloc.dart`

```dart
abstract class BaseBlocDelegate<E extends BaseBlocEvent, S extends BaseBlocState>
    extends Bloc<E, S> {

  // ===== DEPENDENCIES =====
  late final AppNavigator navigator;
  late final AppBloc appBloc;
  late final ExceptionHandler exceptionHandler;
  late final ExceptionMessageMapper exceptionMessageMapper;
  late final DisposeBag disposeBag;
  late final CommonBloc _commonBloc;

  // ===== LOADING =====
  void showLoading() => _commonBloc.add(LoadingVisibilityEmitted(true));
  void hideLoading() => _commonBloc.add(LoadingVisibilityEmitted(false));

  // ===== ERROR =====
  Future<void> addException(AppExceptionWrapper wrapper) async {
    _commonBloc.add(ExceptionEmitted(appExceptionWrapper: wrapper));
    return wrapper.exceptionCompleter?.future;
  }

  // ===== SAFE ADD =====
  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    }
  }
}
```

| Thành phần | Mục đích |
|------------|----------|
| `navigator` | Navigation (push, pop, replace...) |
| `appBloc` | Global app state |
| `exceptionHandler` | Xử lý exception hiển thị dialog/snackbar |
| `exceptionMessageMapper` | Map exception → localized message |
| `disposeBag` | Quản lý cleanup subscriptions |
| `_commonBloc` | Global loading/error state |
| `showLoading/hideLoading` | Toggle loading indicator |
| `addException` | Gửi exception đến CommonBloc |

**Tại sao BaseBlocDelegate tách riêng?**
```
- BaseBlocDelegate: Không có mixins, chỉ có logic core
- BaseBloc: extends Delegate + thêm EventTransformerMixin + LogMixin

→ Mixin không thể có constructor riêng, nên cần tách ra
```

---

## 1.4 BaseBloc

**File**: `app/lib/base/bloc/base_bloc.dart`

```dart
abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S>
    with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);
}
```

| Mixin | Mục đích |
|-------|----------|
| `EventTransformerMixin` | Cung cấp các transformers (throttle, debounce, distinct...) |
| `LogMixin` | Cung cấp methods để log debug info |

---

## 1.5 EventTransformerMixin

**File**: `app/lib/base/bloc/mixin/event_transformer_mixin.dart`

```dart
mixin EventTransformerMixin<E extends BaseBlocEvent, S extends BaseBlocState>
    on BaseBlocDelegate<E, S> {

  // Bỏ qua event trùng lặp
  EventTransformer<Event> distinct<Event>();

  // Bỏ qua events trong khoảng thời gian
  EventTransformer<Event> throttleTime<Event>({Duration duration});

  // Chờ đến khi user ngừng gõ
  EventTransformer<Event> debounceTime<Event>({Duration duration});

  // Bỏ qua events mới khi đang xử lý
  EventTransformer<Event> exhaustMap<Event>();

  // Hủy event cũ, xử lý event mới nhất
  EventTransformer<Event> switchMap<Event>();

  // Chờ event cũ xong rồi mới xử lý event mới
  EventTransformer<Event> asyncExpand<Event>();
}
```

**Minh họa các transformers:**

```
THROTTLE (100ms):     User: a-b-c-d-e    → Handler: a-----d
                      (100ms) (bỏ qua) (100ms) (bỏ qua)

DEBOUNCE (300ms):     User: a-b-c--------d → Handler: a----------d
                      (300ms silence)    (300ms silence)

EXHAUST MAP:          User: a-b-c → Handler: a---(bỏ qua)---(bỏ qua)
                      Chỉ xử lý a, bỏ qua b, c vì a chưa xong

SWITCH MAP:           User: a-----b → Handler: a---(hủy)---b---
                      Hủy a, chỉ xử lý b (event mới nhất)
```

---

# 🔷 NHÓM 2: USE CASE LAYER

## 2.1 BaseInput

**File**: `domain/lib/src/usecase/base/io/base_input.dart`

```dart
abstract class BaseInput {
  const BaseInput();
}
```

| Thông tin | Chi tiết |
|-----------|----------|
| **Vai trò** | Marker class cho Input parameters |
| **Mục đích** | Type-safe constraint `<Input extends BaseInput>` |

**Ví dụ:**
```dart
class LoginInput extends BaseInput {
  final String email;
  final String password;

  const LoginInput({required this.email, required this.password});
}
```

---

## 2.2 BaseOutput

**File**: `domain/lib/src/usecase/base/io/base_output.dart`

```dart
abstract class BaseOutput {
  const BaseOutput();
}
```

| Thông tin | Chi tiết |
|-----------|----------|
| **Vai trò** | Marker class cho Output results |
| **Mục đích** | Type-safe constraint `<Output extends BaseOutput>` |

**Ví dụ:**
```dart
class LoginOutput extends BaseOutput {
  final User user;
  final String token;

  const LoginOutput({required this.user, required this.token});
}
```

---

## 2.3 BaseUseCase

**File**: `domain/lib/src/usecase/base/base_use_case.dart`

```dart
abstract class BaseUseCase<Input extends BaseInput, Output> with LogMixin {
  const BaseUseCase();

  // Method protected - implement ở subclass
  @protected
  Output buildUseCase(Input input);
}
```

| Thành phần | Mục đích |
|------------|----------|
| `<Input extends BaseInput>` | Type-safe cho input |
| `<Output>` | Type-safe cho output |
| `buildUseCase()` | Logic chính, implement ở subclass |
| `LogMixin` | Tự động log input/output |

**Template Method Pattern:**
```
BaseUseCase.execute() ─────► Template (log, error handling)
         │
         │ gọi
         ▼
    buildUseCase() ─────────► Override bởi subclass (logic thật)
```

---

## 2.4 BaseFutureUseCase

**File**: `domain/lib/src/usecase/base/future/base_future_use_case.dart`

```dart
abstract class BaseFutureUseCase<Input extends BaseInput, Output extends BaseOutput>
    extends BaseUseCase<Input, Future<Output>> {
  const BaseFutureUseCase();

  Future<Output> execute(Input input) async {
    try {
      // 1. LOG INPUT
      logD('FutureUseCase Input: $input');

      // 2. GỌI LOGIC
      final output = await buildUseCase(input);

      // 3. LOG OUTPUT
      logD('FutureUseCase Output: $output');

      return output;
    } catch (e) {
      // 4. LOG ERROR
      logE('FutureUseCase Error: $e');

      // 5. WRAP ERROR (đảm bảo luôn là AppException)
      throw e is AppException ? e : AppUncaughtException(e);
    }
  }
}
```

| Đặc điểm | Chi tiết |
|-----------|----------|
| **Output type** | `Future<Output>` - Xử lý async |
| **execute()** | Public method - gọi từ BLoC |
| **buildUseCase()** | Protected - override bởi subclass |

**Flow:**
```
BLoC                    BaseFutureUseCase          Subclass
  │                           │                       │
  │──── execute(input) ─────►│                       │
  │                           │                       │
  │                           │──── buildUseCase ────►│
  │                           │◄──── result ──────────│
  │◄──── result ─────────────│                       │
  │                           │                       │
  │                           │                       │
  │ (Nếu có lỗi)             │                       │
  │                           │──── throw ───────────►│
  │◄── AppException ─────────│                       │
```

---

## 2.5 BaseSyncUseCase

**File**: `domain/lib/src/usecase/base/sync/base_sync_use_case.dart`

```dart
abstract class BaseSyncUseCase<Input extends BaseInput, Output extends BaseOutput>
    extends BaseUseCase<Input, Output> {
  const BaseSyncUseCase();

  Output execute(Input input) {
    try {
      logD('SyncUseCase Input: $input');
      final output = buildUseCase(input);
      logD('SyncUseCase Output: $output');
      return output;
    } catch (e) {
      logE('SyncUseCase Error: $e');
      throw e is AppException ? e : AppUncaughtException(e);
    }
  }
}
```

| Khác với BaseFutureUseCase | Chi tiết |
|---------------------------|----------|
| Output type | `Output` (không có Future) |
| Method | `execute()` không async |
| Dùng khi | Logic đồng bộ (VD: validate, format data) |

**Ví dụ:**
```dart
@Injectable()
class ValidateEmailUseCase extends BaseSyncUseCase<EmailInput, ValidationOutput> {
  @override
  ValidationOutput buildUseCase(EmailInput input) {
    final isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(input.email);

    if (!isValid) {
      throw ValidationException(ValidationExceptionKind.invalidEmail);
    }

    return const ValidationOutput(isValid: true);
  }
}
```

---

## 2.6 BaseStreamUseCase

**File**: `domain/lib/src/usecase/base/stream/base_stream_use_case.dart`

```dart
abstract class BaseStreamUseCase<Input extends BaseInput, Output>
    extends BaseUseCase<Input, Stream<Output>> {
  const BaseStreamUseCase();

  Stream<Output> execute(Input input) {
    return buildUseCase(input).log(runtimeType.toString());
  }
}
```

| Khác với BaseFutureUseCase | Chi tiết |
|---------------------------|----------|
| Output type | `Stream<Output>` - Dữ liệu liên tục |
| Dùng khi | Cần realtime updates (VD: chat, live data) |

**Ví dụ:**
```dart
// Lắng nghe thay đổi user list từ local DB
@Injectable()
class WatchUsersUseCase extends BaseStreamUseCase<NoInput, List<User>> {
  final Repository _repository;

  @override
  Stream<List<User>> buildUseCase(NoInput input) {
    return _repository.getLocalUsersStream();
  }
}
```

---

## 2.7 BaseLoadMoreUseCase

**File**: `domain/lib/src/usecase/base/future/base_load_more_use_case.dart`

```dart
abstract class BaseLoadMoreUseCase<Input extends BaseInput, Output>
    extends BaseUseCase<Input, Future<Output>> {
  const BaseLoadMoreUseCase();

  Future<Output> execute(Input input) async {
    try {
      logD('LoadMoreUseCase Input: $input');
      final output = await buildUseCase(input);
      logD('LoadMoreUseCase Output: $output');
      return output;
    } catch (e) {
      logE('LoadMoreUseCase Error: $e');
      throw e is AppException ? e : AppUncaughtException(e);
    }
  }
}
```

| Khác với BaseFutureUseCase | Chi tiết |
|---------------------------|----------|
| Không yêu cầu `Output extends BaseOutput` | Linh hoạt hơn |
| Dùng khi | Load pagination, load more |

---

## 2.8 BẢNG SO SÁNH USE CASES

| UseCase | Output Type | Async? | Dùng khi |
|---------|-------------|--------|----------|
| `BaseFutureUseCase` | `Future<Output>` | ✅ | API calls, file I/O |
| `BaseSyncUseCase` | `Output` | ❌ | Validate, format data |
| `BaseStreamUseCase` | `Stream<Output>` | ✅ | Realtime updates |
| `BaseLoadMoreUseCase` | `Future<Output>` | ✅ | Pagination |

---

# 🔷 NHÓM 3: DATA LAYER

## 3.1 BaseDataMapper

**File**: `data/lib/src/repository/source/base/base_data_mapper.dart`

```dart
abstract class BaseDataMapper<R, E> {
  const BaseDataMapper();

  // Chuyển Response (API) → Entity (Domain)
  E mapToEntity(R? data);

  // Helper: Map list
  List<E> mapToListEntity(List<R>? listData) {
    return listData?.map(mapToEntity).toList() ?? List.empty();
  }
}

// Optional: Nếu cần map ngược lại
mixin DataMapperMixin<R, E> on BaseDataMapper<R, E> {
  // Chuyển Entity → Data (để lưu local)
  R mapToData(E entity);

  R? mapToNullableData(E? entity);

  List<R> mapToListData(List<E>? listEntity);
}
```

| Tham số | Ý nghĩa |
|---------|----------|
| `R` | Resource (DTO) - từ API/Database |
| `E` | Entity - trong Domain layer |

**Ví dụ:**
```dart
class UserDataMapper extends BaseDataMapper<UserResponse, User> {
  @override
  User mapToEntity(UserResponse? data) {
    return User(
      id: data?.id ?? -1,
      email: data?.email ?? '',
      name: data?.name ?? '',
    );
  }
}

// Sử dụng:
final user = UserDataMapper().mapToEntity(apiResponse);
```

**Tại sao cần Mapper?**

```
┌─────────────────────────────────────────────────────────────┐
│  API trả về                 Domain hiểu                     │
│  ─────────────              ────────────                     │
│  {                           User {                          │
│    "user_id": 123,            id: 123,                      │
│    "email_address": "a@b",     email: "a@b",                 │
│    "fullname": "Nguyen"         name: "Nguyen"                │
│  }                           }                               │
│                                                             │
│  API có thể thay đổi (đổi tên field, đổi format)         │
│  Domain giữ nguyên → CHỈ cần sửa Mapper                    │
└─────────────────────────────────────────────────────────────┘
```

---

## 3.2 BaseSuccessResponseMapper

**File**: `data/lib/src/repository/source/api/mapper/base/base_success_response_mapper.dart`

```dart
abstract class BaseSuccessResponseMapper<I extends Object, O extends Object> {
  const BaseSuccessResponseMapper();

  // Map response từ API → Model
  O? map({
    required dynamic response,
    Decoder<I>? decoder,
  });

  // Implement ở subclass
  O? mapToDataModel({
    required dynamic response,
    Decoder<I>? decoder,
  });
}
```

| Type | Giải thích |
|------|------------|
| `I` | Input type - thường là JSON structure |
| `O` | Output type - Model class |

**Factory Methods cho các loại response:**

```dart
enum SuccessResponseMapperType {
  dataJsonObject,      // { data: { ... } }
  dataJsonArray,       // { data: [ ... ] }
  jsonObject,          // { ... }
  jsonArray,           // [ ... ]
  recordsJsonArray,    // { records: [ ... ] }
  resultsJsonArray,    // { results: [ ... ] }
  plain,               // "text" hoặc số
}
```

**Ví dụ sử dụng:**
```dart
class UserResponseMapper extends BaseSuccessResponseMapper<UserJson, UserModel> {
  @override
  UserModel? mapToDataModel({
    required dynamic response,
    Decoder<UserJson>? decoder,
  }) {
    final json = decoder != null
        ? decoder(response)
        : response as UserJson;

    return UserModel(
      id: json['id'],
      email: json['email'],
    );
  }
}
```

---

## 3.3 BaseErrorResponseMapper

**File**: `data/lib/src/repository/source/api/mapper/base/base_error_response_mapper.dart`

```dart
abstract class BaseErrorResponseMapper<T extends Object> {
  const BaseErrorResponseMapper();

  // Map error response → ServerError
  ServerError mapToServerError(T? errorResponse);
}
```

| Type | Giải thích |
|------|------------|
| `T` | Error response type từ API |

**Factory Methods cho các loại error:**

```dart
enum ErrorResponseMapperType {
  jsonObject,      // {"error": "message"}
  jsonArray,       // ["error1", "error2"]
  line,            // LINE API error format
  twitter,         // Twitter API error format
  goong,           // Goong API error format
  firebaseStorage, // Firebase error format
}
```

---

## 3.4 BaseInterceptor

**File**: `data/lib/src/repository/source/api/middleware/base_interceptor.dart`

```dart
abstract class BaseInterceptor extends InterceptorsWrapper {
  // Priority quyết định thứ tự chạy (cao hơn = chạy trước)
  int get priority;

  // Priorities có sẵn:
  static const basicAuthPriority = 40;
  static const connectivityPriority = 99;
  static const customLogPriority = 1;
  static const headerPriority = 19;
  static const accessTokenPriority = 20;
  static const refreshTokenPriority = 30;
  static const retryOnErrorPriority = 100;
}
```

| Interceptor | Priority | Mục đích |
|-------------|----------|----------|
| `retryOnError` | 100 | Retry khi có lỗi |
| `connectivity` | 99 | Kiểm tra internet |
| `refreshToken` | 30 | Tự động refresh token |
| `accessToken` | 20 | Thêm access token vào header |
| `basicAuth` | 40 | Basic authentication |
| `header` | 19 | Thêm custom headers |

**Ví dụ:**
```dart
class AppInterceptor extends BaseInterceptor {
  @override
  int get priority => basicAuthPriority; // 40

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Thêm auth header
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }
}
```

---

# 🔷 NHÓM 4: NAVIGATION LAYER

## 4.1 BaseRouteInfoMapper

**File**: `app/lib/navigation/base/base_route_info_mapper.dart`

```dart
abstract class BaseRouteInfoMapper {
  // Map AppRouteInfo (type-safe) → PageRouteInfo (AutoRoute)
  PageRouteInfo map(AppRouteInfo appRouteInfo);

  // Helper: Map list
  List<PageRouteInfo> mapList(List<AppRouteInfo> listAppRouteInfo) {
    return listAppRouteInfo.map(map).toList(growable: false);
  }
}
```

| Thông tin | Chi tiết |
|-----------|----------|
| **Vai trò** | Adapter giữa Domain và AutoRoute |
| **Input** | `AppRouteInfo` - type-safe route definitions |
| **Output** | `PageRouteInfo` - AutoRoute format |

**Tại sao cần Mapper này?**

```
┌─────────────────────────────────────────────────────────────┐
│  BLoC chỉ biết:                                           │
│  navigator.push(AppRouteInfo.main())                       │
│                                                             │
│  BLoC KHÔNG biết AutoRoute là gì                          │
│  BLoC KHÔNG cần biết route path là gì                      │
│                                                             │
│  AppRouteInfoMapper chuyển:                                │
│  AppRouteInfo.main() → MainRoute() → /main                  │
│                                                             │
│  → Dependency Inversion: BLoC phụ thuộc interface          │
└─────────────────────────────────────────────────────────────┘
```

---

## 4.2 BasePopupInfoMapper

**File**: `app/lib/navigation/base/base_popup_info_mapper.dart`

```dart
abstract class BasePopupInfoMapper {
  // Map AppPopupInfo → Widget (Dialog, BottomSheet...)
  Widget map(AppPopupInfo appRouteInfo, AppNavigator navigator);
}
```

| Thông tin | Chi tiết |
|-----------|----------|
| **Vai trò** | Map popup info → Widget thực tế |
| **Input** | `AppPopupInfo` - type-safe popup definitions |
| **Output** | `Widget` - Dialog, BottomSheet... |

---

# 🔷 NHÓM 5: UI LAYER

## 5.1 BasePageState

**File**: `app/lib/base/base_page_state.dart`

```dart
abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegate<T, B> {
  // Helper getters
  B get bloc => provider.read<B>();
  S get state => bloc.state as S;

  // Hooks (override nếu cần)
  Widget build(BuildContext context, B bloc, S state);
}
```

| Thành phần | Mục đích |
|------------|----------|
| `T` | Widget type (VD: `LoginPage`) |
| `B` | BLoC type (VD: `LoginBloc`) |
| `bloc` | Getter để access BLoC |
| `state` | Getter để access State |
| `build()` | Override để viết UI |

**Ví dụ sử dụng:**
```dart
@RoutePage()
class LoginPage extends BasePage<LoginBloc> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, LoginBloc bloc, LoginState state) {
    return Scaffold(
      body: TextField(
        onChanged: (v) => bloc.add(EmailChanged(email: v)),
        decoration: InputDecoration(errorText: state.error),
      ),
    );
  }
}
```

---

## 5.2 BasePageStateDelegate

**File**: `app/lib/base/base_page_state.dart`

```dart
abstract class BasePageStateDelegate<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> {
  // Provider để lấy BLoC từ tree
  late final Provider<B> provider;

  // BlocListener để lắng nghe state changes
  late final Provider<BlocListener> listenerProvider;
}
```

---

# 📊 SƠ ĐỒ MỐI QUAN HỆ GIỮA CÁC BASE CLASSES

```
┌───────────────────────────────────────────────────────────────────────┐
│                         APP LAYER                                     │
│                                                                       │
│  ┌─────────────────────────────────────────────────────────────────┐ │
│  │                        BasePageState                             │ │
│  │  (UI widget: build() → Widget)                                   │ │
│  └───────────────────────────┬─────────────────────────────────────┘ │
│                              │                                       │
│                              │ uses                                  │
│                              ▼                                       │
│  ┌─────────────────────────────────────────────────────────────────┐ │
│  │                        BaseBloc                                 │ │
│  │  - BaseBlocDelegate + EventTransformerMixin + LogMixin           │ │
│  │  - add(event) → handle → emit(state)                             │ │
│  └───────────────────────────┬─────────────────────────────────────┘ │
│                              │                                       │
│                              │ calls                                 │
│                              ▼                                       │
│  ┌─────────────────────────────────────────────────────────────────┐ │
│  │                   BaseFutureUseCase                              │ │
│  │  - execute() → buildUseCase() + log + error wrap                │ │
│  └───────────────────────────┬─────────────────────────────────────┘ │
│                              │                                       │
│                              │ calls                                 │
│                              ▼                                       │
│  ┌─────────────────────────────────────────────────────────────────┐ │
│  │                      Repository (interface)                      │ │
│  │  - abstract methods (login, logout, getUser...)                  │ │
│  └───────────────────────────┬─────────────────────────────────────┘ │
│                              │                                       │
│                              │ implements                            │
│                              ▼                                       │
│  ┌─────────────────────────────────────────────────────────────────┐ │
│  │                     RepositoryImpl                              │ │
│  │  - AppApiService (gọi API)                                       │ │
│  │  - AppPreferences (local storage)                                │ │
│  │  - BaseDataMapper (chuyển đổi data)                             │ │
│  └───────────────────────────┬─────────────────────────────────────┘ │
│                              │                                       │
│                              │ uses                                  │
│                              ▼                                       │
│  ┌─────────────────────────────────────────────────────────────────┐ │
│  │                    BaseInterceptor                               │ │
│  │  - onRequest: Thêm headers, auth                                 │ │
│  │  - onResponse: Xử lý response                                   │ │
│  │  - onError: Retry logic                                         │ │
│  └─────────────────────────────────────────────────────────────────┘ │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘
```

---

# 🔄 CÁCH CÁC BASE HOẠT ĐỘNG CÙNG NHAU

## Flow: Login Button Pressed

```
┌─────────────────────────────────────────────────────────────────────────┐
│  1. USER TƯƠNG TÁC                                                      │
│     User nhấn nút Login                                                 │
└─────────────────────────────────────────────────────────────────────────┘
                                 ↓
┌─────────────────────────────────────────────────────────────────────────┐
│  2. UI LAYER (BasePageState)                                           │
│     bloc.add(LoginButtonPressed())                                      │
│                                                                         │
│     @RoutePage()                                                        │
│     class LoginPage extends BasePage<LoginBloc> {                       │
│       Widget build(BuildContext ctx, LoginBloc bloc, LoginState state) {│
│         return ElevatedButton(                                          │
│           onPressed: () => bloc.add(const LoginButtonPressed()),       │
│         );                                                              │
│       }                                                                 │
│     }                                                                   │
└─────────────────────────────────────────────────────────────────────────┘
                                 ↓
┌─────────────────────────────────────────────────────────────────────────┐
│  3. BLoC LAYER (BaseBloc)                                              │
│     Nhận event → Xử lý logic → Emit state                              │
│                                                                         │
│     class LoginBloc extends BaseBloc<LoginEvent, LoginState> {           │
│       on<LoginButtonPressed>(_onLoginPressed);                         │
│                                                                         │
│       FutureOr<void> _onLoginPressed(                                   │
│         LoginButtonPressed event,                                      │
│         Emitter<LoginState> emit,                                      │
│       ) {                                                               │
│         return runBlocCatching(                                         │
│           action: () => _loginUseCase.execute(input),                  │
│         );                                                              │
│       }                                                                 │
│     }                                                                   │
└─────────────────────────────────────────────────────────────────────────┘
                                 ↓
┌─────────────────────────────────────────────────────────────────────────┐
│  4. USE CASE LAYER (BaseFutureUseCase)                                 │
│     Execute với log và error handling                                  │
│                                                                         │
│     class LoginUseCase extends BaseFutureUseCase<LoginInput, LoginOutput│
│       @override                                                         │
│       Future<LoginOutput> buildUseCase(LoginInput input) async {        │
│         await _repository.login(email: input.email, password: input.pw);│
│         return const LoginOutput();                                     │
│       }                                                                 │
│     }                                                                   │
└─────────────────────────────────────────────────────────────────────────┘
                                 ↓
┌─────────────────────────────────────────────────────────────────────────┐
│  5. REPOSITORY (Interface + Implementation)                            │
│     Gọi API, xử lý data                                                │
│                                                                         │
│     abstract class Repository {  // Interface (Domain)                  │
│       Future<void> login({required String email, required String pw}); │
│     }                                                                   │
│                                                                         │
│     class RepositoryImpl implements Repository {  // Data               │
│       final AppApiService _apiService;                                  │
│       final BaseDataMapper _mapper;                                     │
│                                                                         │
│       @override                                                         │
│       Future<void> login({required String email, required String pw}) { │
│         final response = await _apiService.login(email, pw);            │
│         // Mapper chuyển response → entity                              │
│         return _mapper.mapToEntity(response);                           │
│       }                                                                 │
│     }                                                                   │
└─────────────────────────────────────────────────────────────────────────┘
                                 ↓
┌─────────────────────────────────────────────────────────────────────────┐
│  6. API LAYER (Dio + Interceptors)                                    │
│     Gửi HTTP request thực tế                                            │
│                                                                         │
│     Dio _dio = Dio();                                                   │
│     _dio.interceptors.addAll([                                          │
│       AppInterceptor(),     // priority 40 - Auth                        │
│       RefreshTokenInterceptor(), // priority 30                         │
│       RetryInterceptor(),   // priority 100                             │
│     ]);                                                                 │
└─────────────────────────────────────────────────────────────────────────┘
```

---

# 📋 TÓM TẮT: KHI NÀO DÙNG GÌ

| Layer | Base Class | Khi nào dùng |
|-------|-----------|--------------|
| **UI** | `BasePageState` | Tạo Page mới |
| **BLoC** | `BaseBloc` | Tạo BLoC mới |
| **Event** | `BaseBlocEvent` | Tạo Event mới |
| **State** | `BaseBlocState` | Tạo State mới |
| **UseCase** | `BaseFutureUseCase` | API call, async operation |
| **UseCase** | `BaseSyncUseCase` | Validate, format data |
| **UseCase** | `BaseStreamUseCase` | Realtime data (stream) |
| **Input/Output** | `BaseInput/BaseOutput` | Tạo Input/Output class |
| **Mapper** | `BaseDataMapper` | Chuyển DTO ↔ Entity |
| **Mapper** | `BaseSuccessResponseMapper` | Map API success response |
| **Mapper** | `BaseErrorResponseMapper` | Map API error response |
| **Interceptor** | `BaseInterceptor` | Xử lý HTTP request/response |
| **Navigation** | `BaseRouteInfoMapper` | Map route info → AutoRoute |
| **Navigation** | `BasePopupInfoMapper` | Map popup info → Widget |

---

# ❓ CHECKLIST: TẠO FEATURE MỚI

Khi tạo feature mới, cần tạo những class nào:

```
□ 1. UI Layer
   □ Page: extends BasePage<Bloc>
   □ Widget con nếu cần

□ 2. BLoC Layer
   □ Event: extends BaseBlocEvent
   □ State: extends BaseBlocState
   □ Bloc: extends BaseBloc<Event, State>

□ 3. UseCase Layer
   □ Input: extends BaseInput
   □ Output: extends BaseOutput
   □ UseCase: extends BaseFutureUseCase<Input, Output>

□ 4. Data Layer
   □ DTO/Response model
   □ Mapper: extends BaseDataMapper<Response, Entity>
   □ Repository method (trong Repository interface)
   □ RepositoryImpl method

□ 5. Navigation
   □ RouteInfo (nếu cần custom route)
   □ Mapper (thường đã có base)
```

---

Bạn muốn tôi đi sâu hơn vào phần nào không? Ví dụ:
1. Chi tiết về Repository và Data layer
2. Chi tiết về Navigation system
3. Chi tiết về Exception handling flow
