import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/list_colors.dart';
import 'package:theming_app_templete/core/widgets/build_cricle_color_widget.dart';
import 'package:theming_app_templete/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:theming_app_templete/features/settings/presentation/cubit/settings_state.dart';

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
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return BuildCircleColorWidget(
            color: color[index],
            isSelected: state.colors == ColorsState.values[index],
            onTap: () {
              cubit.setColors(ColorsState.values[index]);
            },
          );
        },
      ),
    );
  }
}
