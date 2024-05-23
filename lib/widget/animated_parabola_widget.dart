import 'package:flutter/material.dart';

class _AnimatedModel {
  _AnimatedModel({
    required this.uniqueKey,
    required this.startSize,
    required this.endSize,
    required this.startPoint,
    required this.endPoint,
    required this.child,
  });

  bool isActive = false;
  final UniqueKey uniqueKey;
  final Size startSize;
  final Size endSize;
  final Offset startPoint;
  final Offset endPoint;
  final Widget child;
}

extension GlobalKeyExt on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null) {
      return renderObject!.paintBounds.shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

class AnimatedParabolaWidget extends StatefulWidget {
  const AnimatedParabolaWidget({
    super.key,
    required this.child,
    required this.duration,
    this.curve = Curves.easeIn,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  State<AnimatedParabolaWidget> createState() => AnimatedParabolaWidgetState();
}

class AnimatedParabolaWidgetState extends State<AnimatedParabolaWidget> {
  final _animationModelList = <_AnimatedModel>[];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        ..._animationModelList.map(
          (e) => AnimatedPositioned(
            key: e.uniqueKey,
            top: e.isActive ? e.endPoint.dx : e.startPoint.dx,
            left: e.isActive ? e.endPoint.dy : e.startPoint.dy,
            height: e.isActive ? e.endSize.height : e.startSize.height,
            width: e.isActive ? e.endSize.width : e.startSize.width,
            curve: widget.curve,
            duration: widget.duration,
            child: e.child,
            onEnd: () {
              /// todo 有key後可以試試？
            },
          ),
        ),
      ],
    );
  }

  Future<void> startAnimated(GlobalKey startWidgetKey, GlobalKey endWidgetKey) async {
    final model = _AnimatedModel(
      uniqueKey: UniqueKey(),
      startSize: Size(
        startWidgetKey.currentContext!.size!.width,
        startWidgetKey.currentContext!.size!.height,
      ),
      endSize: Size(
        endWidgetKey.currentContext!.size!.width,
        endWidgetKey.currentContext!.size!.height,
      ),
      startPoint: Offset(
        startWidgetKey.globalPaintBounds!.top,
        startWidgetKey.globalPaintBounds!.left,
      ),
      endPoint: Offset(
        endWidgetKey.globalPaintBounds!.top,
        endWidgetKey.globalPaintBounds!.left,
      ),
      child: Container(
        child: (startWidgetKey.currentWidget! as Container).child,
      ),
    );

    _animationModelList.add(model);
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 75));

    model.isActive = true;
    setState(() {});

    Future.delayed(widget.duration, () {
      if (!mounted) return;

      setState(() {
        _animationModelList.remove(model);
      });
    });

    return;
  }
}
