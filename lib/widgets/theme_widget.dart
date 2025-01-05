import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/language/lang_keys.dart';
import 'package:theming_app_templete/core/widgets/build_radio_listtile.dart';
import 'package:theming_app_templete/core/widgets/build_section_title.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';
import 'package:theming_app_templete/cubit/settings_state.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key, required this.cubit, required this.state});
  final SettingsCubit cubit;
  final SettingsState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildSectionTitle(title: LangKeys.theme),
        BuildRadioListTile<ThemeModeState>(
          labelKey: LangKeys.light,
          value: ThemeModeState.light,
          groupValue: state.themeMode,
          onChanged: (theme) => cubit.setTheme(theme!),
        ),
        BuildRadioListTile<ThemeModeState>(
          labelKey: LangKeys.dark,
          value: ThemeModeState.dark,
          groupValue: state.themeMode,
          onChanged: (theme) => cubit.setTheme(theme!),
        ),
        BuildRadioListTile<ThemeModeState>(
          labelKey: LangKeys.systemDefault,
          value: ThemeModeState.system,
          groupValue: state.themeMode,
          onChanged: (theme) => cubit.setTheme(theme!),
        ),
      ],
    );
  }
}
