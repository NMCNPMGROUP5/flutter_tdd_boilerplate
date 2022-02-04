import 'package:flutter_tdd_boilerplate/database/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'setting_entity.g.dart';

@HiveType(typeId: DatabaseType.setting, adapterName: "SettingSystemAdapter")
class SettingEntity {
  @HiveField(0)
  final String? appTheme;
  @HiveField(1)
  final String? locale;

  SettingEntity({this.appTheme, this.locale});

  static const String hiveKey = 'SettingEntity';
}
