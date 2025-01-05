import 'package:theming_app_templete/features/settings/presentation/cubit/settings_cubit.dart';

class SettingsState {
  final ThemeModeState themeMode;
  final LocaleState locale;
  final ColorsState colors;

  SettingsState({
    required this.themeMode,
    required this.locale,
    required this.colors,
  });
}
