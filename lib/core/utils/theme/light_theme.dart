import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/di/injection.dart';

class LightTheme implements AppTheme {
  @override
  Color get backgroundColor => Colors.white;

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get textColor => Colors.black;

  static LightTheme _instance = LightTheme();

  static LightTheme get instance {
    return _instance;
  }

  @override
  FontSize get fontSize => inject();

  static const String string = 'LightTheme';

  @override
  String toString() {
    return string;
  }
}
