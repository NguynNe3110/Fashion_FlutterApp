# 🎯 Hướng Dẫn Đọc Project Flutter BLoC Clean - Đi Sâu Từng Layer

## Cách Đọc Document Này

Mỗi section sẽ có cấu trúc:
```
1. LÝ THUYẾT - Giải thích KHÁI NIỆM
2. DẪN CHỨNG - Code CỤ THỂ từ project này
3. PHÂN TÍCH - Giải thích TẠI SAO code viết như vậy
4. BÀI TẬP - Để bạn tự kiểm tra
```

---

# 🔷 LEVEL 4: BLoC PATTERN - "Nó giải quyết vấn đề gì?"

## 4.1 LÝ THUYẾT

### Vấn đề: UI phải tự quản lý state

```dart
// ❌ Cách cũ: State nằm trong StatefulWidget
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool isLoading = false;
  String? error;

  // Cứ thêm feature = thêm biến
  bool obscureText = true;
  bool rememberMe = false;
  // ...
}
```

### 😱 Vấn đề gặp phải:
- **State phức tạp**: Nhiều biến, khó quản lý
- **Logic rải rác**: Validation ở đâu, API call ở đâu, navigation ở đâu
- **Test khó**: Muốn test logic phải render cả widget

### 💡 Giải pháp: BLoC tách State ra khỏi UI

```
UI (Widget)          BLoC (Logic)
    │                    │
    │  add(event) ───────┤
    │                    │
    │                    │ Xử lý logic
    │                    │
    │◄──── emit(state) ──┤
    │                    │
 Hiển thị           KHÔNG LO
```

---

## 4.2 DẪN CHỨNG TỪ PROJECT

### File: [login_event.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/ui/login/bloc/login_event.dart)

```dart
part 'login_event.freezed.dart';

abstract class LoginEvent extends BaseBlocEvent {
  const LoginEvent();
}

// Mỗi event = MỘT hành động của user
@freezed
sealed class EmailTextFieldChanged extends LoginEvent with _$EmailTextFieldChanged {
  const factory EmailTextFieldChanged({required String email}) = _EmailTextFieldChanged;
}

@freezed
sealed class PasswordTextFieldChanged extends LoginEvent with _$PasswordTextFieldChanged {
  const factory PasswordTextFieldChanged({required String password}) = _PasswordTextFieldChanged;
}

@freezed
class LoginButtonPressed extends LoginEvent with _$LoginButtonPressed {
  const factory LoginButtonPressed() = _LoginButtonPressed;
}
```

### 📍 PHÂN TÍCH:

**Tại sao mỗi action lại là một Event riêng?**

| Event | User làm gì | Tại sao cần riêng |
|-------|-------------|-------------------|
| `EmailTextFieldChanged` | Gõ vào ô email | Cần clear error khi user bắt đầu gõ lại |
| `PasswordTextFieldChanged` | Gõ vào ô password | Tương tự |
| `LoginButtonPressed` | Bấm nút Login | Trigger API call |

**Tại sao dùng Freezed?**

```dart
// Thay vì viết class thủ công:
class EmailTextFieldChanged extends LoginEvent {
  final String email;
  EmailTextFieldChanged(this.email);

  @override
  bool operator ==(Object other) =>
    other is EmailTextFieldChanged && other.email == email;
}

// Freezed TỰ ĐỘNG tạo:
// - Constructor với const
// - == và hashCode
// - copyWith()
// - toString()
```

---

### File: [login_state.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/ui/login/bloc/login_state.dart)

```dart
part 'login_state.freezed.dart';

@freezed
sealed class LoginState extends BaseBlocState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(true) bool isLoginButtonEnabled,
    @Default(true) bool obscureText,
    @Default('') String onPageError,
  }) = _LoginState;
}
```

### 📍 PHÂN TÍCH:

**Tại sao State phải là IMMUTABLE?**

```dart
// ❌ CÁCH SAI: Mutable state
class LoginState {
  String email = '';
  void setEmail(String e) { email = e; } // Có thể thay đổi bất cứ lúc nào
}

// ✅ CÁCH ĐÚNG: Immutable state (via Freezed)
class LoginState {
  final String email;
  // email là final, không thể thay đổi trực tiếp
}

// Muốn thay đổi → tạo object MỚI
state.copyWith(email: 'new@email.com'); // Trả về state MỚI
```

**Lợi ích của Immutable:**
1. **Predictable**: State không bị thay đổi ngầm ở đâu đó
2. **Debug easy**: Biết chính xác state thay đổi ở đâu
3. **Performance**: Flutter so sánh state bằng `==`, nhanh hơn reference

---

### File: [login_bloc.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/ui/login/bloc/login_bloc.dart)

```dart
@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase, this._fakeLoginUseCase) : super(const LoginState()) {
    // ĐĂNG KÝ EVENT HANDLERS
    on<EmailTextFieldChanged>(
      _onEmailTextFieldChanged,
      transformer: distinct(),  // Bỏ qua nếu email giống như lần trước
    );

    on<PasswordTextFieldChanged>(
      _onPasswordTextFieldChanged,
      transformer: distinct(),
    );

    on<LoginButtonPressed>(
      _onLoginButtonPressed,
      transformer: log(),  // Log để debug
    );
  }

  // Inject dependencies (sẽ giải thích sau)
  final LoginUseCase _loginUseCase;
  final FakeLoginUseCase _fakeLoginUseCase;

  // ========== EVENT HANDLERS ==========

  void _onEmailTextFieldChanged(
    EmailTextFieldChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      email: event.email,
      isLoginButtonEnabled: _isLoginButtonEnabled(event.email, state.password),
      onPageError: '',  // Clear error khi user gõ lại
    ));
  }

  void _onPasswordTextFieldChanged(
    PasswordTextFieldChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      password: event.password,
      isLoginButtonEnabled: _isLoginButtonEnabled(state.email, event.password),
      onPageError: '',
    ));
  }

  FutureOr<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) {
    return runBlocCatching(  // Wrapper xử lý error (sẽ giải thích ở Level 7)
      action: () async {
        await _loginUseCase.execute(
          LoginInput(email: state.email, password: state.password),
        );
        await navigator.replace(const AppRouteInfo.main());
      },
      handleError: false,  // Override: hiển thị error ở form, không phải dialog
      doOnError: (e) async {
        emit(state.copyWith(onPageError: exceptionMessageMapper.map(e)));
      },
    );
  }

  bool _isLoginButtonEnabled(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
```

### 📍 PHÂN TÍCH CHI TIẾT:

#### 1. Cấu trúc BLoC

```dart
class LoginBloc extends BaseBloc<LoginEvent, LoginState>
```

- `BaseBloc<LoginEvent, LoginState>`: LoginBloc chỉ nhận LoginEvent và trả về LoginState
- **Generic constraint**: Type-safe, không nhầm lẫn event/state giữa các BLoC

#### 2. Đăng ký Event Handler

```dart
on<EmailTextFieldChanged>(
  _onEmailTextFieldChanged,
  transformer: distinct(),
)
```

| Phần | Ý nghĩa |
|------|----------|
| `on<EmailTextFieldChanged>` | Khi có event này |
| `_onEmailTextFieldChanged` | Gọi handler này |
| `transformer: distinct()` | Bỏ qua nếu email không đổi |

#### 3. Transformer chi tiết

```dart
// Event: user gõ "a" → "ab" → "abc" (3 lần trong 100ms)

// WITHOUT distinct():
// Handler gọi 3 lần → 3 lần emit state → UI rebuild 3 lần

// WITH distinct():
// Handler gọi 1 lần (event cuối cùng) → 1 lần emit state → UI rebuild 1 lần
```

#### 4. Emitter - Cách update state

```dart
emit(state.copyWith(
  email: event.email,
  onPageError: '',  // Clear error
));
```

**⚠️ QUAN TRỌNG**: `emit()` phải được gọi ĐỒNG BỘ trong handler. Nếu cần async:

```dart
FutureOr<void> _onLoginButtonPressed(...) async {
  // Xử lý async
  await someAsyncOperation();
  emit(newState);  // Emit sau khi async xong
}
```

---

## 4.3 UI KẾT NỐI VỚI BLoC

### File: [login_page.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/ui/login/login_page.dart)

```dart
@RoutePage()
class LoginPage extends BasePage<LoginBloc> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, LoginBloc bloc, LoginState state) {
    return Scaffold(
      body: Column(
        children: [
          // ===== EMAIL TEXT FIELD =====
          TextField(
            onChanged: (value) => bloc.add(EmailTextFieldChanged(email: value)),
            decoration: InputDecoration(
              errorText: state.onPageError.isEmpty ? null : state.onPageError,
            ),
          ),

          // ===== PASSWORD TEXT FIELD =====
          TextField(
            obscureText: state.obscureText,
            onChanged: (value) => bloc.add(PasswordTextFieldChanged(password: value)),
          ),

          // ===== LOGIN BUTTON =====
          ElevatedButton(
            onPressed: state.isLoginButtonEnabled
                ? () => bloc.add(const LoginButtonPressed())
                : null,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
```

### 📍 PHÂN TÍCH:

**UI chỉ làm 3 việc:**
1. `bloc.add(...)` - Gửi event khi user tương tác
2. `state.xxx` - Hiển thị state hiện tại
3. `bloc.xxx` - Lấy methods (nếu cần)

**UI KHÔNG BAO GIỜ làm:**
- ❌ Gọi API trực tiếp
- ❌ Xử lý business logic
- ❌ Validate data

---

## 4.4 BÀI TẬP TỰ KIỂM TRA

### ❓ Câu hỏi 1:
Trong `LoginBloc`, tại sao `_onEmailTextFieldChanged` lại có `transformer: distinct()`?

### ❓ Câu hỏi 2:
Khi user gõ email, thứ tự xử lý là gì?
```
A. User gõ → UI gọi bloc.add → BLoC handler → emit new state → UI rebuild
B. User gõ → BLoC handler → UI gọi bloc.add → emit new state → UI rebuild
```

### ❓ Câu hỏi 3:
Tại sao `onPageError` được set `''` khi user bắt đầu gõ?

### ✅ Đáp án (thử suy nghĩ trước khi xem):

<details>
<summary>Click để xem đáp án</summary>

**Câu 1**: `distinct()` bỏ qua event trùng lặp. User gõ nhiều lần → chỉ xử lý event cuối cùng → tránh emit state liên tục → UI không bị lag.

**Câu 2**: A. User tương tác → UI gửi event → BLoC xử lý → emit state → UI rebuild.

**Câu 3**: Khi user bắt đầu gõ lại, error cũ không còn valid nữa → clear error để user thấy input field trống, không bị confuse với error cũ.

</details>

---

# 🔷 LEVEL 5: USE CASE - "Tại sao không gọi Repository trực tiếp?"

## 5.1 LÝ THUYẾT

### Vấn đề: BLoC gọi Repository trực tiếp

```dart
// ❌ Trong BLoC
class LoginBloc {
  final Repository repo;

  Future<void> onLoginPressed() async {
    try {
      await repo.login(email, password);  // BLoC biết quá nhiều
      // Repository có method gì, param gì, throw exception gì...
    } catch (e) {
      // Xử lý error
    }
  }
}
```

### 😱 Vấn đề:
- **BLoC phình to**: Chứa cả logic nghiệp vụ
- **Khó test**: Muốn test BLoC phải mock Repository phức tạp
- **Không reuse**: Logic login ở BLoC A, muốn dùng ở BLoC B phải copy

### 💡 Giải pháp: UseCase

```
BLoC          UseCase         Repository
  │              │                │
  │──────────────┤                │
  │  execute()   │                │
  │──────────────►                │
  │              │───────────────► │
  │              │  Gọi API       │
  │              │◄───────────────│
  │◄─────────────│                │
  │  Trả kết quả │                │
  │              │                │
```

---

## 5.2 DẪN CHỨNG TỪ PROJECT

### File: [base_use_case.dart](file:///D:/AppData/Code/flutter_bloc_clean/domain/lib/src/usecase/base/base_use_case.dart)

```dart
abstract class BaseUseCase<Input extends BaseInput, Output> with LogMixin {
  const BaseUseCase();

  // Method protected - chỉ subclass được override
  @protected
  Output buildUseCase(Input input);
}
```

### 📍 PHÂN TÍCH:

**BaseUseCase có gì?**

| Thành phần | Ý nghĩa |
|------------|----------|
| `<Input, Output>` | Generic - Input gì, Output gì |
| `Input extends BaseInput` | Input phải inherit từ BaseInput |
| `buildUseCase()` protected | Logic chính, implement ở subclass |
| `LogMixin` | Tự động log input/output để debug |

---

### File: [base_future_use_case.dart](file:///D:/AppData/Code/flutter_bloc_clean/domain/lib/src/usecase/base/future/base_future_use_case.dart)

```dart
abstract class BaseFutureUseCase<Input extends BaseInput, Output extends BaseOutput>
    extends BaseUseCase<Input, Future<Output>> {
  const BaseFutureUseCase();

  // Execute là method PUBLIC - gọi từ BLoC
  Future<Output> execute(Input input) async {
    try {
      if (LogConfig.enableLogUseCaseInput) {
        logD('FutureUseCase Input: $input');
      }

      final output = await buildUseCase(input);  // Gọi logic con

      if (LogConfig.enableLogUseCaseOutput) {
        logD('FutureUseCase Output: $output');
      }

      return output;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        logE('FutureUseCase Error: $e');
      }
      // Đảm bảo luôn throw AppException (không throw raw exception)
      throw e is AppException ? e : AppUncaughtException(e);
    }
  }
}
```

### 📍 PHÂN TÍCH CHI TIẾT:

**Tại sao `execute()` lại wrap `buildUseCase()`?**

```dart
// Đây là TEMPLATE METHOD PATTERN
Future<Output> execute(Input input) async {
  // 1. LOG INPUT
  log('Input: $input');

  // 2. GỌI LOGIC CHÍNH
  final output = await buildUseCase(input);  // Override bởi subclass

  // 3. LOG OUTPUT
  log('Output: $output');

  // 4. HANDLE ERROR
  throw e is AppException ? e : AppUncaughtException(e);

  // → Mỗi UseCase con chỉ cần viết logic ở buildUseCase()
  // → Log và error handling được reuse
}
```

---

### File: [login_use_case.dart](file:///D:/AppData/Code/flutter_bloc_clean/domain/lib/src/usecase/login_use_case.dart)

```dart
@Injectable()
class LoginUseCase extends BaseFutureUseCase<LoginInput, LoginOutput> {
  const LoginUseCase(this._repository);

  // Dependency (inject bởi DI)
  final Repository _repository;

  // Chỉ implement business logic
  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    await _repository.login(
      email: input.email,
      password: input.password,
    );

    // Return output (LoginOutput có thể chứa user info, token, etc)
    return const LoginOutput();
  }
}
```

### 📍 PHÂN TÍCH:

**So sánh: Gọi Repository trực tiếp vs qua UseCase**

```dart
// ❌ GỌI TRỰC TIẾP (trong BLoC)
await repo.login(email: email, password: password);
await navigator.replace('/home');

// ✅ QUA USE CASE (trong BLoC)
await _loginUseCase.execute(LoginInput(email: email, password: password));
await navigator.replace('/home');

// Khác nhau:
// - BLoC KHÔNG cần biết repository có method gì
// - BLoC KHÔNG cần biết params của repository
// - BLoC chỉ biết: "Có LoginUseCase để login"
// - Nếu cần thay đổi cách login (VD: thêm 2FA), chỉ sửa UseCase
```

**LoginInput và LoginOutput là gì?**

```dart
// Input: Dữ liệu cần thiết để login
class LoginInput extends BaseInput {
  final String email;
  final String password;
}

// Output: Kết quả sau khi login thành công
class LoginOutput extends BaseOutput {
  // Có thể chứa user info, token, etc
  // Trong trường hợp này, login thành công = void (không cần data)
}
```

---

## 5.3 INPUT/OUTPUT PATTERN

### File: [base_input.dart](file:///D:/AppData/Code/flutter_bloc_clean/shared/lib/src/model/base/base_input.dart)

```dart
// Đây là marker class - không có logic gì
// Chỉ để type-safe
abstract class BaseInput {}

abstract class BaseOutput {}
```

### 📍 PHÂN TÍCH:

**Tại sao cần Input/Output classes?**

```dart
// ❌ KHÔNG có Input/Output
class LoginUseCase extends BaseFutureUseCase<String, bool> {
  // String là gì? email hay password?
  // bool là success hay có data gì?
}

await _loginUseCase.execute('abc@email.com'); // Gọi sai param?

// ✅ CÓ Input/Output
class LoginUseCase extends BaseFutureUseCase<LoginInput, LoginOutput> {
  // Rõ ràng: Input là gì, Output là gì
}

await _loginUseCase.execute(LoginInput(email: '...', password: '...'));
// Compile time error nếu thiếu param
```

**Lợi ích:**
1. **Self-documenting**: Đọc signature là hiểu UseCase làm gì
2. **Type-safe**: Compiler cảnh báo nếu thiếu/thừa param
3. **Extensible**: Thêm param mới dễ dàng, không break existing code

---

## 5.4 BÀI TẬP

### ❓ Câu hỏi 1:
Tại sao `buildUseCase()` là `protected` mà `execute()` là public?

### ❓ Câu hỏi 2:
Trong `LoginUseCase`, nếu muốn thêm "remember me" feature, cần thay đổi gì?

### ❓ Câu hỏi 3:
Tại sao `buildUseCase()` catch exception và wrap thành `AppUncaughtException`?

<details>
<summary>Đáp án</summary>

**Câu 1**: `execute()` là public vì BLoC (bên ngoài) gọi nó. `buildUseCase()` là protected vì chỉ nội bộ UseCase được override.

**Câu 2**: Thêm param vào `LoginInput`:
```dart
class LoginInput extends BaseInput {
  final String email;
  final String password;
  final bool rememberMe;  // Thêm mới
}
```
BLoC và UI cần update để truyền giá trị này.

**Câu 3**: Đảm bảo tất cả exception đều là `AppException` → ExceptionHandler xử lý được. Nếu throw raw `Exception`, handler không biết cách xử lý.

</details>

---

# 🔷 LEVEL 6: GENERICS - "Tránh lặp code như thế nào?"

## 6.1 LÝ THUYẾT

### Vấn đề: Mỗi BLoC đều cần common functionality

```dart
// Tất cả BLoC đều cần:
// - add(event) với null check
// - showLoading() / hideLoading()
// - runBlocCatching()
// - navigation

class LoginBloc {
  void add(LoginEvent event) {
    if (!isClosed) {
      super.add(event);
    }
  }
}

class ProfileBloc {
  void add(ProfileEvent event) {
    if (!isClosed) {
      super.add(event);
    }
  }
}

class SettingsBloc {
  void add(SettingsEvent event) { ... }  // Lặp lại!
}
```

### 💡 Giải pháp: BaseBloc với Generics

```dart
abstract class BaseBloc<E extends BaseEvent, S extends BaseState> {
  // Tất cả common functionality ở đây
  // Mỗi BLoC chỉ cần extend và override cái riêng
}
```

---

## 6.2 DẪN CHỨNG TỪ PROJECT

### File: [base_bloc.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/base/bloc/base_bloc.dart)

```dart
// BaseBlocDelegate chứa tất cả common functionality
abstract class BaseBlocDelegate<E extends BaseBlocEvent, S extends BaseBlocState>
    extends Bloc<E, S> {

  // ===== DEPENDENCIES =====
  // Được inject bởi DI (sẽ giải thích sau)
  late final AppNavigator navigator;
  late final AppBloc appBloc;
  late final ExceptionHandler exceptionHandler;
  late final ExceptionMessageMapper exceptionMessageMapper;
  late final DisposeBag disposeBag;
  late final CommonBloc _commonBloc;

  // ===== LOADING MANAGEMENT =====
  void showLoading() {
    _commonBloc.add(const LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    _commonBloc.add(const LoadingVisibilityEmitted(isLoading: false));
  }

  // ===== ERROR HANDLING =====
  Future<void> addException(AppExceptionWrapper appExceptionWrapper) async {
    _commonBloc.add(ExceptionEmitted(
      appExceptionWrapper: appExceptionWrapper,
    ));
    return appExceptionWrapper.exceptionCompleter?.future;
  }

  // ===== SAFE ADD EVENT =====
  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      Log.e('Cannot add new event $event because $runtimeType was closed');
    }
  }
}

// BaseBloc extend BaseBlocDelegate và thêm mixins
abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S>
    with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);
}
```

### 📍 PHÂN TÍCH CHI TIẾT:

#### 1. Tại sao có 2 lớp: `BaseBloc` và `BaseBlocDelegate`?

```dart
// ❌ CÁCH 1: Tất cả trong BaseBloc
abstract class BaseBloc<E, S> extends Bloc<E, S> {
  late final AppNavigator navigator;
  late final CommonBloc commonBloc;
  // ... 200 lines code
}

// ✅ CÁCH 2: BaseBlocDelegate (không có mixins)
abstract class BaseBlocDelegate<E, S> extends Bloc<E, S> {
  // Chỉ chứa logic chính
}

// BaseBloc (có mixins)
abstract class BaseBloc<E, S> extends BaseBlocDelegate<E, S>
    with EventTransformerMixin, LogMixin {
  // Mixins thêm functionality
}
```

**Lý do**: Mixin không thể có constructor riêng. `BaseBlocDelegate` có thể nhận `super.initialState`.

#### 2. `late final` - Lazy initialization

```dart
late final AppNavigator navigator;
late final CommonBloc _commonBloc;
```

**Tại sao dùng `late`?**

```dart
// ❌ KHÔNG dùng late
class BaseBloc {
  final AppNavigator navigator;  // Phải khởi tạo ngay
  BaseBloc() : navigator = AppNavigator();  // Gây khó khăn cho DI
}

// ✅ DÙNG late
class BaseBloc {
  late final AppNavigator navigator;  // Khởi tạo sau
  // DI sẽ assign sau khi create instance
}
```

#### 3. `commonBloc` getter đặc biệt

```dart
late final CommonBloc _commonBloc;

set commonBloc(CommonBloc commonBloc) {
  _commonBloc = commonBloc;
}

CommonBloc get commonBloc =>
    this is CommonBloc ? this as CommonBloc : _commonBloc;
```

**Tại sao cần logic này?**

```dart
// CommonBloc cũng extend BaseBloc
// Khi CommonBloc gọi commonBloc, nó muốn lấy chính nó
// Khi LoginBloc gọi commonBloc, nó muốn lấy CommonBloc bên ngoài

class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  // Khi CommonBloc gọi commonBloc:
  // this is CommonBloc == true → return this
  // → Lấy chính nó

  void someMethod() {
    commonBloc.add(...);  // Gọi chính nó
  }
}

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  void someMethod() {
    commonBloc.add(...);  // Gọi CommonBloc bên ngoài
    // this is CommonBloc == false → return _commonBloc
  }
}
```

---

### File: [base_bloc_event.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/base/bloc/base_bloc_event.dart)

```dart
abstract class BaseBlocEvent {
  const BaseBlocEvent();
}
```

### 📍 PHÂN TÍCH:

**BaseBlocEvent chỉ là marker**

```dart
// Tất cả Events phải extend BaseBlocEvent
abstract class LoginEvent extends BaseBlocEvent { ... }
abstract class ProfileEvent extends BaseBlocEvent { ... }

// Điều này cho phép:
BaseBloc<BaseBlocEvent, BaseBlocState> bloc;  // Wildcard usage

// Hoặc trong Generic constraints:
class Bloc<E extends BaseBlocEvent, S extends BaseBlocState>
```

---

### File: [base_bloc_state.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/base/bloc/base_bloc_state.dart)

```dart
abstract class BaseBlocState {
  const BaseBlocState();
}
```

**Tương tự BaseBlocEvent** - chỉ là marker để constraint generics.

---

## 6.3 GENERICS TRONG THỰC TẾ

### Ví dụ: BLoC khác nhau với cùng BaseBloc

```dart
// LoginBloc
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  // LoginEvent + LoginState
}

// ProfileBloc
class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  // ProfileEvent + ProfileState
}

// CartBloc
class CartBloc extends BaseBloc<CartEvent, CartState> {
  // CartEvent + CartState
}

// → Tất cả đều có:
// - showLoading() / hideLoading()
// - runBlocCatching()
// - navigation
// - exceptionHandler
// → KHÔNG cần viết lại!
```

---

# 🔷 LEVEL 7: COMMON BLOC - "Gom những cái CHUNG"

## 7.1 VẤN ĐỀ THỰC TẾ

### ❌ Mỗi BLoC tự quản lý loading và error

```dart
class LoginBloc {
  Future<void> onLoginPressed() async {
    try {
      state = state.copyWith(isLoading: true);  // Tự quản lý
      await repo.login();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e);
    }
  }
}

class ProfileBloc {
  Future<void> onLoadProfile() async {
    try {
      state = state.copyWith(isLoading: true);  // Lặp lại code
      await repo.getProfile();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e);  // Lặp lại
    }
  }
}
```

### 😱 Vấn đề gặp phải:
1. **Code lặp lại** ở mọi BLoC
2. **Inconsistent**: BLoC A hiển thị loading ở form, BLoC B hiển thị ở dialog
3. **Khó quản lý chung**: Muốn disable all loading khi app background?

### 💡 Giải pháp: CommonBloc

```
┌─────────────────────────────────────────────┐
│                  APP                         │
│  ┌─────────┐                               │
│  │ LoginBloc│──┐                          │
│  └─────────┘  │                            │
│  ┌─────────┐  │    ┌──────────────┐        │
│  │ProfileBloc│──┼──►│ CommonBloc  │        │
│  └─────────┘  │    │ - isLoading  │        │
│  ┌─────────┐  │    │ - exception  │        │
│  │CartBloc │──┘    └──────────────┘        │
│  └─────────┘          │                    │
│                       │                    │
│   Tất cả BLoC gửi    │                    │
│   event đến          │                    │
│   CommonBloc         ▼                    │
│              ┌─────────────┐              │
│              │ UI Listener │              │
│              │ - Loading   │              │
│              │ - Error     │              │
│              └─────────────┘              │
└─────────────────────────────────────────────┘
```

---

## 7.2 DẪN CHỨNG TỪ PROJECT

### File: [common_event.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/base/bloc/common/common_event.dart)

```dart
part 'common_event.freezed.dart';

abstract class CommonEvent extends BaseBlocEvent {
  const CommonEvent();
}

// ===== LOADING EVENT =====
@freezed
sealed class LoadingVisibilityEmitted extends CommonEvent with _$LoadingVisibilityEmitted {
  const LoadingVisibilityEmitted._();
  const factory LoadingVisibilityEmitted({
    required bool isLoading,
  }) = _LoadingVisibilityEmitted;
}

// ===== EXCEPTION EVENT =====
@freezed
sealed class ExceptionEmitted extends CommonEvent with _$ExceptionEmitted {
  const ExceptionEmitted._();
  const factory ExceptionEmitted({
    required AppExceptionWrapper appExceptionWrapper,
  }) = _ExceptionEmitted;
}

// ===== FORCE LOGOUT EVENT =====
@freezed
sealed class ForceLogoutButtonPressed extends CommonEvent with _$ForceLogoutButtonPressed {
  const factory ForceLogoutButtonPressed() = _ForceLogoutButtonPressed;
}
```

### 📍 PHÂN TÍCH:

**3 loại event trong CommonBloc:**

| Event | Khi nào được gọi | Mục đích |
|-------|------------------|----------|
| `LoadingVisibilityEmitted` | Khi BLoC muốn show/hide loading | Toggle loading indicator |
| `ExceptionEmitted` | Khi có exception cần hiển thị | Show error dialog/snackbar |
| `ForceLogoutButtonPressed` | Khi user bấm nút logout trong error dialog | Clear session + navigate to login |

---

### File: [common_state.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/base/bloc/common/common_state.dart)

```dart
part 'common_state.freezed.dart';

@freezed
sealed class CommonState extends BaseBlocState with _$CommonState {
  const CommonState._();
  const factory CommonState({
    AppExceptionWrapper? appExceptionWrapper,
    @Default(0) int loadingCount,
    @Default(false) bool isLoading,
  }) = _CommonState;
}
```

### 📍 PHÂN TÍCH CHI TIẾT:

**Tại sao `loadingCount` thay vì `isLoading: bool`?**

```dart
// ❌ Dùng bool
bool isLoading;

// Vấn đề:
// 1. LoginBloc.startLoading() → isLoading = true
// 2. Trong khi đó, ProfileBloc cũng.startLoading()
// 3. ProfileBloc.hideLoading() → isLoading = false
// 4. LoginBloc vẫn đang loading! Nhưng isLoading = false!
```

```dart
// ✅ Dùng int count
int loadingCount;

// Logic:
// 1. LoginBloc.startLoading() → count = 1, isLoading = (count > 0) = true
// 2. ProfileBloc.startLoading() → count = 2, isLoading = true
// 3. ProfileBloc.hideLoading() → count = 1, isLoading = true
// 4. LoginBloc.hideLoading() → count = 0, isLoading = false
// → Đúng! isLoading chỉ false khi TẤT CẢ requests hoàn thành
```

**Tại sao cần `appExceptionWrapper` nullable?**

```dart
AppExceptionWrapper? appExceptionWrapper;
// null = không có exception
// not null = có exception đang hiển thị
```

---

### File: [common_bloc.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/base/bloc/common/common_bloc.dart)

```dart
@Injectable()
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc(this._clearCurrentUserDataUseCase) : super(const CommonState()) {
    on<LoadingVisibilityEmitted>(
      _onLoadingVisibilityEmitted,
      transformer: log(),
    );

    on<ExceptionEmitted>(
      _onExceptionEmitted,
      transformer: log(),
    );

    on<ForceLogoutButtonPressed>(
      _onForceLogoutButtonPressed,
      transformer: log(),
    );
  }

  final ClearCurrentUserDataUseCase _clearCurrentUserDataUseCase;

  // ===== LOADING HANDLER =====
  FutureOr<void> _onLoadingVisibilityEmitted(
    LoadingVisibilityEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(
      isLoading: state.loadingCount == 0 && event.isLoading
          ? true
          : state.loadingCount == 1 && !event.isLoading || state.loadingCount <= 0
              ? false
              : state.isLoading,
      loadingCount: event.isLoading
          ? state.loadingCount.plus(1)   // Tăng count khi show
          : state.loadingCount.minus(1), // Giảm count khi hide
    ));
  }

  // ===== EXCEPTION HANDLER =====
  FutureOr<void> _onExceptionEmitted(
    ExceptionEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(appExceptionWrapper: event.appExceptionWrapper));
  }

  // ===== FORCE LOGOUT HANDLER =====
  FutureOr<void> _onForceLogoutButtonPressed(
    ForceLogoutButtonPressed event,
    Emitter<CommonState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await _clearCurrentUserDataUseCase.execute(const ClearCurrentUserDataInput());
        await navigator.replace(const AppRouteInfo.login());
      },
    );
  }
}
```

### 📍 PHÂN TÍCH CHI TIẾT:

#### Logic loadingCount

```dart
// Khi event.isLoading = true (show loading):
// - count tăng lên 1
// - Nếu count trước đó = 0 → isLoading = true

// Khi event.isLoading = false (hide loading):
// - count giảm đi 1
// - Nếu count sau khi giảm = 0 → isLoading = false
```

**Tại sao dùng `.plus(1)` và `.minus(1)` thay vì `+1` và `-1`?**

```dart
// Trong project có extension:
extension IntExtension on int {
  int plus(int value) => this + value;
  int minus(int value) => this - value;
}

// Đây là IMMUTABLE operation
// int là immutable trong Dart
// state.loadingCount + 1 không thay đổi state.loadingCount
// Cần: state.loadingCount.plus(1) → trả về int MỚI
```

---

## 7.3 runBlocCatching - CỐT LÕI CỦA ERROR HANDLING

### File: [base_bloc.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/base/bloc/base_bloc.dart) - Method runBlocCatching

```dart
Future<void> runBlocCatching({
  required Future<void> Function() action,
  Future<void> Function()? doOnRetry,
  Future<void> Function(AppException)? doOnError,
  Future<void> Function()? doOnSubscribe,
  Future<void> Function()? doOnSuccessOrError,
  Future<void> Function()? doOnEventCompleted,
  bool handleLoading = true,
  bool handleError = true,
  bool handleRetry = true,
  bool Function(AppException)? forceHandleError,
  String? overrideErrorMessage,
  int? maxRetries,
}) async {
  assert(maxRetries == null || maxRetries > 0, 'maxRetries must be positive');
  Completer<void>? recursion;

  try {
    // 1. Callback trước khi bắt đầu
    await doOnSubscribe?.call();

    // 2. Show loading nếu cần
    if (handleLoading) {
      showLoading();
    }

    // 3. Thực hiện action chính
    await action.call();

    // 4. Hide loading nếu cần
    if (handleLoading) {
      hideLoading();
    }

    // 5. Callback khi thành công hoặc có lỗi
    await doOnSuccessOrError?.call();

  } on AppException catch (e) {
    // 6. Hide loading
    if (handleLoading) {
      hideLoading();
    }

    // 7. Callback sau khi có lỗi
    await doOnSuccessOrError?.call();
    await doOnError?.call(e);

    // 8. Xử lý error nếu cần
    if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
      await addException(AppExceptionWrapper(
        appException: e,
        doOnRetry: doOnRetry ??
            (handleRetry && maxRetries != 1
                ? () async {
                    // Retry logic - gọi lại chính action
                    recursion = Completer();
                    await runBlocCatching(
                      action: action,
                      // ... pass all params
                      maxRetries: maxRetries?.minus(1),
                    );
                    recursion?.complete();
                  }
                : null),
        exceptionCompleter: Completer<void>(),
        overrideMessage: overrideErrorMessage,
      ));
    }
  } finally {
    // 9. Đảm bảo recursion hoàn thành
    await recursion?.future;
    // 10. Callback khi event hoàn thành
    await doOnEventCompleted?.call();
  }
}
```

### 📍 PHÂN TÍCH TỪNG BƯỚC:

```
runBlocCatching(
  action: () async {
    await _loginUseCase.execute(...);
    await navigator.replace('/home');
  },
  handleError: false,  // Override: không hiện dialog
  doOnError: (e) {
    emit(state.copyWith(onPageError: exceptionMessageMapper.map(e)));
  },
)
```

| Callback | Khi nào được gọi |
|----------|-----------------|
| `doOnSubscribe` | TRƯỚC KHI action bắt đầu |
| `handleLoading` | Tự động show/hide loading |
| `action` | Business logic chính |
| `doOnSuccessOrError` | SAU KHI action hoàn thành (thành công hoặc lỗi) |
| `doOnError` | CHỈ KHI có lỗi |
| `doOnEventCompleted` | CUỐI CÙNG (finally) |

---

## 7.4 EXCEPTION HANDLING FLOW

### File: [exception_handler.dart](file:///D:/AppData/Code/flutter_bloc_clean/app/lib/exception_handler/exception_handler.dart)

```dart
class ExceptionHandler {
  Future<void> handleException(
    AppExceptionWrapper appExceptionWrapper,
    String commonExceptionMessage,
  ) async {
    final message = appExceptionWrapper.overrideMessage ?? commonExceptionMessage;

    switch (appExceptionWrapper.appException.appExceptionType) {
      case AppExceptionType.remote:
        final exception = appExceptionWrapper.appException as RemoteException;
        switch (exception.kind) {
          case RemoteExceptionKind.refreshTokenFailed:
            // Token hết hạn → Force logout
            await _showErrorDialog(
              isRefreshTokenFailed: true,
              message: message,
              onPressed: Func0(() => navigator.pop()),
            );
            break;

          case RemoteExceptionKind.noInternet:
          case RemoteExceptionKind.timeout:
            // Mất mạng/timeout → Retry
            await _showErrorDialogWithRetry(
              message: message,
              onRetryPressed: Func0(() async {
                await navigator.pop();
                await appExceptionWrapper.doOnRetry?.call();
              }),
            );
            break;

          default:
            // Lỗi khác → Chỉ hiện message
            await _showErrorDialog(message: message);
            break;
        }
        break;

      case AppExceptionType.parse:
        // Parse error → Hiện snackbar (không có retry)
        return _showErrorSnackBar(message: message);

      case AppExceptionType.validation:
        // Validation error → Hiện dialog
        await _showErrorDialog(message: message);
        break;

      case AppExceptionType.uncaught:
        // Uncaught error → Không làm gì (có thể log ra crashlytics)
        return null;
    }
  }
}
```

### 📍 EXCEPTION FLOW HOÀN CHỈNH

```
┌─────────────────────────────────────────────────────────────┐
│  1. User bấm nút Login                                     │
│     bloc.add(LoginButtonPressed())                         │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  2. LoginBloc.onLoginPressed()                            │
│     runBlocCatching(                                       │
│       action: () => _loginUseCase.execute(...),            │
│       handleError: false,                                   │
│       doOnError: (e) => emit(state.copyWith(error: ...)),  │
│     )                                                      │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  3. Nếu có exception (VD: noInternet)                     │
│     addException(AppExceptionWrapper(                       │
│       appException: RemoteException(kind: noInternet),     │
│       doOnRetry: () => runBlocCatching(action: ...)        │
│     ))                                                     │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  4. CommonBloc nhận ExceptionEmitted event                │
│     emit(state.copyWith(appExceptionWrapper: wrapper))     │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  5. BlocListener trong App nhận wrapper                    │
│     ExceptionHandler.handleException(wrapper, message)     │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  6. ExceptionHandler phân loại exception                   │
│     - noInternet → Hiện dialog với Retry button            │
│     - refreshTokenFailed → Hiện dialog + force logout      │
│     - validation → Hiện dialog                             │
│     - parse → Hiện snackbar                                │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  7. User tương tác với dialog                             │
│     - Retry → Gọi doOnRetry() → Lặp lại action            │
│     - OK → navigator.pop()                                 │
│     - Force logout → Clear data + Navigate to login        │
└─────────────────────────────────────────────────────────────┘
```

---

## 7.5 BÀI TẬP

### ❓ Câu hỏi 1:
Tại sao `LoadingVisibilityEmitted` dùng `loadingCount` thay vì boolean?

### ❓ Câu hỏi 2:
Trong `runBlocCatching`, `handleError: false` và `doOnError` khác nhau như thế nào?

### ❓ Câu hỏi 3:
Khi nào thì `refreshTokenFailed` được throw? Xử lý như thế nào?

<details>
<summary>Đáp án</summary>

**Câu 1**:
- Boolean: Nếu BLoC A show loading, BLoC B hide loading → loading = false dù A đang loading
- Count: Nếu A show (count=1), B show (count=2), B hide (count=1) → loading = true (đúng)

**Câu 2**:
- `handleError: false` → KHÔNG gọi ExceptionHandler (không hiện dialog/snackbar)
- `doOnError: (e) => ...` → Gọi callback với exception để BLoC tự xử lý
- Trong LoginPage: error hiển thị dưới text field, không phải dialog

**Câu 3**:
- `refreshTokenFailed` được throw khi API trả về 401 và không refresh được token
- Xử lý: Hiện dialog thông báo "Phiên đăng nhập hết hạn" + auto logout sau khi user đóng dialog

</details>

---

# 🔷 TIẾP THEO

Trong document tiếp theo, chúng ta sẽ đi vào:

- **Repository Pattern** - Data layer tổ chức như thế nào?
- **Dependency Injection** - Các dependencies được inject ra sao?
- **Navigation** - AppNavigator hoạt động thế nào?
- **Mapping System** - DataMapper dùng để làm gì?

Bạn muốn tôi tiếp tục với phần nào?
