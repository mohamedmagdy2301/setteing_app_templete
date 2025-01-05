import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeState { light, dark, system }

enum LocaleState { ar, en, system }

class SettingsState {
  final ThemeModeState themeMode;
  final LocaleState locale;

  SettingsState({
    required this.themeMode,
    required this.locale,
  });
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          themeMode: ThemeModeState.system,
          locale: LocaleState.system,
        )) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'system';
    final locale = prefs.getString('locale') ?? 'system';

    emit(SettingsState(
      themeMode: _getThemeStateFromString(theme),
      locale: _getLocaleStateFromString(locale),
    ));
  }

  Future<void> setTheme(ThemeModeState themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', _getThemeStateToString(themeMode));
    emit(SettingsState(
      themeMode: themeMode,
      locale: state.locale,
    ));
  }

  Future<void> setLocale(LocaleState locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', _getLocaleStateToString(locale));
    emit(SettingsState(
      themeMode: state.themeMode,
      locale: locale,
    ));
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
}
