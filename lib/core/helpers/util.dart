
import "package:flutter/material.dart";


bool isNullOrBlank(String? data) => data?.trim().isEmpty ?? true;
void showSnackBar(
  String text, {
  Duration duration = const Duration(seconds: 2),
}) {
  Globals.scaffoldMessengerKey.currentState
    ?..clearSnackBars()
    ..showSnackBar(
      SnackBar(content: Text(text), duration: duration),
    );
}


class Globals {
  const Globals._();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}