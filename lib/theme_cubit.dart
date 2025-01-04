import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeState { light, dark, system }

class ThemeCubit extends Cubit<ThemeModeState> {
  ThemeCubit() : super(ThemeModeState.system) {
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('themeMode') ?? 'system';
    emit(_getThemeModeState(theme));
  }

  void changeTheme(ThemeModeState theme) async {
    emit(theme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', _getThemeString(theme));
  }

  ThemeModeState _getThemeModeState(String theme) {
    switch (theme) {
      case 'light':
        return ThemeModeState.light;
      case 'dark':
        return ThemeModeState.dark;
      default:
        return ThemeModeState.system;
    }
  }

  String _getThemeString(ThemeModeState theme) {
    switch (theme) {
      case ThemeModeState.light:
        return 'light';
      case ThemeModeState.dark:
        return 'dark';
      case ThemeModeState.system:
        return 'system';
    }
  }
}
