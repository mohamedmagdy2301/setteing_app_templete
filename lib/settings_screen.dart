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
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(appLocal.translate(LangKeys.theme)!,
                    style: TextStyle(fontSize: 18)),
              ),
              RadioListTile<ThemeModeState>(
                title: Text(
                  appLocal.translate(LangKeys.light)!,
                ),
                value: ThemeModeState.light,
                groupValue: state.themeMode,
                onChanged: (value) => cubit.setTheme(value!),
              ),
              RadioListTile<ThemeModeState>(
                title: Text(appLocal.translate(LangKeys.dark)!),
                value: ThemeModeState.dark,
                groupValue: state.themeMode,
                onChanged: (value) => cubit.setTheme(value!),
              ),
              RadioListTile<ThemeModeState>(
                title: Text(appLocal.translate(LangKeys.systemDefault)!),
                value: ThemeModeState.system,
                groupValue: state.themeMode,
                onChanged: (value) => cubit.setTheme(value!),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(appLocal.translate(LangKeys.language)!,
                    style: TextStyle(fontSize: 18)),
              ),
              RadioListTile<LocaleState>(
                title: Text(appLocal.translate(LangKeys.english)!),
                value: LocaleState.en,
                groupValue: state.locale,
                onChanged: (value) => cubit.setLocale(value!),
              ),
              RadioListTile<LocaleState>(
                title: Text(appLocal.translate(LangKeys.arabic)!),
                value: LocaleState.ar,
                groupValue: state.locale,
                onChanged: (value) => cubit.setLocale(value!),
              ),
              RadioListTile<LocaleState>(
                title: Text(appLocal.translate(LangKeys.systemDefault)!),
                value: LocaleState.system,
                groupValue: state.locale,
                onChanged: (value) => cubit.setLocale(value!),
              ),
            ],
          );
        },
      ),
    );
  }
}
