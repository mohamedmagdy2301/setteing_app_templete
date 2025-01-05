import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theming_app_templete/core/utils/key_constant.dart';
import 'package:theming_app_templete/cubit/settings_state.dart';

enum ThemeModeState { light, dark, system }

enum LocalizationState { ar, en, system }

enum ColorsPalleteState { orange, blue, green, red, indigo, purple }

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          themeMode: ThemeModeState.system,
          locale: LocalizationState.system,
          colors: ColorsPalleteState.orange,
        )) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(keyTheme) ?? 'system';
    final locale = prefs.getString(keyLocale) ?? 'system';
    final colors = prefs.getString(keyColors) ?? 'orange';

    emit(SettingsState(
      themeMode: _getThemeStateFromString(theme),
      locale: _getLocaleStateFromString(locale),
      colors: _getColorsStateFromString(colors),
    ));
  }

  Future<void> setColors(ColorsPalleteState colors) async {
    await _setPreference(keyColors, _getColorsStateToString(colors));
    emit(SettingsState(
      themeMode: state.themeMode,
      locale: state.locale,
      colors: colors,
    ));
  }

  ColorsPalleteState _getColorsStateFromString(String colors) {
    switch (colors) {
      case 'blue':
        return ColorsPalleteState.blue;
      case 'red':
        return ColorsPalleteState.red;
      case 'green':
        return ColorsPalleteState.green;
      case 'indigo':
        return ColorsPalleteState.indigo;
      case 'orange':
        return ColorsPalleteState.orange;
      case 'purple':
        return ColorsPalleteState.purple;
      default:
        return ColorsPalleteState.orange;
    }
  }

  String _getColorsStateToString(ColorsPalleteState state) {
    return state.toString().split('.').last;
  }

  Future<void> setTheme(ThemeModeState themeMode) async {
    await _setPreference(keyTheme, _getThemeStateToString(themeMode));
    emit(SettingsState(
      themeMode: themeMode,
      locale: state.locale,
      colors: state.colors,
    ));
  }

  Future<void> setLocale(LocalizationState locale) async {
    await _setPreference(keyLocale, _getLocaleStateToString(locale));
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
    return state.toString().split('.').last;
  }

  LocalizationState _getLocaleStateFromString(String locale) {
    switch (locale) {
      case 'ar':
        return LocalizationState.ar;
      case 'en':
        return LocalizationState.en;
      default:
        return LocalizationState.system;
    }
  }

  String _getLocaleStateToString(LocalizationState state) {
    return state.toString().split('.').last;
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

  Locale getLocaleFromState(LocalizationState state) {
    switch (state) {
      case LocalizationState.ar:
        return const Locale('ar');
      case LocalizationState.en:
        return const Locale('en');
      case LocalizationState.system:
        return _getSystemLocale();
    }
  }
}
