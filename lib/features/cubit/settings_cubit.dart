import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theming_app_templete/features/cubit/settings_state.dart';

enum ThemeModeState { light, dark, system }

enum LocaleState { ar, en, system }

enum ColorsState { orange, blue, green, red }

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          themeMode: ThemeModeState.system,
          locale: LocaleState.system,
          colors: ColorsState.blue,
        )) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'system';
    final locale = prefs.getString('locale') ?? 'system';
    final colors = prefs.getString('colors') ?? 'orange';

    emit(SettingsState(
      themeMode: _getThemeStateFromString(theme),
      locale: _getLocaleStateFromString(locale),
      colors: _getColorsStateFromString(colors),
    ));
  }

  Future<void> setColors(ColorsState colors) async {
    await _setPreference('colors', _getColorsStateToString(colors));
    emit(SettingsState(
      themeMode: state.themeMode,
      locale: state.locale,
      colors: colors,
    ));
  }

  ColorsState _getColorsStateFromString(String colors) {
    switch (colors) {
      case 'blue':
        return ColorsState.blue;
      case 'red':
        return ColorsState.red;
      case 'green':
        return ColorsState.green;
      default:
        return ColorsState.orange;
    }
  }

  String _getColorsStateToString(ColorsState state) {
    return state.toString().split('.').last;
  }

  Future<void> setTheme(ThemeModeState themeMode) async {
    await _setPreference('theme', _getThemeStateToString(themeMode));
    emit(SettingsState(
      themeMode: themeMode,
      locale: state.locale,
      colors: state.colors,
    ));
  }

  Future<void> setLocale(LocaleState locale) async {
    await _setPreference('locale', _getLocaleStateToString(locale));
    emit(SettingsState(
      themeMode: state.themeMode,
      locale: locale,
      colors: state.colors,
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
      default:
        return ThemeModeState.system;
    }
  }

  String _getThemeStateToString(ThemeModeState state) {
    return state.toString().split('.').last; // Simplified string conversion
  }

  LocaleState _getLocaleStateFromString(String locale) {
    switch (locale) {
      case 'ar':
        return LocaleState.ar;
      case 'en':
        return LocaleState.en;
      default:
        return LocaleState.system;
    }
  }

  String _getLocaleStateToString(LocaleState state) {
    return state.toString().split('.').last; // Simplified string conversion
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
