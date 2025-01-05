import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_app_templete/core/language/app_localizations.dart';
import 'package:theming_app_templete/core/language/lang_keys.dart';
import 'package:theming_app_templete/features/widgets/colors_widget.dart';
import 'package:theming_app_templete/features/widgets/localize_widget.dart';
import 'package:theming_app_templete/features/widgets/theme_widget.dart';

import '../cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    final state = context.watch<SettingsCubit>().state;
    final appLocal = AppLocalizations.of(context)!;
    cubit.loadSettings();
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocal.translate(LangKeys.settings)!),
      ),
      body: ListView(
        children: [
          ThemeWidget(cubit: cubit, state: state),
          const Divider(),
          LocalizeWidget(cubit: cubit, state: state),
          const Divider(),
          SizedBox(height: 20),
          ColorPaletteWidget(cubit: cubit, state: state),
        ],
      ),
    );
  }
}
