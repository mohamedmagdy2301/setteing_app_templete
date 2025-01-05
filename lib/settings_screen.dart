import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/language/app_localizations.dart';
import 'package:theming_app_templete/language/lang_keys.dart';

import 'settings_cubit.dart';

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(appLocal, LangKeys.theme),
              _buildRadioListTile(
                context,
                state.themeMode,
                (theme) => cubit.setTheme(theme!),
                LangKeys.light,
                ThemeModeState.light,
              ),
              _buildRadioListTile(
                context,
                state.themeMode,
                (theme) => cubit.setTheme(theme!),
                LangKeys.dark,
                ThemeModeState.dark,
              ),
              _buildRadioListTile(
                context,
                state.themeMode,
                (theme) => cubit.setTheme(theme!),
                LangKeys.systemDefault,
                ThemeModeState.system,
              ),
              const Divider(),
              _buildSectionTitle(appLocal, LangKeys.language),
              _buildRadioListTile(
                context,
                state.locale,
                (locale) => cubit.setLocale(locale!),
                LangKeys.english,
                LocaleState.en,
              ),
              _buildRadioListTile(
                context,
                state.locale,
                (locale) => cubit.setLocale(locale!),
                LangKeys.arabic,
                LocaleState.ar,
              ),
              _buildRadioListTile(
                context,
                state.locale,
                (locale) => cubit.setLocale(locale!),
                LangKeys.systemDefault,
                LocaleState.system,
              ),
            ],
          );
        },
      ),
    );
  }

  Padding _buildSectionTitle(AppLocalizations appLocal, String key) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        appLocal.translate(key)!,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  RadioListTile<T> _buildRadioListTile<T>(
    BuildContext context,
    T groupValue,
    void Function(T?) onChanged,
    String labelKey,
    T value,
  ) {
    final appLocal = AppLocalizations.of(context)!;
    return RadioListTile<T>(
      title: Text(appLocal.translate(labelKey)!),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
