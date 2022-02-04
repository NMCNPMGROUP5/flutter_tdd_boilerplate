part of 'setting_bloc.dart';

enum SettingStateType {
  init,
  loaded,
  switchLanguage,
  swithTheme,
}

class SettingState extends Equatable {
  final SettingStateType? type;

  final AppTheme? appTheme;

  final Locale? locale;

  final Failure? failure;

  const SettingState({this.failure, this.appTheme, this.locale, this.type});

  @override
  List<Object?> get props => [appTheme, locale, type, failure];

  SettingState fail(Failure? failure) {
    return SettingState(
      appTheme: this.appTheme,
      locale: this.locale,
      type: this.type,
      failure: failure,
    );
  }

  SettingState switchTheme(AppTheme theme) {
    return SettingState(
      appTheme: theme,
      locale: this.locale,
      type: SettingStateType.swithTheme,
    );
  }

  SettingState switchLanguage(Locale locale) {
    return SettingState(
      appTheme: this.appTheme,
      locale: locale,
      type: SettingStateType.switchLanguage,
    );
  }

  SettingState loaded({AppTheme? appTheme, Locale? locale}) {
    return SettingState(
      appTheme: appTheme,
      locale: locale,
      type: SettingStateType.loaded,
    );
  }

  static SettingState init() {
    return SettingState(
        appTheme: null, locale: null, type: SettingStateType.init);
  }
}
