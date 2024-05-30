import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

(AnimationController, Animation<Offset>) useBottomUpAnimation([
  Duration duration = const Duration(milliseconds: 500),
  List<Object?>? keys,
]) {
  final controller = useAnimationController(duration: duration);

  final animation = useMemoized(() => Tween<Offset>(
        begin: const Offset(0.0, 1),
        end: const Offset(0.0, 0.0),
      ).animate(controller));

  useEffect(() {
    controller.forward();

    return;
  }, const []);

  return (controller, animation);
}
