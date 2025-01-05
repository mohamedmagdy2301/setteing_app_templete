import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/theme_palette_model.dart';
import 'package:theming_app_templete/core/widgets/build_cricle_color_widget.dart';

class ColorPaletteWidget extends StatelessWidget {
  const ColorPaletteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        colorPalette.length,
        (index) => BuildCircleColorWidget(index: index),
      ),
    );
  }
}
