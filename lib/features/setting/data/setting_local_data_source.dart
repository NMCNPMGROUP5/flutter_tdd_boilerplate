import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/dart_theme.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/light_theme.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/database/database.dart';
import 'package:flutter_tdd_boilerplate/features/setting/domain/entity/setting_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class SettingLocalDataSource {
  void cacheCurrentTheme(AppTheme theme);
  void cacheCurrentLocale(Locale locale);
  AppTheme getCurrentTheme(BuildContext context);
  Locale getCurrentLocale(BuildContext context);
}

@Singleton(as: SettingLocalDataSource)
class SettingLocalDataSourceImpl extends SettingLocalDataSource {
  late SettingEntity? settingEntity;
  var _box = Hive.box(HiveBoxName);
  SettingLocalDataSourceImpl() {
    settingEntity = _box.get(SettingEntity.hiveKey);
  }
  @override
  void cacheCurrentLocale(Locale locale) {
    final newSetting = SettingEntity(
        appTheme: settingEntity?.appTheme, locale: locale.languageCode);

    _box.put(SettingEntity.hiveKey, newSetting);
  }

  @override
  void cacheCurrentTheme(AppTheme theme) {
    final newSetting = SettingEntity(
        appTheme: theme.toString(), locale: settingEntity?.locale);

    _box.put(SettingEntity.hiveKey, newSetting);
  }

  @override
  Locale getCurrentLocale(BuildContext context) {
    if (settingEntity?.locale == null) {
      return Locale('en', '');
    } else {
      return Locale(settingEntity?.locale ?? "", '');
    }
  }

  @override
  AppTheme getCurrentTheme(BuildContext context) {
    if (settingEntity?.appTheme == null) {
      var brightness = SchedulerBinding.instance!.window.platformBrightness;
      switch (brightness) {
        case Brightness.dark:
          return DarkTheme.instance;
        default:
          return LightTheme.instance;
      }
    } else {
      switch (settingEntity?.appTheme) {
        case DarkTheme.string:
          return DarkTheme.instance;
        default:
          return LightTheme.instance;
      }
    }
  }
}
