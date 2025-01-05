import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/list_colors.dart';
import 'package:theming_app_templete/core/widgets/build_cricle_color_widget.dart';

class ColorPaletteWidget extends StatelessWidget {
  const ColorPaletteWidget({super.key});

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
