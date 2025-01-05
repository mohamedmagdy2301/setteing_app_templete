import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/list_colors.dart';
import 'package:theming_app_templete/core/widgets/build_cricle_color_widget.dart';
import 'package:theming_app_templete/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:theming_app_templete/features/settings/presentation/cubit/settings_state.dart';

class ColorPaletteWidget extends StatefulWidget {
  const ColorPaletteWidget(
      {super.key, required this.cubit, required this.state});

  final SettingsCubit cubit;
  final SettingsState state;

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState();
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> {
  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 30),
        itemBuilder: (context, index) {
          return BuildCircleColorWidget(
            color: color[index],
            isSelected: currentSelectedIndex == index,
            onTap: () {
              setState(() {
                currentSelectedIndex = index;
              });
              switch (index) {
                case 0:
                  widget.cubit.setColors(ColorsState.orange);
                  break;
                case 1:
                  widget.cubit.setColors(ColorsState.blue);
                  break;
                case 2:
                  widget.cubit.setColors(ColorsState.green);
                  break;
                case 3:
                  widget.cubit.setColors(ColorsState.red);
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
