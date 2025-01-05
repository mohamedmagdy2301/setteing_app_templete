import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/list_colors.dart';
import 'package:theming_app_templete/core/widgets/build_cricle_color_widget.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';
import 'package:theming_app_templete/cubit/settings_state.dart';

class ColorPaletteWidget extends StatelessWidget {
  const ColorPaletteWidget({
    super.key,
    required this.cubit,
    required this.state,
  });

  final SettingsCubit cubit;
  final SettingsState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        color.length,
        (index) => BuildCircleColorWidget(index: index),
      ),
    );
  }
}
