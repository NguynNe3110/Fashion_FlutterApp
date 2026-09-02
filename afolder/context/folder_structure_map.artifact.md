# 📁 CẤU TRÚC FOLDER - MÁP VỚI BASE CLASSES

## Tổng Quan Cấu Trúc Monorepo

```
flutter_bloc_clean/
│
├── 📦 app/           → Presentation Layer (UI, BLoC, Navigation)
├── 📦 domain/        → Business Logic Layer (UseCase, Entity, Repository Interface)
├── 📦 data/          → Data Layer (API, Database, Repository Implementation)
├── 📦 shared/        → Shared Utilities (Exception, DI, Utils, Models)
├── 📦 resources/     → Localization, Assets
├── 📦 initializer/   → App Initialization
├── 📦 nals_lints/    → Custom Linting Rules
└── 📦 tools/         → Build Tools
```

---

## 🗂️ SƠ ĐỒ CẤU TRÚC CHI TIẾT

### 1. DOMAIN Package

```
domain/lib/src/
├── di/
│   └── dependency_injection.dart    ← Cấu hình DI cho Domain
│
├── config/
│   └── environment.dart            ← Environment config
│
├── entity/                          ← 📌 ENTITY LAYER
│   ├── base/
│   │   ├── paged_list.dart         ← Entity cho pagination
│   │   └── process_state.dart      ← ⚠️ DEPRECATED - dùng Result<T>
│   ├── user.dart
│   ├── token.dart
│   └── ...
│
├── usecase/                        ← 📌 USECASE LAYER
│   ├── base/
│   │   ├── base_use_case.dart      ← BaseUseCase
│   │   ├── io/
│   │   │   ├── base_input.dart     ← BaseInput
│   │   │   └── base_output.dart    ← BaseOutput
│   │   ├── future/
│   │   │   ├── base_future_use_case.dart  ← BaseFutureUseCase
│   │   │   └── base_load_more_use_case.dart
│   │   ├── sync/
│   │   │   └── base_sync_use_case.dart   ← BaseSyncUseCase
│   │   └── stream/
│   │       └── base_stream_use_case.dart ← BaseStreamUseCase
│   │
│   ├── login_use_case.dart
│   ├── logout_use_case.dart
│   ├── get_users_use_case.dart
│   └── ... (các use case khác)
│
├── navigation/
│   └── (navigation models nếu cần)
│
└── repository/                      ← 📌 REPOSITORY INTERFACE
    └── repository.dart             ← Abstract Repository (interface)
```

**Trong Domain có những Base nào?**

| Folder | Base Classes | Ý nghĩa |
|--------|-------------|----------|
| `entity/` | Entity (không có Base) | Đối tượng nghiệp vụ thuần túy |
| `usecase/base/` | `BaseUseCase`, `BaseInput`, `BaseOutput` | Base cho tất cả UseCases |
| `usecase/base/future/` | `BaseFutureUseCase`, `BaseLoadMoreUseCase` | Async UseCases |
| `usecase/base/sync/` | `BaseSyncUseCase` | Sync UseCases |
| `usecase/base/stream/` | `BaseStreamUseCase` | Stream UseCases |
| `repository/` | `Repository` (interface) | Contract với Data layer |

---

### 2. DATA Package

```
data/lib/src/
├── di/
│   └── dependency_injection.dart    ← Cấu hình DI cho Data
│
├── config/
│   └── api_config.dart             ← API configuration
│
└── repository/
    ├── repository_impl.dart        ← 📌 Implement Repository interface
    │
    └── source/                     ← 📌 DATA SOURCES
        ├── api/                     ← API calls
        │   ├── app_api_service.dart
        │   ├── refresh_token_api_service.dart
        │   │
        │   ├── client/              ← API Clients
        │   │   ├── base/
        │   │   ├── raw_api_client.dart
        │   │   ├── auth_app_server_api_client.dart
        │   │   └── none_auth_app_server_api_client.dart
        │   │
        │   ├── model/               ← DTO Models (API responses)
        │   │   ├── login_response.dart
        │   │   ├── user_response.dart
        │   │   └── ...
        │   │
        │   ├── mapper/              ← 📌 RESPONSE MAPPERS
        │   │   ├── base/
        │   │   │   ├── base_success_response_mapper.dart
        │   │   │   └── base_error_response_mapper.dart
        │   │   ├── success/
        │   │   │   ├── data_json_object_response_mapper.dart
        │   │   │   ├── json_object_response_mapper.dart
        │   │   │   └── ...
        │   │   └── error/
        │   │       ├── json_object_error_mapper.dart
        │   │       └── ...
        │   │
        │   ├── middleware/          ← 📌 INTERCEPTORS
        │   │   ├── base/
        │   │   │   └── base_interceptor.dart
        │   │   ├── access_token_interceptor.dart
        │   │   ├── refresh_token_interceptor.dart
        │   │   ├── retry_interceptor.dart
        │   │   ├── connectivity_interceptor.dart
        │   │   └── ...
        │   │
        │   └── exception_mapper/   ← Exception mapping
        │
        ├── database/               ← Local Database (SQLite)
        │   ├── app_database.dart
        │   ├── dao/
        │   └── ...
        │
        ├── preference/             ← Local Storage (SharedPreferences)
        │   └── app_preferences.dart
        │
        ├── shared/                ← Shared data sources
        │   └── ...
        │
        └── base/                  ← 📌 BASE DATA MAPPER
            └── base_data_mapper.dart
```

**Trong Data có những Base nào?**

| Folder | Base Classes | Ý nghĩa |
|--------|-------------|----------|
| `repository/source/base/` | `BaseDataMapper<R, E>` | Map DTO ↔ Entity |
| `repository/source/api/mapper/base/` | `BaseSuccessResponseMapper` | Map API success response |
| `repository/source/api/mapper/base/` | `BaseErrorResponseMapper` | Map API error response |
| `repository/source/api/middleware/base/` | `BaseInterceptor` | HTTP interceptors |

---

### 3. SHARED Package

```
shared/lib/src/
├── di/
│   └── dependency_injection.dart    ← Cấu hình DI cho Shared
│
├── config/
│   ├── log_config.dart             ← Logging configuration
│   └── app_config.dart             ← App configuration
│
├── constants/
│   ├── duration_constants.dart
│   ├── api_constants.dart
│   └── ...
│
├── mixin/                          ← 📌 MIXINS DÙNG CHUNG
│   ├── log_mixin.dart
│   └── ...
│
├── model/                          ← 📌 BASE MODELS
│   ├── base/
│   │   ├── base_input.dart
│   │   └── base_output.dart
│   ├── typedef.dart
│   └── ...
│
├── helper/                         ← 📌 HELPERS
│   ├── run_catching/
│   │   ├── result.dart            ← Result<T> class
│   │   └── run_catching.dart      ← runCatching helpers
│   └── ...
│
├── utils/                          ← Utilities
│   ├── extensions/
│   └── ...
│
└── exception/                      ← 📌 EXCEPTION HIERARCHY
    ├── base/
    │   ├── app_exception.dart
    │   └── app_exception_wrapper.dart
    ├── parse/
    │   └── parse_exception.dart
    ├── remote/
    │   ├── remote_exception.dart
    │   └── kinds/                 ← Chi tiết loại remote error
    │       ├── no_internet.dart
    │       ├── timeout.dart
    │       └── ...
    ├── uncaught/
    │   └── app_uncaught_exception.dart
    ├── validation/
    │   └── validation_exception.dart
    └── remote_config/
        └── remote_config_exception.dart
```

**Trong Shared có những Base nào?**

| Folder | Base Classes | Ý nghĩa |
|--------|-------------|----------|
| `model/base/` | `BaseInput`, `BaseOutput` | Có thể được import từ đây |
| `helper/` | `Result<T>` | Thay thế ProcessState |
| `exception/base/` | `AppException`, `AppExceptionWrapper` | Base exception classes |

---

### 4. APP Package

```
app/lib/
├── di/
│   └── dependency_injection.dart    ← Cấu hình DI cho App
│
├── config/
│   └── ...                         ← App-specific configs
│
├── utils/
│   └── ...                         ← App utilities
│
├── helper/
│   └── ...                         ← App helpers
│
├── base/                           ← 📌 BASE CLASSES
│   ├── base_page_state.dart        ← BasePageState, BasePageStateDelegate
│   └── bloc/
│       ├── base_bloc.dart          ← BaseBloc, BaseBlocDelegate
│       ├── base_bloc_event.dart    ← BaseBlocEvent
│       ├── base_bloc_state.dart    ← BaseBlocState
│       ├── app_bloc_observer.dart  ← BLoC Observer (debug)
│       ├── mixin/
│       │   └── event_transformer_mixin.dart
│       └── common/
│           ├── common_bloc.dart
│           ├── common_event.dart
│           └── common_state.dart
│
├── navigation/                      ← 📌 NAVIGATION
│   ├── base/
│   │   ├── base_route_info_mapper.dart    ← BaseRouteInfoMapper
│   │   └── base_popup_info_mapper.dart    ← BasePopupInfoMapper
│   ├── routes/
│   │   ├── app_router.dart
│   │   └── app_route_info.dart
│   ├── observer/
│   ├── middleware/
│   └── app_navigator_impl.dart
│
├── exception_handler/               ← 📌 EXCEPTION HANDLING
│   ├── exception_handler.dart
│   └── exception_message_mapper.dart
│
├── ui/                             ← 📌 UI SCREENS
│   ├── login/
│   │   ├── bloc/
│   │   │   ├── login_bloc.dart
│   │   │   ├── login_event.dart
│   │   │   ├── login_state.dart
│   │   │   └── login.dart         ← Barrel file
│   │   └── login_page.dart
│   │
│   ├── home/
│   │   └── ...
│   │
│   ├── search/
│   │   └── ...
│   │
│   ├── my_page/
│   │   └── ...
│   │
│   └── item_detail/
│       └── ...
│
├── common_view/                    ← Common UI components
│   ├── loading_view.dart
│   ├── error_view.dart
│   └── ...
│
├── shared_view/                    ← Shared widgets
│   └── ...
│
├── app.dart                        ← App widget
└── main.dart                        ← Entry point
```

**Trong App có những Base nào?**

| Folder | Base Classes | Ý nghĩa |
|--------|-------------|----------|
| `base/` | `BasePageState`, `BasePageStateDelegate` | Base cho Pages |
| `base/bloc/` | `BaseBloc`, `BaseBlocDelegate`, `BaseBlocEvent`, `BaseBlocState` | Base cho BLoCs |
| `base/bloc/mixin/` | `EventTransformerMixin` | Event transformers |
| `base/bloc/common/` | `CommonBloc`, `CommonEvent`, `CommonState` | Global state |
| `navigation/base/` | `BaseRouteInfoMapper`, `BasePopupInfoMapper` | Route/Popup mappers |
| `exception_handler/` | `ExceptionHandler`, `ExceptionMessageMapper` | Xử lý exception |

---

## 🔗 MỐI QUAN HỆ: FOLDER ↔ BASE CLASSES

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           DOMAIN PACKAGE                                    │
│                                                                             │
│   entity/          → Không có Base, chỉ là pure entities                   │
│                                                                             │
│   usecase/         → BaseUseCase (base/)                                    │
│   │                → BaseInput, BaseOutput (base/io/)                       │
│   │                → BaseFutureUseCase (base/future/)                      │
│   │                → BaseSyncUseCase (base/sync/)                          │
│   │                → BaseStreamUseCase (base/stream/)                      │
│                                                                             │
│   repository/      → Repository (interface)                                 │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    │ Repository interface
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                            DATA PACKAGE                                      │
│                                                                             │
│   repository/source/base/    → BaseDataMapper                                │
│                                                                             │
│   repository/source/api/                                                          │
│   ├── mapper/base/           → BaseSuccessResponseMapper                      │
│   │                         → BaseErrorResponseMapper                        │
│   │                                                                             │
│   └── middleware/base/       → BaseInterceptor                                │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    │ Exception types
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                           SHARED PACKAGE                                     │
│                                                                             │
│   exception/                → AppException (base/)                           │
│                              → RemoteException (remote/)                     │
│                              → ValidationException (validation/)             │
│                              → ParseException (parse/)                       │
│                              → AppUncaughtException (uncaught/)              │
│                                                                             │
│   helper/run_catching/      → Result<T>                                      │
│                              → runCatching()                                │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    │ Imports
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                             APP PACKAGE                                      │
│                                                                             │
│   base/bloc/              → BaseBloc, BaseBlocDelegate                       │
│   base/bloc/              → BaseBlocEvent, BaseBlocState                    │
│   base/bloc/mixin/        → EventTransformerMixin                           │
│   base/bloc/common/       → CommonBloc, CommonEvent, CommonState            │
│                                                                             │
│   base/                   → BasePageState, BasePageStateDelegate             │
│                                                                             │
│   navigation/base/         → BaseRouteInfoMapper                             │
│                            → BasePopupInfoMapper                             │
│                                                                             │
│   exception_handler/      → ExceptionHandler                                 │
│                            → ExceptionMessageMapper                          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📊 BẢNG TÓM TẮT

### Base Classes ở đâu?

| Base Class | Package | Folder |
|------------|---------|--------|
| `BaseBlocEvent` | app | `base/bloc/` |
| `BaseBlocState` | app | `base/bloc/` |
| `BaseBlocDelegate` | app | `base/bloc/` |
| `BaseBloc` | app | `base/bloc/` |
| `EventTransformerMixin` | app | `base/bloc/mixin/` |
| `CommonBloc` | app | `base/bloc/common/` |
| `BasePageState` | app | `base/` |
| `BaseRouteInfoMapper` | app | `navigation/base/` |
| `BasePopupInfoMapper` | app | `navigation/base/` |
| `ExceptionHandler` | app | `exception_handler/` |
| `BaseInput` | domain | `usecase/base/io/` |
| `BaseOutput` | domain | `usecase/base/io/` |
| `BaseUseCase` | domain | `usecase/base/` |
| `BaseFutureUseCase` | domain | `usecase/base/future/` |
| `BaseSyncUseCase` | domain | `usecase/base/sync/` |
| `BaseStreamUseCase` | domain | `usecase/base/stream/` |
| `BaseDataMapper` | data | `repository/source/base/` |
| `BaseSuccessResponseMapper` | data | `repository/source/api/mapper/base/` |
| `BaseErrorResponseMapper` | data | `repository/source/api/mapper/base/` |
| `BaseInterceptor` | data | `repository/source/api/middleware/base/` |
| `AppException` | shared | `exception/base/` |
| `Result<T>` | shared | `helper/run_catching/` |

---

## 🎯 HIỂU RÕ HƠN: DATA FLOW THEO FOLDERS

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  USER ACTION (Tap Login Button)                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  APP PACKAGE                                                               │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ ui/login/                                                             │  │
│  │   └── login_page.dart          ← BasePageState                        │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                    │                                       │
│                                    ▼                                       │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ ui/login/bloc/                                                        │  │
│  │   ├── login_bloc.dart        ← BaseBloc<Event, State>               │  │
│  │   ├── login_event.dart       ← BaseBlocEvent                         │  │
│  │   └── login_state.dart       ← BaseBlocState                         │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                    │                                       │
│                                    ▼                                       │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ base/bloc/common/                                                      │  │
│  │   └── common_bloc.dart        ← CommonBloc (loading/error)           │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    │ calls
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  DOMAIN PACKAGE                                                            │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ usecase/                                                              │  │
│  │   └── login_use_case.dart      ← BaseFutureUseCase<LoginInput, Out> │  │
│  │                              └── BaseInput, BaseOutput               │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                    │                                       │
│                                    ▼                                       │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ repository/                                                           │  │
│  │   └── repository.dart          ← Abstract Repository (interface)    │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    │ implements
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  DATA PACKAGE                                                              │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ repository/                                                          │  │
│  │   ├── repository_impl.dart      ← Implements Repository             │  │
│  │   └── source/                                                         │  │
│  │       ├── api/                                                         │  │
│  │       │   ├── app_api_service.dart  ← Gọi HTTP                      │  │
│  │       │   ├── mapper/                                                      │  │
│  │       │   │   └── user_data_mapper.dart  ← BaseDataMapper           │  │
│  │       │   └── middleware/                                                     │  │
│  │       │       └── access_token_interceptor.dart  ← BaseInterceptor    │  │
│  │       │                                                                 │  │
│  │       ├── database/                                                          │  │
│  │       │   └── app_database.dart                                           │  │
│  │       │                                                                 │  │
│  │       └── preference/                                                     │  │
│  │           └── app_preferences.dart                                       │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    │ throws
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  SHARED PACKAGE                                                            │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │ exception/                                                            │  │
│  │   ├── base/                    ← AppException                         │  │
│  │   ├── remote/                 ← RemoteException (noInternet, etc)    │  │
│  │   └── validation/             ← ValidationException                   │  │
│  │                                                                         │  │
│  │ helper/run_catching/                                                        │  │
│  │   └── result.dart              ← Result<T>                           │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## ❓ CÂU HỎI THƯỜNG GẶP

### Q1: Tại sao có nhiều folder con trong mỗi package?

**A**: Để **tổ chức code theo chức năng**, không phải theo loại file.

```
❌ TỔ CHỨC THEO LOẠI FILE (không tốt)
lib/
  ├── blocs/
  │   ├── login_bloc.dart
  │   ├── profile_bloc.dart
  │   └── cart_bloc.dart
  ├── pages/
  │   ├── login_page.dart
  │   └── profile_page.dart
  └── usecases/
      ├── login_usecase.dart
      └── profile_usecase.dart

✅ TỔ CHỨC THEO FEATURE (tốt hơn)
features/
  ├── login/
  │   ├── bloc/
  │   ├── page/
  │   └── usecase/
  └── profile/
      ├── bloc/
      ├── page/
      └── usecase/
```

### Q2: `source/api/mapper/` và `source/base/` khác nhau thế nào?

**A**:
- `source/base/` → `BaseDataMapper` - Map **DTO** ↔ **Entity** (app-wide)
- `source/api/mapper/` → `BaseSuccessResponseMapper` - Map **API Response** → **Model** (API-specific)

### Q3: Tại sao có cả `domain/usecase/base/` và `domain/lib/usecase/`?

**A**:
- `domain/usecase/base/` → Chứa **Base classes** (BaseUseCase, BaseInput...)
- `domain/lib/usecase/` → Chứa **Concrete UseCases** (LoginUseCase, GetUsersUseCase...)

```
domain/lib/src/usecase/
├── base/                          ← Base classes (không dùng trực tiếp)
│   ├── base_use_case.dart
│   ├── io/
│   ├── future/
│   ├── sync/
│   └── stream/
│
├── login_use_case.dart            ← Concrete use case (dùng trong code)
├── get_users_use_case.dart
└── ...
```

---

Bạn có muốn tôi đi sâu hơn vào phần nào cụ thể không? Ví dụ:
1. Chi tiết về `data/repository/source/` (API, Database, Preference)
2. Chi tiết về Exception hierarchy trong `shared/exception/`
3. Chi tiết về Navigation system
