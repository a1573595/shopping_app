import 'package:flutter/widgets.dart';

class WidgetStyle {
  static const double screenHorizontal = 16;
  static const double screenVertical = 16;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: screenHorizontal, vertical: screenVertical);
  static const EdgeInsets screenHorizontalPadding = EdgeInsets.symmetric(horizontal: screenHorizontal);
  static const EdgeInsets screenVerticalPadding = EdgeInsets.symmetric(vertical: screenVertical);

  static const EdgeInsets cardPadding = EdgeInsets.all(12);

  static const BorderRadius circleRadius = BorderRadius.all(Radius.circular(256));
  static const BorderRadius textFieldRadius = BorderRadius.all(Radius.circular(32));
}
