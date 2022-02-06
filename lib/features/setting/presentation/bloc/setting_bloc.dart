import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_tdd_boilerplate/core/event/event.dart';
import 'package:flutter_tdd_boilerplate/core/error/failure.dart';
import 'package:flutter_tdd_boilerplate/core/usecase/usecase.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/light_theme.dart';
import 'package:flutter_tdd_boilerplate/features/setting/domain/usecases/get_locale_usecase.dart';
import 'package:flutter_tdd_boilerplate/features/setting/domain/usecases/get_theme_usecase.dart';
import 'package:flutter_tdd_boilerplate/features/setting/domain/usecases/set_locale_usecase.dart';
import 'package:flutter_tdd_boilerplate/features/setting/domain/usecases/set_theme_usecase.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@singleton
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(
    this._getLocaleUseCase,
    this._getThemeUseCase,
    this._setLocaleUsecase,
    this._setThemeUsecase,
  ) : super(SettingState.init()) {
    on<AppLaunchEvent>(_handleAppLaunch);
    on<SwitchLanguageEvent>(_handleSwitchLanguage);
    on<SwitchThemeEvent>(_handleSwitchTheme);
  }

  final GetThemeUseCase _getThemeUseCase;
  final GetLocaleUseCase _getLocaleUseCase;
  final SetLocaleUsecase _setLocaleUsecase;
  final SetThemeUsecase _setThemeUsecase;

  Future<void> _handleAppLaunch(
      AppLaunchEvent event, Emitter<SettingState?> emit) async {
    var params = ContextParams(event.context!);
    var resultTheme = await _getThemeUseCase.call(params);
    var resultLocale = await _getLocaleUseCase.call(params);

    AppTheme? appTheme;
    resultTheme.when((error) {
      appTheme = LightTheme.instance;
    }, (success) {
      appTheme = success;
    });

    Locale? locale;
    resultLocale.when((error) {
      locale = Locale('en', '');
    }, (success) {
      locale = success;
    });

    emit(
      state.loaded(
        appTheme: appTheme,
        locale: locale,
      ),
    );
  }

  Future<void> _handleSwitchLanguage(
      SwitchLanguageEvent event, Emitter<SettingState?> emit) async {
    var result = await _setLocaleUsecase.call(SetLanguageParams(event.locale));
    result.when((error) {}, (success) {
      emit(
        state.switchLanguage(success),
      );
    });
  }

  Future<void> _handleSwitchTheme(
      SwitchThemeEvent event, Emitter<SettingState?> emit) async {
    var result = await _setThemeUsecase.call(SetThemeParams(event.theme));
    result.when(
      (error) => emit(state.fail(error)),
      (success) => emit(
        state.switchTheme(success),
      ),
    );
  }
}
