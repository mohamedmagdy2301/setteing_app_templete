import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_cubit.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeState>(
      builder: (context, themeState) {
        return Scaffold(
          appBar: AppBar(title: Text('Theme Selector')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOption(
                context,
                ThemeModeState.light,
                'Light',
                themeState,
              ),
              _buildOption(
                context,
                ThemeModeState.dark,
                'Dark',
                themeState,
              ),
              _buildOption(
                context,
                ThemeModeState.system,
                'System',
                themeState,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(BuildContext context, ThemeModeState mode, String label,
      ThemeModeState current) {
    return ListTile(
      leading: Radio<ThemeModeState>(
        value: mode,
        groupValue: current,
        onChanged: (value) {
          context.read<ThemeCubit>().changeTheme(value!);
        },
      ),
      title: Text(label),
    );
  }
}
