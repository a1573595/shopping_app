import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

RestartableTimer useTimberPeriodic(VoidCallback callback, Duration delay, [List<Object?>? keys]) {
  RestartableTimer timer = useMemoized(() => RestartableTimer(delay, () => callback.call()));

  useEffect(() {
    return timer.cancel;
  }, keys);

  return timer;
}
