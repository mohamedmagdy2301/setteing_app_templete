import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/language/app_localizations_setup.dart';

import 'settings_cubit.dart';
import 'settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.themeMode == ThemeModeState.system
                ? ThemeMode.system
                : (state.themeMode == ThemeModeState.light
                    ? ThemeMode.light
                    : ThemeMode.dark),
            locale: state.locale == LocaleState.system
                ? WidgetsBinding.instance.window.locale
                : (state.locale == LocaleState.ar
                    ? const Locale('ar')
                    : const Locale('en')),
            supportedLocales: AppLocalSetup.supportedLocales,
            localeResolutionCallback: AppLocalSetup.localeResolutionCallback,
            localizationsDelegates: AppLocalSetup.localesDelegates,
            home: const SettingsScreen(),
          );
        },
      ),
    );
  }
}
