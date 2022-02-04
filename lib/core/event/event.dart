import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/bloc/setting_bloc.dart';

abstract class Event {}

class FetchScreen extends Event {}

class AppLaunchEvent implements SettingEvent {
  final BuildContext? context;

  AppLaunchEvent({this.context});
}
