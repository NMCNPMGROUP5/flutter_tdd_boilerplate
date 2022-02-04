part of 'setting_bloc.dart';

abstract class SettingEvent extends Event {}

class SwitchLanguageEvent extends SettingEvent {
  final Locale locale;

  SwitchLanguageEvent(this.locale);
}

class SwitchThemeEvent extends SettingEvent {
  final AppTheme theme;

  SwitchThemeEvent(this.theme);
}
