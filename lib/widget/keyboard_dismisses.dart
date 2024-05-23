import 'package:flutter/cupertino.dart';

class KeyboardDismisses extends StatelessWidget {
  const KeyboardDismisses({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
