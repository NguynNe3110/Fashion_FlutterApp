# 🗺️ Lộ Trình Học Clean Architecture

## Nguyên Tắc Vàng

> **Đừng cố hiểu architecture trước.**
> **Hãy bắt đầu từ bài toán, và bạn sẽ TỰ NHIÊN thấy tại sao cần architecture.**

---

## Level 1: Không có Architecture (Anti-pattern)

### ❌ Bài toán: Đăng nhập

```dart
class LoginPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // User click → Gọi API trực tiếp → Xử lý response
        var response = await http.post('/api/login', body: {
          'email': emailController.text,
          'password': passwordController.text,
        });

        if (response.statusCode == 200) {
          // Lưu token
          // Navigate sang home
        } else {
          // Hiện error
          ScaffoldMessenger.of(context).showSnackBar(
            Text('Login failed')
          );
        }
      },
      child: Text('Login'),
    );
  }
}
```

### 😱 Vấn đề gặp phải:
1. **Code dài, rối** - UI + Logic + API + Error handling tất cả 1 chỗ
2. **Không test được** - Muốn test logic phải mở app
3. **Không reuse được** - Logic login ở đâu khác?
4. **Sửa 1 chỗ, hỏng 10 chỗ** - Thay đổi API format thì sao?

### 💡 Bạn sẽ tự hỏi: "Ơ, có cách nào tổ chức code tốt hơn không?"

---

## Level 2: Tách Logic Ra - Simple Layering

### ✅ Giải pháp: Tách thành 2 lớp

```dart
// ========== Layer 1: Repository (Logic xử lý data) ==========
class LoginRepository {
  Future<bool> login(String email, String password) async {
    var response = await http.post('/api/login', body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      // Lưu token
      await Preferences.saveToken(response.data['token']);
      return true;
    }
    return false;
  }
}

// ========== Layer 2: UI (Chỉ lo hiển thị) ==========
class LoginPage extends StatelessWidget {
  final repo = LoginRepository();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool success = await repo.login(email, password);
        if (success) {
          Navigator.pushNamed(context, '/home');
        }
      },
      child: Text('Login'),
    );
  }
}
```

### 🎯 Đã tốt hơn:
- ✅ UI đỡ rối hơn
- ✅ Logic có thể reuse ở chỗ khác
- ✅ Logic có thể test riêng

### 😱 Nhưng vẫn còn vấn đề:
- Error handling vẫn lộn xộn trong repository
- Hardcoded API URL
- Không biết lỗi gì (network? server? validation?)

---

## Level 3: Thêm Error Handling

### ❌ Bài toán mới: Cần hiển thị message khác nhau cho từng lỗi

```dart
// Thay vì chỉ return true/false
class LoginResult {
  bool success;
  String? errorMessage;

  // Cần phân loại lỗi để hiển thị message phù hợp
}
```

### ✅ Giải pháp: Tạo Error Types

```dart
// ========== Error Types (để phân loại lỗi) ==========
abstract class AppException {
  String getMessage(); // Mỗi lỗi có message riêng
}

class NetworkException extends AppException {
  @override
  String getMessage() => 'Mất kết nối internet';
}

class ServerException extends AppException {
  final int statusCode;
  ServerException(this.statusCode);

  @override
  String getMessage() {
    if (statusCode == 401) return 'Email hoặc password sai';
    return 'Server đang bận, thử lại sau';
  }
}

// ========== Repository trả về Exception ==========
class LoginRepository {
  Future<void> login(String email, String password) async {
    try {
      var response = await http.post('/api/login', body: {...});

      if (response.statusCode == 401) {
        throw ServerException(401);
      }

      // Thành công...
    } on SocketException {
      throw NetworkException();
    }
  }
}

// ========== UI chỉ hiển thị ==========
onPressed: () async {
  try {
    await repo.login(email, password);
    // Thành công
  } on NetworkException catch (e) {
    showSnackBar(e.getMessage()); // "Mất kết nối internet"
  } on ServerException catch (e) {
    showSnackBar(e.getMessage()); // "Email hoặc password sai"
  }
}
```

### 🎯 Bạn đã học được:
- ✅ Phân loại lỗi để xử lý khác nhau
- ✅ Mỗi lớp chỉ làm việc của mình

---

## Level 4: Đến BLoC (Quản lý State)

### ❌ Vấn đề mới: Code xử lý sự kiện trong UI quá rối

```dart
// Cứ mỗi action lại phải try-catch
onPressed: () async {
  try { ... } catch (e) { ... }
}

onEmailChanged: (value) async {
  // Validate email? Lưu state?
  // Lại thêm code
}
```

### ✅ Giải pháp: BLoC Pattern

```dart
// ========== Events (Những gì user làm) ==========
abstract class LoginEvent {}
class EmailChanged extends LoginEvent { final String email; }
class PasswordChanged extends LoginEvent { final String password; }
class LoginButtonPressed extends LoginEvent {}

// ========== States (Những gì UI hiển thị) ==========
class LoginState {
  String email;
  String password;
  bool isLoading;
  String? errorMessage;
}

// ========== BLoC (Xử lý logic) ==========
class LoginBloc {
  LoginState state;

  void onEvent(LoginEvent event) {
    if (event is EmailChanged) {
      state.email = event.email;
      state.errorMessage = null; // Clear error khi user gõ
      emit(state); // UI tự cập nhật
    }

    if (event is LoginButtonPressed) {
      // Xử lý login, set isLoading = true
      // Gọi repository
      // Set isLoading = false
      // Set errorMessage nếu có lỗi
    }
  }
}
```

### 🎯 BLoC giải quyết gì?
- **Tách biệt UI và Logic**: UI chỉ "phản ứng" với state, không lo logic
- **State có thể track được**: Debug dễ hơn
- **UI đơn giản hơn nhiều**

---

## Level 5: Clean Architecture - Đặt tên cho từng lớp

Bây giờ bạn đã trải qua:
- ✅ Layering (tách UI và Logic)
- ✅ Error Handling (phân loại lỗi)
- ✅ State Management (BLoC)

Bây giờ chỉ cần **ĐẶT TÊN** cho các lớp để mọi người cùng hiểu:

```
┌─────────────────────────────────────────────────────────────┐
│  APP LAYER (Presentation)                                  │
│  └── BLoC: Nhận event → Xử lý logic → Emit state          │
│  └── UI: Hiển thị state, gửi event                         │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  DOMAIN LAYER (Business Logic)                             │
│  └── UseCase: Mô tả một hành động nghiệp vụ               │
│  └── Entity: Đối tượng nghiệp vụ (User, Product...)        │
│  └── Repository Interface: Hợp đồng (không quan tâm impl)   │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  DATA LAYER (Implementation)                               │
│  └── RepositoryImpl: Implement hợp đồng từ Domain         │
│  └── DataSource: Gọi API/Database thực tế                │
│  └── Model: Dữ liệu từ API (DTO)                          │
└─────────────────────────────────────────────────────────────┘
```

### 🎯 Tại sao cần đặt tên?

| Tên gọi | Ý nghĩa | Trong codebase này |
|---------|---------|-------------------|
| Entity | Đối tượng nghiệp vụ thuần túy | `User`, `Product` |
| UseCase | Một hành động cụ thể | `LoginUseCase`, `GetUsersUseCase` |
| Repository | Trừu tượng hóa việc lấy data | `Repository` (interface) |
| RepositoryImpl | Implement cụ thể | `RepositoryImpl` |

---

## Level 6: Tại sao cần GENERICS <T>, <E, S>?

### ❌ Vấn đề: Code lặp lại cho từng BLoC

```dart
// BLoC Login
class LoginBloc {
  LoginState state;
  void handle(LoginEvent event) { ... }
}

// BLoC Profile
class ProfileBloc {
  ProfileState state;
  void handle(ProfileEvent event) { ... }
}

// BLoC Settings
class SettingsBloc {
  SettingsState state;
  void handle(SettingsEvent event) { ... }
}
```

### ✅ Giải pháp: Base Classes

```dart
// Tất cả Event phải extend BaseEvent
abstract class BaseEvent {}

// Tất cả State phải extend BaseState
abstract class BaseState {}

// Tất cả BLoC có chung methods
abstract class BaseBloc<E extends BaseEvent, S extends BaseState> {
  S state;

  // Chỉ khai báo method, implement ở subclass
  void add(E event);
  void emit(S newState);
}
```

### 🎯 Kết quả:

```dart
// LoginBloc CHỈ cần khai báo Events và States riêng
// Còn lại đã có sẵn từ BaseBloc
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  void onLoginPressed(LoginPressed event) {
    // Chỉ viết logic riêng
  }
}
```

---

## Level 7: CommonBloc - Gom những cái CHUNG

### ❌ Vấn đề: Mỗi BLoC đều phải tự xử lý:
- Loading indicator
- Error message
- Navigation

```dart
class LoginBloc {
  void onLoginPressed() async {
    state.isLoading = true;
    emit(state);

    try {
      await repo.login();
      state.isLoading = false;
      emit(state);
    } catch (e) {
      state.isLoading = false;
      state.error = e;
      emit(state);
    }
  }
}

class ProfileBloc {
  void onLoadProfile() async {
    state.isLoading = true;  // Lặp lại code
    emit(state);

    try {
      await repo.getProfile();
      // Lặp lại...
    } catch (e) {
      // Lặp lại...
    }
  }
}
```

### ✅ Giải pháp: CommonBloc

```dart
// Một nơi quản lý loading và error CHUNG
class CommonBloc extends Bloc<CommonEvent, CommonState> {
  void showLoading() => add(LoadingVisibilityEmitted(true));
  void hideLoading() => add(LoadingVisibilityEmitted(false));
  void setError(AppException e) => add(ExceptionEmitted(e));
}

// Các BLoC KHÁC chỉ cần gọi:
class LoginBloc extends BaseBloc {
  void onLoginPressed() async {
    showLoading();  // Tự động via BaseBloc

    await runBlocCatching(
      action: () => repo.login(),
      doOnError: (e) => setError(e),
    );

    hideLoading();  // Tự động
  }
}
```

### 🎯 Kết quả:
- ✅ Không lặp code loading/error
- ✅ Consistent UX (tất cả error hiển thị giống nhau)
- ✅ Dễ thay đổi behavior chung

---

## Bước Tiếp Theo: Thực Hành

### 📝 Bài tập để học:

**Bài 1**: Tạo màn hình Profile đơn giản
- UI hiển thị tên, email, avatar
- Gọi API lấy dữ liệu
- Xử lý loading và error

**Bài 2**: Thêm validation
- Validate email format
- Validate password không rỗng
- Hiển thị error inline

**Bài 3**: Thêm refresh (pull to refresh)
- Dùng SwipeRefresh
- Xử lý state empty

---

## 🤔 Để hiểu codebase này, hãy làm theo thứ tự:

1. **Bắt đầu với UI đơn giản** (LoginPage)
2. **Tìm BLoC tương ứng** (LoginBloc)
3. **Đọc LoginEvent** (những gì user làm)
4. **Đọc LoginState** (những gì UI hiển thị)
5. **Đọc LoginBloc** (xử lý logic)
6. **Đọc LoginUseCase** (gọi repository)
7. **Đọc Repository** (interface)
8. **Đọc RepositoryImpl** (implement thực tế)

Mỗi bước tự hỏi: **"Class này giải quyết vấn đề gì?"**

---

## 📚 Tài Liệu Tham Khảo

- **Clean Architecture**: Robert C. Martin
- **Flutter BLoC**: https://bloclibrary.dev
- **Domain-Driven Design**: Eric Evans

---

## ⚡ Điều quan trọng nhất

> **Đừng cố hiểu tất cả cùng lúc.**
>
> **Hãy bắt đầu với một feature nhỏ, và tự hỏi:**
> - "Tại sao tôi cần tách phần này ra?"
> - "Nếu không tách thì sẽ có vấn đề gì?"
>
> **Khi bạn gặp vấn đề thật sự → Clean Architecture sẽ tự "click" trong đầu bạn.**
