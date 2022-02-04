import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/di/injection.dart';

class DarkTheme implements AppTheme {
  @override
  Color get backgroundColor => Color.fromARGB(255, 33, 33, 33);

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get textColor => Colors.white;

  static DarkTheme _instance = DarkTheme();

  static DarkTheme get instance {
    return _instance;
  }

  @override
  FontSize get fontSize => inject();

  static const String string = 'DarkTheme';

  @override
  String toString() {
    return string;
  }
}
