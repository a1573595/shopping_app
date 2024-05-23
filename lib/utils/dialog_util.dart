import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtil {
  const DialogUtil._();

  static void showLoading(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const Material(
          color: Colors.black12,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

  static void cancelLoading(BuildContext context) => Navigator.of(context, rootNavigator: true).pop();

  static void showToast(String msg) => Fluttertoast.showToast(msg: msg);
}
