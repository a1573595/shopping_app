import 'package:flutter/material.dart';

extension ObjectExtension<T> on T {
  ReturnType let<ReturnType>(ReturnType Function(T it) operation) {
    return operation(this);
  }
}

extension SizeExtension on Size {
  double get radius => height > width ? width : height;
}
