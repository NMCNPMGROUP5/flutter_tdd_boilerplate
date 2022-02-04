import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/light_theme.dart';
import 'package:flutter_tdd_boilerplate/di/injection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/screen/setting_navigator.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/widgets/setting_option_view.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingNavigator navigator = inject();
  AppTheme theme = AppTheme.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.app_setting,
          style: TextStyle(
            color: theme.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        toolbarHeight: 45,
        backgroundColor: theme.backgroundColor,
        shadowColor: theme.textColor,
        elevation: 1,
      ),
      backgroundColor: theme.backgroundColor,
      body: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(vertical: 12),
            children: [
              SettingOptionView(
                title: AppLocalizations.of(context)!.language,
                msg: state.locale?.languageCode == 'vi'
                    ? AppLocalizations.of(context)!.vi
                    : AppLocalizations.of(context)!.en,
                onPressed: () => navigator.handleShowLanguages(context),
              ),
              SettingOptionView(
                title: AppLocalizations.of(context)!.theme,
                msg: state.appTheme is LightTheme
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                onPressed: () => navigator.handleShowThemes(context),
              ),
            ],
          );
        },
      ),
    );
  }
}
