import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/language/app_localizations_setup.dart';

import 'settings_cubit.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
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
            themeMode: _getThemeMode(state.themeMode),
            locale: _getLocale(state.locale),
            supportedLocales: AppLocalSetup.supportedLocales,
            localeResolutionCallback: AppLocalSetup.localeResolutionCallback,
            localizationsDelegates: AppLocalSetup.localesDelegates,
            home: const SettingsScreen(),
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(ThemeModeState themeMode) {
    switch (themeMode) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }

  Locale _getLocale(LocaleState locale) {
    switch (locale) {
      case LocaleState.ar:
        return const Locale('ar');
      case LocaleState.en:
        return const Locale('en');
      case LocaleState.system:
        return PlatformDispatcher.instance.locales.first;
    }
  }
}
