import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/language/lang_keys.dart';
import 'package:theming_app_templete/core/widgets/build_radio_listtile.dart';
import 'package:theming_app_templete/core/widgets/build_section_title.dart';
import 'package:theming_app_templete/features/settings/presentation/cubit/settings_state.dart';

import '../cubit/settings_cubit.dart';

class LocalizeWidget extends StatelessWidget {
  const LocalizeWidget({super.key, required this.cubit, required this.state});
  final SettingsCubit cubit;
  final SettingsState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
  }
}
