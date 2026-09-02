# 🎯 HƯỚNG DẪN SỬ DỤNG TOÀN DIỆN - BUILD APP VỚI BASE CLASSES

## Mục Lục

1. [Tổng Quan Luồng Xử Lý](#1-tổng-quan-luồng-xử-lý)
2. [Layer 1: Domain - UseCase & Entity](#2-layer-1-domain---usecase--entity)
3. [Layer 2: Data - Repository & Data Sources](#3-layer-2-data---repository--data-sources)
4. [Layer 3: App - BLoC](#4-layer-3-app---bloc)
5. [Layer 4: App - UI Page](#5-layer-4-app---ui-page)
6. [Layer 5: Navigation](#6-layer-5-navigation)
7. [Thực Hành: Xây Dựng Feature Profile](#7-thực-hành-xây-dựng-feature-profile)
8. [Thực Hành: Xây Dựng Feature Search (Pagination)](#8-thực-hành-xây-dựng-feature-search-pagination)
9. [Thực Hành: Xây Dựng Feature Settings (Local Storage)](#9-thực-hành-xây-dựng-feature-settings-local-storage)
10. [Các Helper Classes Quan Trọng](#10-các-helper-classes-quan-trọng)

---

# 1. TỔNG QUAN LUỒNG XỬ LÝ

## 1.1 Kiến Trúc Tổng Quan

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              USER                                            │
│                    (Nhấn nút, gõ text...)                                  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  LAYER 4: UI (Page)                                                         │
│  ├── BasePageState<Widget, BLoC>                                          │
│  ├── bloc.add(Event) → Gửi event                                           │
│  └── Widget build(context, bloc, state) → Hiển thị state                  │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  LAYER 3: BLoC (Logic)                                                     │
│  ├── BaseBloc<Event, State>                                               │
│  ├── on<Event>(_handler) → Xử lý event                                     │
│  ├── runBlocCatching() → Wrap async action + auto loading/error             │
│  └── emit(state.copyWith(...)) → Cập nhật state                           │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  LAYER 2: Domain (Business Logic)                                          │
│  ├── UseCase (BaseFutureUseCase<Input, Output>)                            │
│  ├── Repository (interface)                                                │
│  └── Entity (User, Product...)                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  LAYER 1: Data (Implementation)                                            │
│  ├── RepositoryImpl → Implement interface                                  │
│  ├── DataMapper (BaseDataMapper) → Map DTO ↔ Entity                       │
│  ├── API Service → Gọi HTTP                                               │
│  ├── Database → Local DB                                                  │
│  └── Preferences → Local Storage                                          │
└─────────────────────────────────────────────────────────────────────────────┘
```

## 1.2 Các Bước Khi Tạo Feature Mới

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  BƯỚC 1: Domain Layer (Trước tiên!)                                       │
│  ├── Tạo Entity (nếu cần)                                                 │
│  ├── Tạo Input/Output                                                     │
│  └── Tạo UseCase                                                         │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  BƯỚC 2: Data Layer                                                        │
│  ├── Tạo Response Model (DTO)                                              │
│  ├── Tạo DataMapper                                                       │
│  ├── Thêm method vào Repository interface (Domain)                         │
│  └── Implement trong RepositoryImpl (Data)                                 │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  BƯỚC 3: App Layer - BLoC                                                   │
│  ├── Tạo Events (BaseBlocEvent)                                           │
│  ├── Tạo State (BaseBlocState)                                           │
│  └── Tạo BLoC (BaseBloc<Event, State>)                                   │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  BƯỚC 4: App Layer - UI                                                    │
│  ├── Tạo Page (BasePage<BLoC>)                                           │
│  └── Thêm route vào AppRouter                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

# 2. LAYER 1: DOMAIN - USECASE & ENTITY

## 2.1 Entity - Đối Tượng Nghiệp Vụ

### Khi nào cần tạo Entity mới?

- Khi cần model một đối tượng nghiệp vụ
- Entity phải **thuần túy**, không phụ thuộc vào implementation cụ thể

### Ví dụ: Tạo Profile Entity

```dart
// File: domain/lib/src/entity/profile.dart

class Profile {
  const Profile({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.bio,
  });

  final int id;
  final String name;
  final String email;
  final String? avatarUrl;
  final String? bio;

  // Giá trị mặc định
  static const empty = Profile(
    id: -1,
    name: '',
    email: '',
  );

  // Copy with
  Profile copyWith({
    int? id,
    String? name,
    String? email,
    String? avatarUrl,
    String? bio,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      bio: bio ?? this.bio,
    );
  }
}
```

### Entity vs DTO (Data Transfer Object)

| Entity | DTO |
|--------|-----|
| Trong **Domain** layer | Trong **Data** layer |
| Nghiệp vụ thuần túy | Phản ánh API/DB structure |
| Không có logic serialize | Có thể có annotations (JSON serializable) |

```
API Response (JSON)          Entity (Domain)
{                             Profile {
  "user_id": 1,                id: 1,
  "full_name": "Nam",          name: "Nam",
  "email_address": "a@b"       email: "a@b"
}                            }
        │                              ▲
        │ mapToEntity                 │
        └──────────────────────────────┘
              UserDataMapper
```

---

## 2.2 Input/Output - Tham Số cho UseCase

### BaseInput - Marker Class

```dart
// File: domain/lib/src/usecase/get_profile/get_profile_input.dart

// Nếu UseCase cần tham số
@freezed
sealed class GetProfileInput extends BaseInput with _$GetProfileInput {
  const GetProfileInput._();
  const factory GetProfileInput({
    required int userId,
  }) = _GetProfileInput;
}

// Nếu UseCase không cần tham số
@freezed
sealed class NoInput extends BaseInput with _$NoInput {
  const factory NoInput() = _NoInput;
}
```

### BaseOutput - Kết Quả UseCase

```dart
// File: domain/lib/src/usecase/get_profile/get_profile_output.dart

@freezed
sealed class GetProfileOutput extends BaseOutput with _$GetProfileOutput {
  const GetProfileOutput._();
  const factory GetProfileOutput({
    required Profile profile,
  }) = _GetProfileOutput;
}
```

### Khi nào dùng Input/Output riêng?

| Trường hợp | Cách làm |
|-------------|----------|
| UseCase có 1-2 params đơn giản | Có thể dùng primitive (String, int) |
| UseCase có nhiều params | Tạo Input class |
| UseCase trả về nhiều giá trị | Tạo Output class |
| Tái sử dụng params | Tạo Input class để reuse |

---

## 2.3 UseCase - Business Logic

### 2.3.1 BaseFutureUseCase - API Calls (Phổ Biến Nhất)

```dart
// File: domain/lib/src/usecase/get_profile/get_profile_use_case.dart

@Injectable()
class GetProfileUseCase extends BaseFutureUseCase<GetProfileInput, GetProfileOutput> {
  const GetProfileUseCase(this._repository);

  final Repository _repository;

  @override
  Future<GetProfileOutput> buildUseCase(GetProfileInput input) async {
    // 1. Gọi repository
    final profile = await _repository.getProfile(userId: input.userId);

    // 2. Trả về output
    return GetProfileOutput(profile: profile);
  }
}
```

### 2.3.2 BaseSyncUseCase - Logic Đồng Bộ

```dart
// File: domain/lib/src/usecase/validate_email/validate_email_use_case.dart

@Injectable()
class ValidateEmailUseCase extends BaseSyncUseCase<StringInput, ValidationOutput> {
  const ValidateEmailUseCase();

  @override
  ValidationOutput buildUseCase(StringInput input) {
    // Validation logic đồng bộ
    final isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(input.value);

    if (!isValid) {
      throw const ValidationException(ValidationExceptionKind.invalidEmail);
    }

    return const ValidationOutput(isValid: true);
  }
}

// Input đơn giản
@freezed
sealed class StringInput extends BaseInput with _$StringInput {
  const StringInput._();
  const factory StringInput({required String value}) = _StringInput;
}

// Output cho validation
@freezed
sealed class ValidationOutput extends BaseOutput with _$ValidationOutput {
  const ValidationOutput._();
  const factory ValidationOutput({required bool isValid}) = _ValidationOutput;
}
```

### 2.3.3 BaseStreamUseCase - Realtime Data

```dart
// File: domain/lib/src/usecase/watch_profile/watching_profile_use_case.dart

@Injectable()
class WatchProfileUseCase extends BaseStreamUseCase<IntInput, Profile> {
  const WatchProfileUseCase(this._repository);

  final Repository _repository;

  @override
  Stream<Profile> buildUseCase(IntInput input) {
    // Trả về stream để UI lắng nghe thay đổi
    return _repository.watchProfile(userId: input.value);
  }
}
```

### 2.3.4 BaseLoadMoreUseCase - Pagination

```dart
// File: domain/lib/src/usecase/search_users/search_users_use_case.dart

@Injectable()
class SearchUsersUseCase extends BaseLoadMoreUseCase<SearchUsersInput, List<Profile>> {
  const SearchUsersUseCase(this._repository);

  final Repository _repository;

  @override
  Future<List<Profile>> buildUseCase(SearchUsersInput input) async {
    return _repository.searchUsers(
      query: input.query,
      page: input.page,
      limit: input.limit,
    );
  }
}

@freezed
sealed class SearchUsersInput extends BaseInput with _$SearchUsersInput {
  const SearchUsersInput._();
  const factory SearchUsersInput({
    required String query,
    required int page,
    required int limit,
  }) = _SearchUsersInput;
}
```

---

# 3. LAYER 2: DATA - REPOSITORY & DATA SOURCES

## 3.1 Cấu Trúc Data Layer

```
data/lib/src/repository/
├── repository_impl.dart              ← Implement Repository interface
└── source/
    ├── api/                          ← Gọi HTTP
    │   ├── app_api_service.dart
    │   ├── client/                   ← API clients
    │   ├── model/                    ← DTO models (API responses)
    │   └── mapper/                   ← Response mappers
    │
    ├── database/                     ← Local DB
    │   ├── app_database.dart
    │   └── mapper/
    │
    └── preference/                   ← Local Storage
        └── app_preferences.dart
```

## 3.2 DTO (Data Transfer Object)

### Khi nào cần DTO?

- Khi API trả về JSON structure
- DTO phản ánh chính xác API response

### Ví dụ: Tạo ProfileResponse DTO

```dart
// File: data/lib/src/repository/source/api/model/profile_response.dart

@JsonSerializable()
class ProfileResponse {
  const ProfileResponse({
    this.id,
    this.name,
    this.email,
    this.avatarUrl,
    this.bio,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? avatarUrl;
  final String? bio;

  // JSON Serializable
  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
```

## 3.3 BaseDataMapper - Map DTO ↔ Entity

```dart
// File: data/lib/src/repository/source/api/mapper/profile_data_mapper.dart

@Injectable()
class ProfileDataMapper extends BaseDataMapper<ProfileResponse, Profile> {
  ProfileDataMapper();

  @override
  Profile mapToEntity(ProfileResponse? data) {
    return Profile(
      id: data?.id ?? -1,
      name: data?.name ?? '',
      email: data?.email ?? '',
      avatarUrl: data?.avatarUrl,
      bio: data?.bio,
    );
  }
}
```

### Tại sao cần Mapper?

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  API THAY ĐỔI (ví dụ: đổi field name)                                      │
│  {                                                                          │
│    "user_id": 1,        →       {                                          │
│    "fullname": "Nam",          "id": 1,                                   │
│    "email_address": "a@b"       "name": "Nam",                             │
│  }                            "email": "a@b"                              │
│                               }                                            │
└─────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    │ Chỉ cần sửa Mapper
                                    ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│  ENTITIES TRONG DOMAIN GIỮ NGUYÊN!                                          │
│  class Profile {                                                            │
│    final int id;                                                           │
│    final String name;                                                       │
│    final String email;                                                      │
│  }                                                                          │
└─────────────────────────────────────────────────────────────────────────────┘
```

## 3.4 Repository Interface (Domain) & Implementation (Data)

### 3.4.1 Thêm Method vào Repository Interface (Domain)

```dart
// File: domain/lib/src/repository/repository.dart

abstract class Repository {
  // ... existing methods ...

  // THÊM MỚI:
  Future<Profile> getProfile({required int userId});

  Future<void> updateProfile({required Profile profile});

  Stream<Profile> watchProfile({required int userId});
}
```

### 3.4.2 Implement trong RepositoryImpl (Data)

```dart
// File: data/lib/src/repository/repository_impl.dart

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  RepositoryImpl(
    this._appApiService,           // HTTP client
    this._appDatabase,            // Local DB
    this._appPreferences,         // Local storage
    this._profileDataMapper,      // DataMapper
  );

  final AppApiService _appApiService;
  final AppDatabase _appDatabase;
  final AppPreferences _appPreferences;
  final ProfileDataMapper _profileDataMapper;

  @override
  Future<Profile> getProfile({required int userId}) async {
    // 1. Gọi API
    final response = await _appApiService.getProfile(userId: userId);

    // 2. Map sang Entity
    return _profileDataMapper.mapToEntity(response);
  }

  @override
  Future<void> updateProfile({required Profile profile}) async {
    // 1. Gọi API
    await _appApiService.updateProfile(profile: profile);

    // 2. Cập nhật local DB nếu cần
    await _appDatabase.saveProfile(profile);
  }

  @override
  Stream<Profile> watchProfile({required int userId}) {
    // Lắng nghe thay đổi từ local DB
    return _appDatabase.watchProfile(userId: userId);
  }
}
```

## 3.5 API Service

### Ví dụ: AppApiService

```dart
// File: data/lib/src/repository/source/api/app_api_service.dart

@Injectable()
class AppApiService {
  AppApiService(this._dio);

  final Dio _dio;

  @GET('/users/{id}')
  Future<ProfileResponse> getProfile(@Path('id') int userId);

  @PUT('/users/{id}')
  Future<void> updateProfile({
    @Path('id') int userId,
    @Body() required ProfileResponse profile,
  });
}
```

## 3.6 BaseInterceptor - Xử Lý HTTP

```dart
// File: data/lib/src/repository/source/api/middleware/access_token_interceptor.dart

@Injectable()
class AccessTokenInterceptor extends BaseInterceptor {
  @override
  int get priority => baseAuthPriority; // 40

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Thêm access token vào header
    final token = getIt<AppPreferences>().getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
```

---

# 4. LAYER 3: APP - BLoC

## 4.1 Cấu Trúc BLoC

```
ui/profile/bloc/
├── profile_bloc.dart       ← BLoC chính
├── profile_event.dart     ← Events
├── profile_state.dart     ← State
└── profile.dart           ← Barrel file
```

## 4.2 BaseBlocEvent - Events

### Quy Tắc Tạo Event

1. Mỗi user action = 1 event riêng
2. Event phải **immutable** (dùng Freezed)
3. Event phải extend `BaseBlocEvent`

### Ví dụ: ProfileEvent

```dart
// File: app/lib/ui/profile/bloc/profile_event.dart

part 'profile_event.freezed.dart';

abstract class ProfileEvent extends BaseBlocEvent {
  const ProfileEvent();
}

// ===== USER ACTIONS =====

// Load profile khi vào trang
@freezed
sealed class ProfilePageStarted extends ProfileEvent with _$ProfilePageStarted {
  const factory ProfilePageStarted() = _ProfilePageStarted;
}

// Refresh profile (pull to refresh)
@freezed
sealed class ProfileRefreshed extends ProfileEvent with _$ProfileRefreshed {
  const factory ProfileRefreshed() = _ProfileRefreshed;
}

// User nhấn nút edit
@freezed
sealed class ProfileEditButtonPressed extends ProfileEvent with _$ProfileEditButtonPressed {
  const factory ProfileEditButtonPressed() = _ProfileEditButtonPressed;
}

// User thay đổi name
@freezed
sealed class ProfileNameChanged extends ProfileEvent with _$ProfileNameChanged {
  const factory ProfileNameChanged({required String name}) = _ProfileNameChanged;
}

// User nhấn save
@freezed
sealed class ProfileSaveButtonPressed extends ProfileEvent with _$ProfileSaveButtonPressed {
  const factory ProfileSaveButtonPressed() = _ProfileSaveButtonPressed;
}
```

## 4.3 BaseBlocState - State

### Quy Tắc Tạo State

1. State phải **immutable** (dùng Freezed)
2. State phải extend `BaseBlocState`
3. State chỉ chứa data cần hiển thị, không chứa logic

### Ví dụ: ProfileState

```dart
// File: app/lib/ui/profile/bloc/profile_state.dart

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState extends BaseBlocState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState({
    // Profile data
    Profile? profile,

    // Loading states
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,

    // Edit mode
    @Default(false) bool isEditMode,

    // Edit form
    String editingName,

    // Error
    String? errorMessage,
  }) = _ProfileState;

  // Getters tiện lợi
  bool get hasProfile => profile != null;
  bool get canSave => editingName.isNotEmpty && editingName != profile?.name;
}
```

## 4.4 BaseBloc - BLoC Implementation

### Quy Tắc Viết BLoC

1. Extend `BaseBloc<Event, State>`
2. Đăng ký handlers trong constructor
3. Dùng `runBlocCatching` cho async actions
4. Dùng transformers phù hợp

### Ví dụ: ProfileBloc

```dart
// File: app/lib/ui/profile/bloc/profile_bloc.dart

@Injectable()
class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._getProfileUseCase,
    this._updateProfileUseCase,
  ) : super(const ProfileState()) {
    // ĐĂNG KÝ EVENT HANDLERS

    // Load profile khi vào trang
    on<ProfilePageStarted>(
      _onPageStarted,
      transformer: exhaustMap(), // Bỏ qua nếu đang load
    );

    // Refresh
    on<ProfileRefreshed>(
      _onRefreshed,
      transformer: exhaustMap(),
    );

    // Toggle edit mode
    on<ProfileEditButtonPressed>(
      _onEditPressed,
    );

    // Form changes - dùng distinct để bỏ qua duplicate
    on<ProfileNameChanged>(
      _onNameChanged,
      transformer: distinct(),
    );

    // Save
    on<ProfileSaveButtonPressed>(
      _onSavePressed,
      transformer: exhaustMap(), // Không cho spam save
    );
  }

  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  // ===== EVENT HANDLERS =====

  FutureOr<void> _onPageStarted(
    ProfilePageStarted event,
    Emitter<ProfileState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        final output = await _getProfileUseCase.execute(
          const GetProfileInput(userId: 1), // Hardcoded cho demo
        );
        emit(state.copyWith(
          profile: output.profile,
          editingName: output.profile.name,
        ));
      },
      // Override: hiển thị error trong page, không phải dialog
      handleError: false,
      doOnError: (e) {
        emit(state.copyWith(errorMessage: exceptionMessageMapper.map(e)));
      },
    );
  }

  FutureOr<void> _onRefreshed(
    ProfileRefreshed event,
    Emitter<ProfileState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        final output = await _getProfileUseCase.execute(
          const GetProfileInput(userId: 1),
        );
        emit(state.copyWith(profile: output.profile));
      },
      doOnError: (e) {
        emit(state.copyWith(errorMessage: exceptionMessageMapper.map(e)));
      },
    );
  }

  void _onEditPressed(
    ProfileEditButtonPressed event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(
      isEditMode: !state.isEditMode,
      editingName: state.profile?.name ?? '',
    ));
  }

  void _onNameChanged(
    ProfileNameChanged event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(editingName: event.name));
  }

  FutureOr<void> _onSavePressed(
    ProfileSaveButtonPressed event,
    Emitter<ProfileState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        final updatedProfile = state.profile!.copyWith(
          name: state.editingName,
        );
        await _updateProfileUseCase.execute(
          UpdateProfileInput(profile: updatedProfile),
        );
        emit(state.copyWith(
          profile: updatedProfile,
          isEditMode: false,
        ));
      },
      // Override: hiển thị error trong page
      handleError: false,
      doOnError: (e) {
        emit(state.copyWith(errorMessage: exceptionMessageMapper.map(e)));
      },
    );
  }
}
```

## 4.5 Event Transformers - Khi Nào Dùng?

| Transformer | Khi nào dùng | Ví dụ |
|-------------|--------------|-------|
| `log()` | Mọi event (debug) | Default cho hầu hết handlers |
| `distinct()` | Text input changes | Email, password, search text |
| `throttleTime()` | Button spam | Login, Submit, Register |
| `debounceTime()` | Search input | Chờ user ngừng gõ rồi mới search |
| `exhaustMap()` | Load data | Page started, refresh, load more |
| `switchMap()` | Search | Hủy search cũ, chỉ search mới nhất |
| `distinctExhaustMap()` | Form input + submit | Input changes nhưng chỉ xử lý submit |

### Chi Tiết Transformers

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  exhaustMap: "Bỏ qua tất cả events mới trong khi đang xử lý"               │
│                                                                             │
│  User click [Login] → Xử lý login (3s) → Xong                             │
│  User click [Login] (trong lúc đang xử lý) → BỎ QUA                       │
│  User click [Login] (sau khi xong) → Xử lý                                │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│  switchMap: "Hủy event cũ, chỉ xử lý event mới nhất"                       │
│                                                                             │
│  User search "a" → Xử lý search "a"                                        │
│  User search "ab" (trong lúc đang xử lý "a") → HỦY "a", xử lý "ab"       │
│  User search "abc" (trong lúc đang xử lý "ab") → HỦY "ab", xử lý "abc"   │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│  debounceTime: "Chờ đến khi user ngừng thao tác"                          │
│                                                                             │
│  User gõ: a-b-c-d (nhanh trong 200ms) → Đợi 300ms không gõ                │
│  → Chỉ xử lý "d"                                                          │
└─────────────────────────────────────────────────────────────────────────────┘
```

## 4.6 runBlocCatching - Chi Tiết Các Options

```dart
runBlocCatching(
  // [BẮT BUỘC] Action cần thực hiện
  action: () async {
    await _useCase.execute(input);
  },

  // ===== LOADING =====
  handleLoading: true,  // Tự động show/hide loading (default: true)

  // ===== ERROR HANDLING =====
  handleError: true,    // Gọi ExceptionHandler hiển thị dialog (default: true)

  // Override: KHÔNG hiển thị dialog, tự xử lý error
  handleError: false,
  doOnError: (e) {
    emit(state.copyWith(errorMessage: exceptionMessageMapper.map(e)));
  },

  // ===== CUSTOM ERROR HANDLING =====
  forceHandleError: (e) => e is NetworkException, // Force handle cho loại này

  // Override message
  overrideErrorMessage: 'Custom error message',

  // ===== RETRY =====
  handleRetry: true,     // Có retry button (default: true)
  maxRetries: 3,         // Số lần retry tối đa

  // Custom retry action
  doOnRetry: () async {
    // Custom logic trước khi retry
  },

  // ===== CALLBACKS =====
  doOnSubscribe: () {
    // Gọi trước khi action bắt đầu
  },

  doOnSuccessOrError: () {
    // Gọi sau khi action hoàn thành (thành công hoặc lỗi)
  },

  doOnEventCompleted: () {
    // Gọi CUỐI CÙNG (finally)
  },
)
```

---

# 5. LAYER 4: APP - UI PAGE

## 5.1 BasePageState - Page Implementation

### Cấu Trúc Page

```dart
// File: app/lib/ui/profile/profile_page.dart

@RoutePage()
class ProfilePage extends BasePage<ProfileBloc> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ProfileBloc bloc, ProfileState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          if (!state.isEditMode)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => bloc.add(const ProfileEditButtonPressed()),
            ),
        ],
      ),
      body: _buildBody(context, bloc, state),
    );
  }

  Widget _buildBody(BuildContext context, ProfileBloc bloc, ProfileState state) {
    // Loading
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Error
    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.errorMessage!),
            ElevatedButton(
              onPressed: () => bloc.add(const ProfilePageStarted()),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    // No profile
    if (!state.hasProfile) {
      return const Center(child: Text('No profile'));
    }

    // Profile content
    return _buildProfileContent(context, bloc, state);
  }

  Widget _buildProfileContent(
    BuildContext context,
    ProfileBloc bloc,
    ProfileState state,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Avatar
          CircleAvatar(
            radius: 50,
            backgroundImage: state.profile!.avatarUrl != null
                ? NetworkImage(state.profile!.avatarUrl!)
                : null,
            child: state.profile!.avatarUrl == null
                ? const Icon(Icons.person, size: 50)
                : null,
          ),

          const SizedBox(height: 16),

          // Name
          if (state.isEditMode)
            TextField(
              controller: TextEditingController(text: state.editingName),
              onChanged: (value) => bloc.add(ProfileNameChanged(name: value)),
              decoration: const InputDecoration(labelText: 'Name'),
            )
          else
            Text(
              state.profile!.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          const SizedBox(height: 8),

          // Email (readonly)
          Text(state.profile!.email),

          const SizedBox(height: 24),

          // Save button (edit mode)
          if (state.isEditMode) ...[
            ElevatedButton(
              onPressed: state.canSave && !state.isSaving
                  ? () => bloc.add(const ProfileSaveButtonPressed())
                  : null,
              child: state.isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save'),
            ),
          ],
        ],
      ),
    );
  }
}
```

## 5.2 BlocListener - Lắng Nghe CommonBloc

```dart
// File: app/lib/app.dart (hoặc router)

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  // ...

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ProfileRoute.page,
          path: '/profile',
        ),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.material();
}
```

### Lắng Nghe Exception từ CommonBloc

```dart
// Thường được setup ở App widget hoặc Router

 BlocListener<CommonBloc, CommonState>(
  listener: (context, state) {
    // Có exception → hiển thị dialog
    if (state.appExceptionWrapper != null) {
      final handler = getIt<ExceptionHandler>();
      final mapper = getIt<ExceptionMessageMapper>();

      final message = mapper.map(state.appExceptionWrapper!.appException);
      handler.handleException(state.appExceptionWrapper, message);

      // Clear exception sau khi đã handle
      context.read<CommonBloc>().add(const ExceptionCleared());
    }

    // Có loading → hiển thị indicator
    if (state.isLoading) {
      // Show loading
    } else {
      // Hide loading
    }
  },
  child: MaterialApp.router(
    // ...
  ),
)
```

---

# 6. LAYER 5: NAVIGATION

## 6.1 AppRouteInfo - Type-Safe Routes

```dart
// File: domain/lib/src/navigation/app_route_info.dart

part 'app_route_info.freezed.dart';

@freezed
class AppRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.login() = _Login;

  const factory AppRouteInfo.main() = _Main;

  const factory AppRouteInfo.profile({required int userId}) = _Profile;

  const factory AppRouteInfo.itemDetail({
    required int itemId,
    String? fromScreen,
  }) = _ItemDetail;

  // Redirect routes
  const factory AppRouteInfo.unknown() = _Unknown;
}
```

## 6.2 BaseRouteInfoMapper - Map RouteInfo → AutoRoute

```dart
// File: app/lib/navigation/mapper/app_route_info_mapper.dart

@Injectable()
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
      profile: (userId) => ProfileRoute(userId: userId),
      itemDetail: (itemId, fromScreen) => ItemDetailRoute(
        itemId: itemId,
        fromScreen: fromScreen,
      ),
      unknown: () => const UnknownRoute(),
    );
  }
}
```

## 6.3 Navigation Trong BLoC

```dart
// Điều hướng từ BLoC

// Push (thêm vào stack)
await navigator.push(AppRouteInfo.profile(userId: 123));

// Replace (thay thế current)
await navigator.replace(AppRouteInfo.main());

// Pop (quay lại)
await navigator.pop();

// Pop và push
await navigator.popAndPush(AppRouteInfo.profile(userId: 123));

// Xóa tất cả, chỉ giữ một route
await navigator.replaceAll([AppRouteInfo.login()]);
```

---

# 7. THỰC HÀNH: XÂY DỰNG FEATURE PROFILE

## Yêu Cầu

- Hiển thị thông tin profile user
- Pull to refresh
- Chỉnh sửa tên
- Xử lý loading và error

## 7.1 Bước 1: Tạo Entity (Domain)

```dart
// domain/lib/src/entity/profile.dart

class Profile {
  const Profile({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  final int id;
  final String name;
  final String email;
  final String? avatarUrl;

  Profile copyWith({
    int? id,
    String? name,
    String? email,
    String? avatarUrl,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
```

## 7.2 Bước 2: Tạo Input/Output (Domain)

```dart
// domain/lib/src/usecase/get_profile/get_profile.dart

part 'get_profile.freezed.dart';

@freezed
sealed class GetProfileInput extends BaseInput with _$GetProfileInput {
  const factory GetProfileInput({required int userId}) = _GetProfileInput;
}

@freezed
sealed class GetProfileOutput extends BaseOutput with _$GetProfileOutput {
  const factory GetProfileOutput({required Profile profile}) = _GetProfileOutput;
}

@freezed
sealed class UpdateProfileInput extends BaseInput with _$UpdateProfileInput {
  const factory UpdateProfileInput({required Profile profile}) =
      _UpdateProfileInput;
}
```

## 7.3 Bước 3: Tạo UseCase (Domain)

```dart
// domain/lib/src/usecase/get_profile/get_profile_use_case.dart

@Injectable()
class GetProfileUseCase extends BaseFutureUseCase<GetProfileInput, GetProfileOutput> {
  const GetProfileUseCase(this._repository);

  final Repository _repository;

  @override
  Future<GetProfileOutput> buildUseCase(GetProfileInput input) async {
    final profile = await _repository.getProfile(userId: input.userId);
    return GetProfileOutput(profile: profile);
  }
}

// domain/lib/src/usecase/update_profile/update_profile_use_case.dart

@Injectable()
class UpdateProfileUseCase
    extends BaseFutureUseCase<UpdateProfileInput, NoOutput> {
  const UpdateProfileUseCase(this._repository);

  final Repository _repository;

  @override
  Future<NoOutput> buildUseCase(UpdateProfileInput input) async {
    await _repository.updateProfile(profile: input.profile);
    return const NoOutput();
  }
}

@freezed
sealed class NoOutput extends BaseOutput with _$NoOutput {
  const factory NoOutput() = _NoOutput;
}
```

## 7.4 Bước 4: Thêm Method vào Repository (Domain)

```dart
// domain/lib/src/repository/repository.dart

abstract class Repository {
  // ... existing ...

  Future<Profile> getProfile({required int userId});
  Future<void> updateProfile({required Profile profile});
}
```

## 7.5 Bước 5: Tạo DTO (Data)

```dart
// data/lib/src/repository/source/api/model/profile_response.dart

@JsonSerializable()
class ProfileResponse {
  const ProfileResponse({
    this.id,
    this.name,
    this.email,
    this.avatarUrl,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? avatarUrl;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
```

## 7.6 Bước 6: Tạo DataMapper (Data)

```dart
// data/lib/src/repository/source/api/mapper/profile_data_mapper.dart

@Injectable()
class ProfileDataMapper extends BaseDataMapper<ProfileResponse, Profile> {
  @override
  Profile mapToEntity(ProfileResponse? data) {
    return Profile(
      id: data?.id ?? -1,
      name: data?.name ?? '',
      email: data?.email ?? '',
      avatarUrl: data?.avatarUrl,
    );
  }
}
```

## 7.7 Bước 7: Implement Repository (Data)

```dart
// data/lib/src/repository/repository_impl.dart

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  RepositoryImpl(
    this._appApiService,
    this._profileDataMapper,
  );

  final AppApiService _appApiService;
  final ProfileDataMapper _profileDataMapper;

  @override
  Future<Profile> getProfile({required int userId}) async {
    final response = await _appApiService.getProfile(userId: userId);
    return _profileDataMapper.mapToEntity(response);
  }

  @override
  Future<void> updateProfile({required Profile profile}) async {
    final response = ProfileResponse(
      id: profile.id,
      name: profile.name,
      email: profile.email,
      avatarUrl: profile.avatarUrl,
    );
    await _appApiService.updateProfile(
      userId: profile.id,
      profile: response,
    );
  }
}
```

## 7.8 Bước 8: Tạo Events (App)

```dart
// app/lib/ui/profile/bloc/profile_event.dart

part 'profile_event.freezed.dart';

abstract class ProfileEvent extends BaseBlocEvent {
  const ProfileEvent();
}

@freezed
sealed class ProfilePageStarted extends ProfileEvent
    with _$ProfilePageStarted {
  const factory ProfilePageStarted() = _ProfilePageStarted;
}

@freezed
sealed class ProfileRefreshed extends ProfileEvent with _$ProfileRefreshed {
  const factory ProfileRefreshed() = _ProfileRefreshed;
}

@freezed
sealed class ProfileEditPressed extends ProfileEvent
    with _$ProfileEditPressed {
  const factory ProfileEditPressed() = _ProfileEditPressed;
}

@freezed
sealed class ProfileNameChanged extends ProfileEvent
    with _$ProfileNameChanged {
  const factory ProfileNameChanged({required String name}) = _ProfileNameChanged;
}

@freezed
sealed class ProfileSavePressed extends ProfileEvent
    with _$ProfileSavePressed {
  const factory ProfileSavePressed() = _ProfileSavePressed;
}
```

## 7.9 Bước 9: Tạo State (App)

```dart
// app/lib/ui/profile/bloc/profile_state.dart

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState extends BaseBlocState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState({
    Profile? profile,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isEditMode,
    String editingName = '',
    String? errorMessage,
  }) = _ProfileState;

  bool get hasProfile => profile != null;
  bool get canSave => editingName.isNotEmpty;
}
```

## 7.10 Bước 10: Tạo BLoC (App)

```dart
// app/lib/ui/profile/bloc/profile_bloc.dart

@Injectable()
class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._getProfileUseCase,
    this._updateProfileUseCase,
  ) : super(const ProfileState()) {
    on<ProfilePageStarted>(_onPageStarted, transformer: exhaustMap());
    on<ProfileRefreshed>(_onRefreshed, transformer: exhaustMap());
    on<ProfileEditPressed>(_onEditPressed);
    on<ProfileNameChanged>(_onNameChanged, transformer: distinct());
    on<ProfileSavePressed>(_onSavePressed, transformer: exhaustMap());
  }

  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  FutureOr<void> _onPageStarted(
    ProfilePageStarted event,
    Emitter<ProfileState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        final output = await _getProfileUseCase.execute(
          const GetProfileInput(userId: 1),
        );
        emit(state.copyWith(
          profile: output.profile,
          editingName: output.profile.name,
        ));
      },
      handleError: false,
      doOnError: (e) {
        emit(state.copyWith(errorMessage: exceptionMessageMapper.map(e)));
      },
    );
  }

  FutureOr<void> _onRefreshed(
    ProfileRefreshed event,
    Emitter<ProfileState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        final output = await _getProfileUseCase.execute(
          const GetProfileInput(userId: 1),
        );
        emit(state.copyWith(profile: output.profile));
      },
    );
  }

  void _onEditPressed(
    ProfileEditPressed event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(
      isEditMode: !state.isEditMode,
      editingName: state.profile?.name ?? '',
    ));
  }

  void _onNameChanged(
    ProfileNameChanged event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(editingName: event.name));
  }

  FutureOr<void> _onSavePressed(
    ProfileSavePressed event,
    Emitter<ProfileState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        final updated = state.profile!.copyWith(name: state.editingName);
        await _updateProfileUseCase.execute(
          UpdateProfileInput(profile: updated),
        );
        emit(state.copyWith(profile: updated, isEditMode: false));
      },
      handleError: false,
      doOnError: (e) {
        emit(state.copyWith(errorMessage: exceptionMessageMapper.map(e)));
      },
    );
  }
}
```

## 7.11 Bước 11: Tạo Page (App)

```dart
// app/lib/ui/profile/profile_page.dart

@RoutePage()
class ProfilePage extends BasePage<ProfileBloc> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ProfileBloc bloc, ProfileState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => bloc.add(const ProfileEditPressed()),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          bloc.add(const ProfileRefreshed());
          // Đợi state thay đổi
          await Future.delayed(const Duration(seconds: 1));
        },
        child: _buildBody(context, bloc, state),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ProfileBloc bloc, ProfileState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.errorMessage!),
            ElevatedButton(
              onPressed: () => bloc.add(const ProfilePageStarted()),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (!state.hasProfile) {
      return const Center(child: Text('No profile'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: state.profile!.avatarUrl != null
              ? NetworkImage(state.profile!.avatarUrl!)
              : null,
        ),
        const SizedBox(height: 16),
        if (state.isEditMode)
          TextField(
            controller: TextEditingController(text: state.editingName),
            onChanged: (v) => bloc.add(ProfileNameChanged(name: v)),
            decoration: const InputDecoration(labelText: 'Name'),
          )
        else
          Text(state.profile!.name),
        const SizedBox(height: 8),
        Text(state.profile!.email),
        if (state.isEditMode) ...[
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: state.canSave
                ? () => bloc.add(const ProfileSavePressed())
                : null,
            child: const Text('Save'),
          ),
        ],
      ],
    );
  }
}
```

## 7.12 Bước 12: Thêm Route (Navigation)

```dart
// domain/lib/src/navigation/app_route_info.dart

@freezed
class AppRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.profile() = _Profile;
}

// app/lib/navigation/mapper/app_route_info_mapper.dart

@Injectable()
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      profile: () => const ProfileRoute(),
      // ...
    );
  }
}

// Auto Route
@AutoRouteConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
      ];
}
```

---

# 8. THỰC HÀNH: XÂY DỰNG FEATURE SEARCH (Pagination)

## Yêu Cầu

- Search với debounce (chờ user ngừng gõ)
- Load more (pagination)
- Pull to refresh

## 8.1 BLoC với Pagination

```dart
// app/lib/ui/search/bloc/search_event.dart

part 'search_event.freezed.dart';

abstract class SearchEvent extends BaseBlocEvent {
  const SearchEvent();
}

@freezed
sealed class SearchQueryChanged extends SearchEvent
    with _$SearchQueryChanged {
  const factory SearchQueryChanged({required String query}) = _SearchQueryChanged;
}

@freezed
sealed class SearchLoadMore extends SearchEvent with _$SearchLoadMore {
  const factory SearchLoadMore() = _SearchLoadMore;
}

@freezed
sealed class SearchRefreshed extends SearchEvent with _$SearchRefreshed {
  const factory SearchRefreshed() = _SearchRefreshed;
}

@freezed
sealed class SearchCleared extends SearchEvent with _$SearchCleared {
  const factory SearchCleared() = _SearchCleared;
}
```

```dart
// app/lib/ui/search/bloc/search_state.dart

part 'search_state.freezed.dart';

@freezed
sealed class SearchState extends BaseBlocState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default('') String query,
    @Default([]) List<Profile> results,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
    String? errorMessage,
  }) = _SearchState;

  bool get isEmpty => query.isEmpty;
  bool get hasResults => results.isNotEmpty;
}
```

```dart
// app/lib/ui/search/bloc/search_bloc.dart

@Injectable()
class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  SearchBloc(this._searchUseCase) : super(const SearchState()) {
    // Debounce: chờ user ngừng gõ 300ms
    on<SearchQueryChanged>(
      _onQueryChanged,
      transformer: debounceTime(),
    );

    // Load more khi scroll đến cuối
    on<SearchLoadMore>(
      _onLoadMore,
      transformer: exhaustMap(),
    );

    // Refresh
    on<SearchRefreshed>(
      _onRefreshed,
      transformer: exhaustMap(),
    );

    // Clear search
    on<SearchCleared>(_onCleared);
  }

  final SearchUsersUseCase _searchUseCase;

  static const _pageSize = 20;

  FutureOr<void> _onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) {
    if (event.query.isEmpty) {
      emit(const SearchState());
      return;
    }

    return runBlocCatching(
      action: () async {
        final output = await _searchUseCase.execute(
          SearchUsersInput(
            query: event.query,
            page: 1,
            limit: _pageSize,
          ),
        );

        emit(state.copyWith(
          query: event.query,
          results: output.users,
          hasReachedMax: output.users.length < _pageSize,
        ));
      },
    );
  }

  FutureOr<void> _onLoadMore(
    SearchLoadMore event,
    Emitter<SearchState> emit,
  ) {
    if (state.hasReachedMax || state.isLoadingMore) return;

    return runBlocCatching(
      action: () async {
        final currentPage = (state.results.length / _pageSize).ceil() + 1;

        final output = await _searchUseCase.execute(
          SearchUsersInput(
            query: state.query,
            page: currentPage,
            limit: _pageSize,
          ),
        );

        emit(state.copyWith(
          results: [...state.results, ...output.users],
          hasReachedMax: output.users.length < _pageSize,
        ));
      },
      // Override: không show loading toàn màn hình
      handleError: false,
      doOnSubscribe: () => emit(state.copyWith(isLoadingMore: true)),
      doOnEventCompleted: () => emit(state.copyWith(isLoadingMore: false)),
    );
  }

  FutureOr<void> _onRefreshed(
    SearchRefreshed event,
    Emitter<SearchState> emit,
  ) {
    if (state.query.isEmpty) return;

    return runBlocCatching(
      action: () async {
        final output = await _searchUseCase.execute(
          SearchUsersInput(
            query: state.query,
            page: 1,
            limit: _pageSize,
          ),
        );

        emit(state.copyWith(
          results: output.users,
          hasReachedMax: output.users.length < _pageSize,
        ));
      },
    );
  }

  void _onCleared(SearchCleared event, Emitter<SearchState> emit) {
    emit(const SearchState());
  }
}
```

---

# 9. THỰC HÀNH: XÂY DỰNG FEATURE SETTINGS (Local Storage)

## Yêu Cầu

- Toggle dark mode
- Chọn ngôn ngữ
- Lưu vào SharedPreferences

## 9.1 Repository với Preferences

```dart
// domain/lib/src/repository/repository.dart

abstract class Repository {
  // ... existing ...

  bool get isDarkMode;
  LanguageCode get languageCode;

  Future<bool> saveIsDarkMode(bool isDarkMode);
  Future<bool> saveLanguageCode(LanguageCode languageCode);
}
```

```dart
// data/lib/src/repository/repository_impl.dart

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  RepositoryImpl(this._appPreferences);

  final AppPreferences _appPreferences;

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

  @override
  LanguageCode get languageCode => _appPreferences.languageCode;

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _appPreferences.saveIsDarkMode(isDarkMode);
  }

  @override
  Future<bool> saveLanguageCode(LanguageCode languageCode) {
    return _appPreferences.saveLanguageCode(languageCode);
  }
}
```

## 9.2 BLoC Settings

```dart
// app/lib/ui/settings/bloc/settings_event.dart

part 'settings_event.freezed.dart';

abstract class SettingsEvent extends BaseBlocEvent {
  const SettingsEvent();
}

@freezed
sealed class SettingsPageStarted extends SettingsEvent
    with _$SettingsPageStarted {
  const factory SettingsPageStarted() = _SettingsPageStarted;
}

@freezed
sealed class SettingsDarkModeToggled extends SettingsEvent
    with _$SettingsDarkModeToggled {
  const factory SettingsDarkModeToggled({required bool isDarkMode}) =
      _SettingsDarkModeToggled;
}

@freezed
sealed class SettingsLanguageChanged extends SettingsEvent
    with _$SettingsLanguageChanged {
  const factory SettingsLanguageChanged({required LanguageCode languageCode}) =
      _SettingsLanguageChanged;
}
```

```dart
// app/lib/ui/settings/bloc/settings_state.dart

part 'settings_state.freezed.dart';

@freezed
sealed class SettingsState extends BaseBlocState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState({
    @Default(false) bool isDarkMode,
    @Default(LanguageCode.en) LanguageCode languageCode,
    @Default(false) bool isLoading,
  }) = _SettingsState;
}
```

```dart
// app/lib/ui/settings/bloc/settings_bloc.dart

@Injectable()
class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._saveDarkModeUseCase, this._saveLanguageUseCase)
      : super(const SettingsState()) {
    on<SettingsPageStarted>(_onPageStarted);
    on<SettingsDarkModeToggled>(_onDarkModeToggled);
    on<SettingsLanguageChanged>(_onLanguageChanged);
  }

  final SaveIsDarkModeUseCase _saveDarkModeUseCase;
  final SaveLanguageCodeUseCase _saveLanguageUseCase;

  FutureOr<void> _onPageStarted(
    SettingsPageStarted event,
    Emitter<SettingsState> emit,
  ) {
    // Load settings từ repository (thường là sync)
    final isDarkMode = _repository.isDarkMode;
    final languageCode = _repository.languageCode;

    emit(state.copyWith(
      isDarkMode: isDarkMode,
      languageCode: languageCode,
    ));
  }

  FutureOr<void> _onDarkModeToggled(
    SettingsDarkModeToggled event,
    Emitter<SettingsState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await _saveDarkModeUseCase.execute(
          SaveIsDarkModeInput(isDarkMode: event.isDarkMode),
        );
        emit(state.copyWith(isDarkMode: event.isDarkMode));
      },
      handleError: false,
    );
  }

  FutureOr<void> _onLanguageChanged(
    SettingsLanguageChanged event,
    Emitter<SettingsState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await _saveLanguageUseCase.execute(
          SaveLanguageCodeInput(languageCode: event.languageCode),
        );
        emit(state.copyWith(languageCode: event.languageCode));
      },
      handleError: false,
    );
  }
}
```

---

# 10. CÁC HELPER CLASSES QUAN TRỌNG

## 10.1 DisposeBag - Cleanup Resources

```dart
// Khi cần cleanup subscriptions, listeners...

class MyBloc extends BaseBloc<MyEvent, MyState> {
  MyBloc(this._repository) : super(const MyState()) {
    // Thêm vào disposeBag
    _subscription = _repository.getStream().listen((data) {
      // Xử lý...
    }).disposedBy(disposeBag);
  }

  final _repository;
  StreamSubscription? _subscription;

  // Khi BLoC close, subscription sẽ tự động cancel
}
```

## 10.2 AppNavigator - Navigation

```dart
// Có sẵn trong BaseBloc

class MyBloc extends BaseBloc<MyEvent, MyState> {
  FutureOr<void> _onNavigate(MyEvent event, Emitter<MyState> emit) {
    // Push
    await navigator.push(AppRouteInfo.profile(userId: 1));

    // Replace
    await navigator.replace(AppRouteInfo.main());

    // Pop
    await navigator.pop();

    // Pop until
    navigator.popUntilRoot();
  }
}
```

## 10.3 ExceptionHandler - Xử Lý Lỗi

```dart
// ExceptionHandler đã được setup trong CommonBloc
// Bạn chỉ cần throw AppException trong UseCase

class MyUseCase extends BaseFutureUseCase<Input, Output> {
  @override
  Future<Output> buildUseCase(Input input) async {
    if (somethingWrong) {
      throw RemoteException(
        kind: RemoteExceptionKind.serverDefined,
        generalServerMessage: 'Custom error message',
      );
    }

    if (validationFailed) {
      throw const ValidationException(
        ValidationExceptionKind.invalidEmail,
      );
    }
  }
}
```

---

# TÓM TẮT

## Checklist Khi Tạo Feature Mới

```
□ 1. DOMAIN LAYER
   □ Entity (nếu cần)
   □ Input/Output classes
   □ UseCase (BaseFutureUseCase, BaseSyncUseCase, BaseStreamUseCase)
   □ Repository interface (thêm method)

□ 2. DATA LAYER
   □ DTO models (API responses)
   □ DataMapper (BaseDataMapper)
   □ RepositoryImpl (implement method)

□ 3. APP LAYER - BLoC
   □ Events (BaseBlocEvent + Freezed)
   □ State (BaseBlocState + Freezed)
   □ BLoC (BaseBloc)
      □ Đăng ký handlers
      □ Chọn transformers phù hợp
      □ Dùng runBlocCatching với options đúng

□ 4. APP LAYER - UI
   □ Page (BasePage)
   □ BlocListener (nếu cần)
   □ Route (AppRouteInfo + AppRouteInfoMapper)

□ 5. DEPENDENCY INJECTION
   □ Đăng ký UseCase với @Injectable()
   □ Đăng ký BLoC với @Injectable()
   □ Đăng ký Mapper với @Injectable()
```

## Common Patterns

| Pattern | Khi nào | Transformer |
|---------|---------|-------------|
| Load data | Vào trang, refresh | `exhaustMap()` |
| Form input | Text changes | `distinct()` |
| Search | Search text | `debounceTime()` |
| Submit | Button press | `exhaustMap()` |
| Load more | Scroll to bottom | `exhaustMap()` |

## runBlocCatching Options

| Option | Mặc định | Mục đích |
|--------|----------|----------|
| `handleLoading` | `true` | Auto show/hide loading |
| `handleError` | `true` | Hiện dialog error |
| `handleRetry` | `true` | Có nút retry |
| `handleError: false` | - | Tự xử lý error trong page |
| `forceHandleError` | - | Force handle cho exception type |
| `maxRetries` | `null` | Số lần retry tối đa |

---

Bạn có muốn tôi tiếp tục với phần nào khác không? Ví dụ:
1. Chi tiết về Exception hierarchy
2. Chi tiết về Dependency Injection setup
3. Chi tiết về API Interceptors
