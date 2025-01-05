import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/core/language/app_localizations.dart';
import 'package:theming_app_templete/core/language/lang_keys.dart';
import 'package:theming_app_templete/features/settings/presentation/cubit/settings_state.dart';
import 'package:theming_app_templete/features/settings/presentation/widgets/localize_widget.dart';
import 'package:theming_app_templete/features/settings/presentation/widgets/theme_widget.dart';

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
              ThemeWidget(cubit: cubit, state: state),
              const Divider(),
              LocalizeWidget(cubit: cubit, state: state),
              // const
            ],
          );
        },
      ),
    );
  }
}
