import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/colors_dark.dart';
import 'package:theming_app_templete/core/themes/colors_light.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

class AppColorSchemes {
  static ColorScheme generateColorScheme(
      {required ColorsPalleteState palette,
      required ThemeModeState themeMode}) {
    final paletteData = themeMode == ThemeModeState.light
        ? lightPalettes[palette]
        : darkPalettes[palette];

    return ColorScheme(
      primary: paletteData!.primary,
      secondary: paletteData.secondary,
      surface: paletteData.background,
      error: paletteData.error,
      onPrimary: Colors.white,
      onSecondary:
          themeMode == ThemeModeState.light ? Colors.black : Colors.white,
      onSurface: paletteData.text,
      onError: Colors.white,
      brightness: themeMode == ThemeModeState.light
          ? Brightness.light
          : Brightness.dark,
    );
  }
}
