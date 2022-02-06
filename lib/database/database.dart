import 'package:flutter_tdd_boilerplate/features/setting/domain/entity/setting_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

const HiveBoxName = 'flutter_tdd_boilerplate';

class DatabaseType {
  static const int authen = 0;
  static const int setting = 1;
}

class Database {
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SettingSystemAdapter());
    await Hive.openBox(HiveBoxName);
  }
}
