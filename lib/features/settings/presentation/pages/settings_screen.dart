import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/core/language/app_localizations.dart';
import 'package:theming_app_templete/core/language/lang_keys.dart';
import 'package:theming_app_templete/features/settings/presentation/cubit/settings_state.dart';
import 'package:theming_app_templete/features/settings/presentation/widgets/build_radio_listtile.dart';
import 'package:theming_app_templete/features/settings/presentation/widgets/build_section_title.dart';

import '../cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocal.translate(LangKeys.settings)!),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          cubit.loadSettings();
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
              const Divider(),
              BuildSectionTitle(title: LangKeys.language),
              BuildRadioListTile<LocaleState>(
                labelKey: LangKeys.english,
                value: LocaleState.en,
                groupValue: state.locale,
                onChanged: (locale) => cubit.setLocale(locale!),
              ),
              BuildRadioListTile<LocaleState>(
                labelKey: LangKeys.arabic,
                value: LocaleState.ar,
                groupValue: state.locale,
                onChanged: (locale) => cubit.setLocale(locale!),
              ),
              BuildRadioListTile<LocaleState>(
                labelKey: LangKeys.systemDefault,
                value: LocaleState.system,
                groupValue: state.locale,
                onChanged: (locale) => cubit.setLocale(locale!),
              ),
            ],
          );
        },
      ),
    );
  }
}
