import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/light_theme.dart';
import 'package:flutter_tdd_boilerplate/di/injection.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class AppTheme {
  Color get backgroundColor;
  Color get textColor;
  Brightness get brightness;
  FontSize get fontSize;
  String toString();

  static AppTheme get instance {
    final bloc = inject<SettingBloc>();
    return bloc.state.appTheme ?? LightTheme.instance;
  }
}

@singleton
class FontSize {
  final double normal = 14;
  final double title = 16;
}
