# Process V1.0 - Stage 1: Build Base Project

## Ngày: 2026-08-31
## Status: ✅ COMPLETED

---

## Mục Tiêu

Xây dựng tất cả base classes cho fashion_app theo Clean Architecture với BLoC pattern và goRouter navigator.

---

## Các Base Classes Đã Tạo

### 1. Domain Layer - UseCase Bases (`lib/domain/usecases/base/`)

| File | Mô tả |
|------|-------|
| `base_input.dart` | Marker class cho UseCase input parameters |
| `base_output.dart` | Marker class cho UseCase output results |
| `base_use_case.dart` | Abstract base class với Template Method Pattern |
| `base.dart` | Barrel file export tất cả bases |
| `no_input.dart` | Input class cho UseCases không cần tham số |
| `future/base_future_use_case.dart` | Base cho async operations (API calls) |
| `future/base_load_more_use_case.dart` | Base cho pagination/load more |
| `sync/base_sync_use_case.dart` | Base cho sync operations (validation) |
| `stream/base_stream_use_case.dart` | Base cho realtime data (streams) |

### 2. Data Layer - Mapper & Interceptor Bases (`lib/data/`)

| File | Mô tả |
|------|-------|
| `mappers/base_data_mapper.dart` | Base class cho DTO ↔ Entity mapping |
| `remote/api/middleware/base_interceptor.dart` | Base class cho Dio interceptors |
| `remote/api/mapper/base_success_response_mapper.dart` | Base cho API success response mapping |
| `remote/api/mapper/base_error_response_mapper.dart` | Base cho API error response mapping |

### 3. Core/Base Layer - BLoC & UI Bases (`lib/core/base/`)

| File | Mô tả |
|------|-------|
| `bloc/base_bloc_event.dart` | Marker class cho tất cả BLoC events |
| `bloc/base_bloc_state.dart` | Base class với loadingCount, exception |
| `bloc/base_bloc.dart` | Complete BaseBlocDelegate với navigator, loading, error handling |
| `bloc/common/common_bloc.dart` | Global loading/error management |
| `bloc/app/app_bloc.dart` | Global app state (initialized, loggedIn) |
| `base_page_state.dart` | Base class cho Page widgets |

### 4. Core/Error Layer - Exception System (`lib/core/error/`)

| File | Mô tả |
|------|-------|
| `base/app_exception.dart` | Abstract base class cho tất cả exceptions |
| `remote/remote_exception.dart` | Exception cho network/server errors |
| `validation/validation_exception.dart` | Exception cho input validation errors |
| `uncaught/app_uncaught_exception.dart` | Exception cho unexpected errors |
| `exception_handler.dart` | Interface để handle exceptions |
| `exception_message_mapper.dart` | Map exception → localized message |

---

## Cấu Trúc Thư Mục Sau Khi Hoàn Thành

```
lib/
├── core/
│   ├── base/
│   │   ├── base_page_state.dart
│   │   └── bloc/
│   │       ├── base_bloc.dart
│   │       ├── base_bloc_event.dart
│   │       ├── base_bloc_state.dart
│   │       ├── app_exception_wrapper.dart
│   │       ├── event_transformer_mixin.dart
│   │       ├── app/
│   │       │   ├── app_bloc.dart
│   │       │   ├── app_event.dart
│   │       │   └── app_state.dart
│   │       └── common/
│   │           ├── common_bloc.dart
│   │           ├── common_event.dart
│   │           └── common_state.dart
│   ├── error/
│   │   ├── base/app_exception.dart
│   │   ├── remote/remote_exception.dart
│   │   ├── validation/validation_exception.dart
│   │   ├── uncaught/app_uncaught_exception.dart
│   │   ├── exception_handler.dart
│   │   └── exception_message_mapper.dart
│   └── navigator/
│       ├── app_navigator.dart
│       └── go_router_app_navigator.dart
├── domain/
│   └── usecases/
│       └── base/
│           ├── base.dart
│           ├── base_input.dart
│           ├── base_output.dart
│           ├── base_use_case.dart
│           ├── no_input.dart
│           ├── future/
│           │   ├── base_future_use_case.dart
│           │   └── base_load_more_use_case.dart
│           ├── sync/
│           │   └── base_sync_use_case.dart
│           └── stream/
│               └── base_stream_use_case.dart
├── data/
│   ├── mappers/
│   │   └── base_data_mapper.dart
│   └── remote/
│       └── api/
│           ├── middleware/
│           │   └── base_interceptor.dart
│           └── mapper/
│               ├── base_success_response_mapper.dart
│               └── base_error_response_mapper.dart
```

---

## Ví Dụ Sử Dụng

### Tạo một UseCase mới

```dart
// lib/domain/usecases/login/login_use_case.dart
@injectable
class LoginUseCase extends BaseFutureUseCase<LoginInput, LoginOutput> {
  const LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    final user = await _authRepository.login(
      email: input.email,
      password: input.password,
    );
    return LoginOutput(user: user);
  }
}
```

### Tạo một BLoC mới

```dart
// lib/feature/auth/presentation/bloc/auth_bloc.dart
@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._loginUseCase) : super(const AuthState()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  final LoginUseCase _loginUseCase;

  FutureOr<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<AuthState> emit,
  ) {
    return runBlocCatching(
      action: () => _loginUseCase.execute(
        LoginInput(email: event.email, password: event.password),
      ),
      doOnSuccess: (output) {
        emit(state.copyWith(user: output.user));
      },
    );
  }
}
```

---

## Ghi Chú

1. **goRouter**: Đã có sẵn trong project, dùng cho navigation
2. **flutter_bloc**: Đã có sẵn, dùng cho state management
3. **get_it**: Đã có sẵn, dùng cho dependency injection
4. **freezed**: Đã có sẵn, dùng cho immutable classes

---

## Tiếp Theo

- **Stage 2**: Build Authentication Module (Login, Register, Forgot Password)
- **Stage 3**: Build Product Module (Product List, Product Detail, Search)
- **Stage 4**: Build Cart Module (Cart, Checkout)
- **Stage 5**: Build Profile Module (User Profile, Settings)

---

## File Changes Summary

```
NEW: lib/domain/usecases/base/base_input.dart
NEW: lib/domain/usecases/base/base_output.dart
NEW: lib/domain/usecases/base/base_use_case.dart
NEW: lib/domain/usecases/base/base.dart
NEW: lib/domain/usecases/base/no_input.dart
NEW: lib/domain/usecases/base/future/base_future_use_case.dart
NEW: lib/domain/usecases/base/future/base_load_more_use_case.dart
NEW: lib/domain/usecases/base/sync/base_sync_use_case.dart
NEW: lib/domain/usecases/base/stream/base_stream_use_case.dart
NEW: lib/data/mappers/base_data_mapper.dart
NEW: lib/data/remote/api/middleware/base_interceptor.dart
NEW: lib/data/remote/api/mapper/base_success_response_mapper.dart
NEW: lib/data/remote/api/mapper/base_error_response_mapper.dart
NEW: lib/core/error/base/app_exception.dart
NEW: lib/core/error/remote/remote_exception.dart
NEW: lib/core/error/validation/validation_exception.dart
NEW: lib/core/error/uncaught/app_uncaught_exception.dart
NEW: lib/core/error/exception_handler.dart
NEW: lib/core/error/exception_message_mapper.dart
NEW: lib/core/base/base_page_state.dart
UPDATE: lib/core/base/bloc/base_bloc.dart
UPDATE: lib/core/base/bloc/base_bloc_state.dart
UPDATE: lib/core/base/bloc/base_bloc_event.dart
UPDATE: lib/core/base/bloc/app/app_bloc.dart
UPDATE: lib/core/base/bloc/common/common_bloc.dart
```
