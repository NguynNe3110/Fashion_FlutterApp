import 'package:shared/shared.dart';

import '../../data.dart';


Future<T> runSupabaseCatching<T>({
  required Future<T> Function() action,
  void Function(Object error)? onError,
}) async {
  try {
    return await action();
  } on AppException {
    // k can lam gi
    rethrow;
  } catch (e) {
    onError?.call(e);
    throw SupabaseExceptionMapper().map(e);
  }
}
