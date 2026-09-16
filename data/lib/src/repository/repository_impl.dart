import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../data.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  RepositoryImpl(
    this._appApiService,
    this._appPreferences,
    this._appDatabase,
    this._preferenceUserDataMapper,
    this._userDataMapper,
    this._languageCodeDataMapper,
    this._genderDataMapper,
    this._localUserDataMapper,
    this._supabaseClient,
  );

  final AppApiService _appApiService;
  final AppPreferences _appPreferences;
  final AppDatabase _appDatabase;
  final PreferenceUserDataMapper _preferenceUserDataMapper;
  final ApiUserDataMapper _userDataMapper;
  final LanguageCodeDataMapper _languageCodeDataMapper;
  final GenderDataMapper _genderDataMapper;
  final LocalUserDataMapper _localUserDataMapper;
  final supabase.SupabaseClient _supabaseClient;

  @override
  // --- CODE CŨ: bool get isLoggedIn => _appPreferences.isLoggedIn;
  // --- CODE MỚI: Check session trực tiếp từ Supabase
  bool get isLoggedIn => _supabaseClient.auth.currentSession != null;

  @override
  bool get isFirstLogin => _appPreferences.isFirstLogin;

  @override
  bool get isFirstLaunchApp => _appPreferences.isFirstLaunchApp;

  @override
  Stream<bool> get onConnectivityChanged => Connectivity()
      .onConnectivityChanged
      .map((event) => !event.contains(ConnectivityResult.none));

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

  @override
  LanguageCode get languageCode =>
      _languageCodeDataMapper.mapToEntity(_appPreferences.languageCode);

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _appPreferences.saveIsFirstLogin(isFirstLogin);
  }

  @override
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp) {
    return _appPreferences.saveIsFirsLaunchApp(isFirstLaunchApp);
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    // final response =
    //     await _appApiService.login(email: email, password: password);
    // await Future.wait([
    //   saveAccessToken(response?.data?.accessToken ?? ''),
    //   saveUserPreference(
    //     User(
    //       id: response?.data?.id ?? -1,
    //       email: response?.data?.email ?? '',
    //     ),
    //   ),
    // ]);

    final response = await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user != null) {
      await saveUserPreference(
        User(
          id: -1, // Use a dummy int or update User entity to use String
          email: response.user?.email ?? '',
        ),
      );
    }
  }

  @override
  Future<void> logout() async {

    // await _appApiService.logout();

    await _supabaseClient.auth.signOut();
    await _appPreferences.clearCurrentUserData();
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {

    // return _appApiService.resetPassword(
    //     token: token,
    //     email: email,
    //     password: password,
    //   );

    await _supabaseClient.auth.updateUser(
      supabase.UserAttributes(password: password),
    );
  }

  @override
  Future<void> forgotPassword(String email) async {
    // return _appApiService.forgotPassword(email);
    await _supabaseClient.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  }) async {

    // final response = await _appApiService.register(
    //   username: username,
    //   email: email,
    //   password: password,
    //   gender: _genderDataMapper.mapToData(gender),
    // );
    // await Future.wait([
    //   saveAccessToken(response?.data?.accessToken ?? ''),
    //   saveUserPreference(
    //     User(
    //       id: response?.data?.id ?? -1,
    //       email: response?.data?.email ?? '',
    //     ),
    //   ),
    // ]);

    final response = await _supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': username},
    );
    if (response.user != null) {
      await saveUserPreference(
        User(
          id: -1,
          email: response.user?.email ?? '',
        ),
      );
    }
  }

  @override
  User getUserPreference() =>
      _preferenceUserDataMapper.mapToEntity(_appPreferences.currentUser);

  @override
  Future<void> clearCurrentUserData() => _appPreferences.clearCurrentUserData();

  @override
  Future<PagedList<User>> getUsers({
    required int page,
    required int? limit,
  }) async {
    final response = await _appApiService.getUsers(page: page, limit: limit);

    return PagedList(data: _userDataMapper.mapToListEntity(response?.results));
  }

  @override
  Future<bool> saveLanguageCode(LanguageCode languageCode) {
    return _appPreferences
        .saveLanguageCode(_languageCodeDataMapper.mapToData(languageCode));
  }

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) =>
      _appPreferences.saveIsDarkMode(isDarkMode);

  @override
  Future<User> getMe() async {
    // final response = await _appApiService.getMe();
    // return _userDataMapper.mapToEntity(response);

    final user = _supabaseClient.auth.currentUser;
    return User(
      id: -1,
      email: user?.email ?? '',
    );
  }

  @override
  int deleteAllUsersAndImageUrls() {
    return _appDatabase.deleteAllUsersAndImageUrls();
  }

  @override
  bool deleteImageUrl(int id) {
    return _appDatabase.deleteImageUrl(id);
  }

  @override
  User? getLocalUser(int id) {
    return _localUserDataMapper.mapToEntity(_appDatabase.getUser(id));
  }

  @override
  List<User> getLocalUsers() {
    return _localUserDataMapper.mapToListEntity(_appDatabase.getUsers());
  }

  @override
  Stream<List<User>> getLocalUsersStream() {
    return _appDatabase
        .getUsersStream()
        .map((event) => _localUserDataMapper.mapToListEntity(event));
  }

  @override
  int putLocalUser(User user) {
    final userData = _localUserDataMapper.mapToData(user);

    return _appDatabase.putUser(userData);
  }

  @override
  Future<void> saveAccessToken(String accessToken) =>
      _appPreferences.saveAccessToken(accessToken);

  @override
  Future<bool> saveUserPreference(User user) => _appPreferences
      .saveCurrentUser(_preferenceUserDataMapper.mapToData(user));
}
