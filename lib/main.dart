import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/bloc/setting_bloc.dart';
import 'core/event/event.dart';
import 'database/database.dart';
import 'di/injection.dart';
import 'features/_root/root_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  configureDependencies();

  runApp(
    Phoenix(
      child: MultiBlocProvider(providers: [
        BlocProvider<SettingBloc>(
          create: (BuildContext context) =>
              inject()..add(AppLaunchEvent(context: context)),
        ),
      ], child: const RootApp()),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return MaterialApp(
          key: UniqueKey(),
          title: 'Boilerplate',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('vi', ''),
          ],
          home: const RootController(),
          localeResolutionCallback: (
            Locale? locale,
            Iterable<Locale> supportedLocales,
          ) {
            return state.locale ?? locale;
          },
        );
      },
    );
  }
}
