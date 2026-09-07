import 'package:dio/dio.dart';

abstract class BaseInterceptor extends InterceptorsWrapper {
  static const basicAuthPriority = 40;
  static const connectivityPriority = 99; // machine_learning second
  static const customLogPriority = 1; // machine_learning last
  static const headerPriority = 19;
  static const accessTokenPriority = 20;
  static const refreshTokenPriority = 30;
  static const retryOnErrorPriority = 100; // machine_learning first

  /// higher, machine_learning first
  /// lower, machine_learning last
  int get priority;
}
