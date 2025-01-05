import 'package:theming_app_templete/settings_cubit.dart';

class SettingsState {
  final ThemeModeState themeMode;
  final LocaleState locale;

  SettingsState({
    required this.themeMode,
    required this.locale,
  });
}
