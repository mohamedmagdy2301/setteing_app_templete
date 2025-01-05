import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/language/app_localizations_setup.dart';
import 'package:theming_app_templete/settings_state.dart';

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
          final cubit = context.read<SettingsCubit>();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: _getThemeMode(state.themeMode),
            locale: cubit.getLocaleFromState(state.locale),
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
}
