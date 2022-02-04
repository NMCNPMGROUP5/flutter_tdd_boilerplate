import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/error/failure.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SettingRepositoty {
  Result<Failure, AppTheme> getAppTheme(BuildContext context);
  Result<Failure, Locale> getLocale(BuildContext context);
  Result<Failure, AppTheme> setTheme(AppTheme theme);
  Result<Failure, Locale> setLocale(Locale locale);
}
