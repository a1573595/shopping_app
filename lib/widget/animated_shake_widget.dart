import 'package:flutter/material.dart';

class AnimatedShakeWidget extends StatefulWidget {
  const AnimatedShakeWidget({
    required this.key,
    required this.child,
  }): super(key: key);

  @override
  final GlobalKey<AnimatedShakeWidgetState> key;
  final Widget child;

  @override
  State<AnimatedShakeWidget> createState() => AnimatedShakeWidgetState();
}

class AnimatedShakeWidgetState extends State<AnimatedShakeWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.2, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  Future<void> shake() async {
    await _controller.forward();
    await _controller.reverse();
  }
}
