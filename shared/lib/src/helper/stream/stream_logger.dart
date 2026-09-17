import 'package:rxdart/rxdart.dart';

import '../../../shared.dart';

extension StreamExt<T> on Stream<T> {
  Stream<T> log(
    String name, {
    bool logOnListen = false,
    bool logOnData = false,
    bool logOnError = false,
    bool logOnDone = false,
    bool logOnCancel = false,
  }) {
    return doOnListen(() {
          if (LogConfig.logOnStreamListen && logOnListen) {
            Log.d('▶️ onSubscribed', time: DateTime.now(), name: name);
          }
        })
        .doOnData((event) {
          if (LogConfig.logOnStreamData && logOnData) {
            Log.d('🟢 onEvent: $event', time: DateTime.now(), name: name);
          }
        })
        .doOnCancel(() {
          if (LogConfig.logOnStreamCancel && logOnCancel) {
            Log.d('🟡 onCanceled', time: DateTime.now(), name: name);
          }
        })
        .doOnError((e, _) {
          if (LogConfig.logOnStreamError && logOnError) {
            Log.e('🔴 onError $e', time: DateTime.now(), name: name);
          }
        })
        .doOnDone(() {
          if (LogConfig.logOnStreamDone && logOnDone) {
            Log.d('☑️️ onCompleted', time: DateTime.now(), name: name);
          }
        });
  }
}
