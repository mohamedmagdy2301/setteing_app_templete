import 'package:theming_app_templete/cubit/settings_cubit.dart';

class SettingsState {
  final ThemeModeState themeMode;
  final LocaleState locale;
  final ColorsPalleteState colors;

  SettingsState({
    required this.themeMode,
    required this.locale,
    required this.colors,
  });
}
