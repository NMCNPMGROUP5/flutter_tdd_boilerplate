import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/dart_theme.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/light_theme.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/core/widgets/loading_popup.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tdd_boilerplate/core/widgets/modal_bottom_sheet.dart';

abstract class SettingNavigator {
  handleShowThemes(BuildContext context);
  handleShowLanguages(BuildContext context);
}

@Singleton(as: SettingNavigator)
class SettingNavigatorImpl extends SettingNavigator {
  final SettingBloc bloc;

  SettingNavigatorImpl(this.bloc);

  @override
  handleShowLanguages(BuildContext context) {
    ModalBottom.show(
        title: AppLocalizations.of(context)!.language,
        items: [
          ItemModal(
              icon: Flag.fromCode(FlagsCode.GB, height: 20, width: 25),
              title: AppLocalizations.of(context)!.en,
              onPress: () async {
                LoadingPopup.show(context);
                await Future.delayed(Duration(milliseconds: 300));
                bloc.add(SwitchLanguageEvent(Locale('en', '')));
                LoadingPopup.hide();
              }),
          ItemModal(
              icon: Flag.fromCode(FlagsCode.VN, height: 20, width: 26),
              title: AppLocalizations.of(context)!.vi,
              onPress: () async {
                LoadingPopup.show(context);
                await Future.delayed(Duration(milliseconds: 300));
                bloc.add(
                  SwitchLanguageEvent(Locale('vi', '')),
                );
                LoadingPopup.hide();
              }),
        ],
        context: context);
  }

  @override
  handleShowThemes(BuildContext context) {
    AppTheme theme = AppTheme.instance;
    ModalBottom.show(
        title: AppLocalizations.of(context)!.themes,
        items: [
          ItemModal(
              icon: Icon(
                Icons.dark_mode,
                color: theme.textColor,
              ),
              title: AppLocalizations.of(context)!.dark,
              onPress: () async {
                LoadingPopup.show(context);
                await Future.delayed(Duration(milliseconds: 300));
                bloc.add(SwitchThemeEvent(DarkTheme.instance));
                LoadingPopup.hide();
              }),
          ItemModal(
            icon: Icon(
              Icons.light_mode,
              color: theme.textColor,
            ),
            title: AppLocalizations.of(context)!.light,
            onPress: () async {
              LoadingPopup.show(context);
              await Future.delayed(Duration(milliseconds: 300));
              bloc.add(SwitchThemeEvent(LightTheme.instance));
              LoadingPopup.hide();
            },
          ),
        ],
        context: context);
  }
}
