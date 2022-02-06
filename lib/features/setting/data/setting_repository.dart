import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/core/error/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'setting_local_data_source.dart';

abstract class SettingRepositoty {
  Result<Failure, AppTheme> getAppTheme(BuildContext context);
  Result<Failure, Locale> getLocale(BuildContext context);
  Result<Failure, AppTheme> setTheme(AppTheme theme);
  Result<Failure, Locale> setLocale(Locale locale);
}

@Singleton(as: SettingRepositoty)
class SettingRepositotyImpl extends SettingRepositoty {
  final SettingLocalDataSource _dataSource;

  SettingRepositotyImpl(this._dataSource);
  @override
  Result<Failure, AppTheme> getAppTheme(BuildContext context) {
    try {
      return Success(_dataSource.getCurrentTheme(context));
    } catch (e) {
      return Error(CacheFailure(message: "getAppTheme" + e.toString()));
    }
  }

  @override
  Result<Failure, Locale> getLocale(BuildContext context) {
    try {
      return Success(_dataSource.getCurrentLocale(context));
    } catch (e) {
      return Error(CacheFailure(message: "getLocale" + e.toString()));
    }
  }

  @override
  Result<Failure, Locale> setLocale(Locale locale) {
    try {
      _dataSource.cacheCurrentLocale(locale);
      return Success(locale);
    } catch (e) {
      return Error(CacheFailure(message: "setLocale" + e.toString()));
    }
  }

  @override
  Result<Failure, AppTheme> setTheme(AppTheme theme) {
    try {
      _dataSource.cacheCurrentTheme(theme);
      return Success(theme);
    } catch (e) {
      return Error(CacheFailure(message: "setTheme" + e.toString()));
    }
  }
}
