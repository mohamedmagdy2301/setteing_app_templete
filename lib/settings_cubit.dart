import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theming_app_templete/settings_state.dart';

enum ThemeModeState { light, dark, system }

enum LocaleState { ar, en, system }

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          themeMode: ThemeModeState.system,
          locale: LocaleState.system,
        )) {
    loadSettings();
    // _listenToLocaleChanges();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'system';
    final locale = prefs.getString('locale') ?? 'system';

    emit(SettingsState(
      themeMode: _getThemeStateFromString(theme),
      locale: _getLocaleStateFromString(locale),
    ));
  }

  // void _listenToLocaleChanges() {
  //   PlatformDispatcher.instance.onLocaleChanged = _handleLocaleChange;
  // }

  // void _handleLocaleChange() {
  //   final newLocale = _getSystemLocale();
  //   if (state.locale == LocaleState.system) {
  //     emit(SettingsState(
  //       themeMode: state.themeMode,
  //       locale: _getLocaleStateFromString(newLocale.languageCode),
  //     ));
  //   }
  // }

  Future<void> setTheme(ThemeModeState themeMode) async {
    await _setPreference('theme', _getThemeStateToString(themeMode));
    emit(SettingsState(
      themeMode: themeMode,
      locale: state.locale,
    ));
  }

  Future<void> setLocale(LocaleState locale) async {
    await _setPreference('locale', _getLocaleStateToString(locale));
    emit(SettingsState(
      themeMode: state.themeMode,
      locale: locale,
    ));
  }

  Future<void> _setPreference(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  ThemeModeState _getThemeStateFromString(String theme) {
    switch (theme) {
      case 'light':
        return ThemeModeState.light;
      case 'dark':
        return ThemeModeState.dark;
      case 'system':
      default:
        return ThemeModeState.system;
    }
  }

  String _getThemeStateToString(ThemeModeState state) {
    switch (state) {
      case ThemeModeState.light:
        return 'light';
      case ThemeModeState.dark:
        return 'dark';
      case ThemeModeState.system:
        return 'system';
    }
  }

  LocaleState _getLocaleStateFromString(String locale) {
    switch (locale) {
      case 'ar':
        return LocaleState.ar;
      case 'en':
        return LocaleState.en;
      case 'system':
      default:
        return LocaleState.system;
    }
  }

  String _getLocaleStateToString(LocaleState state) {
    switch (state) {
      case LocaleState.ar:
        return 'ar';
      case LocaleState.en:
        return 'en';
      case LocaleState.system:
        return 'system';
    }
  }

  Locale _getSystemLocale() {
    switch (Platform.localeName.split('_').first) {
      case 'ar':
        return const Locale('ar');
      case 'en':
        return const Locale('en');
      default:
        return const Locale('en');
    }
  }

  Locale getLocaleFromState(LocaleState state) {
    switch (state) {
      case LocaleState.ar:
        return const Locale('ar');
      case LocaleState.en:
        return const Locale('en');
      case LocaleState.system:
        return _getSystemLocale();
    }
  }
}
