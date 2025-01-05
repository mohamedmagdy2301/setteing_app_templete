import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/colors_dark.dart';
import 'package:theming_app_templete/core/themes/colors_light.dart';
import 'package:theming_app_templete/core/themes/theme_palette_model.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

class AppColorSchemes {
  static ColorScheme generateColorScheme(
      {required ColorsPalleteState palette,
      required ThemeModeState themeMode}) {
    final paletteData = getPaletteData(themeMode, palette)!;

    return ColorScheme(
      primary: paletteData.primary,
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

  static ThemePaletteModel? getPaletteData(
      ThemeModeState themeMode, ColorsPalleteState palette) {
    switch (themeMode) {
      case ThemeModeState.light:
        return lightPalettes[palette];
      case ThemeModeState.dark:
        return darkPalettes[palette];
      default:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkPalettes[palette]
            : lightPalettes[palette];
    }
  }
}
