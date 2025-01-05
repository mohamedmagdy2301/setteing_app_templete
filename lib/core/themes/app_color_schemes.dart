import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/color_extension.dart';
import 'package:theming_app_templete/core/themes/colors_dark.dart';
import 'package:theming_app_templete/core/themes/colors_light.dart';
import 'package:theming_app_templete/features/cubit/settings_cubit.dart';

class AppColorSchemes {
  static ColorScheme getColorScheme(
      ColorsState color, ThemeModeState themeMode) {
    switch (color) {
      case ColorsState.orange:
        return themeMode == ThemeModeState.light
            ? _buildColorScheme(
                primary: ColorsLight.primaryColor,
                secondary: ColorsLight.accentColor,
                surface: ColorsLight.backgroundColor,
                error: ColorsLight.errorColor,
                textColor: ColorsLight.textColor,
                brightness: Brightness.light,
              )
            : _buildColorScheme(
                primary: ColorsDark.primaryColor,
                secondary: ColorsDark.accentColor,
                surface: ColorsDark.backgroundColor,
                error: ColorsDark.errorColor,
                textColor: ColorsDark.textColor,
                brightness: Brightness.dark,
              );

      case ColorsState.blue:
        return themeMode == ThemeModeState.light
            ? _buildColorScheme(
                primary: ColorsLightBlue.primaryColor,
                secondary: ColorsLightBlue.accentColor,
                surface: ColorsLightBlue.backgroundColor,
                error: ColorsLightBlue.errorColor,
                textColor: ColorsLightBlue.textColor,
                brightness: Brightness.light,
              )
            : _buildColorScheme(
                primary: ColorsDarkBlue.primaryColor,
                secondary: ColorsDarkBlue.accentColor,
                surface: ColorsDarkBlue.backgroundColor,
                error: ColorsDarkBlue.errorColor,
                textColor: ColorsDarkBlue.textColor,
                brightness: Brightness.dark,
              );
      case ColorsState.green:
        return themeMode == ThemeModeState.light
            ? _buildColorScheme(
                primary: ColorsLightGreen.primaryColor,
                secondary: ColorsLightGreen.accentColor,
                surface: ColorsLightGreen.backgroundColor,
                error: ColorsLightGreen.errorColor,
                textColor: ColorsLightGreen.textColor,
                brightness: Brightness.light,
              )
            : _buildColorScheme(
                primary: ColorsDarkGreen.primaryColor,
                secondary: ColorsDarkGreen.accentColor,
                surface: ColorsDarkGreen.backgroundColor,
                error: ColorsDarkGreen.errorColor,
                textColor: ColorsDarkGreen.textColor,
                brightness: Brightness.dark,
              );
      case ColorsState.red:
        return themeMode == ThemeModeState.light
            ? _buildColorScheme(
                primary: ColorsLightRed.primaryColor,
                secondary: ColorsLightRed.accentColor,
                surface: ColorsLightRed.backgroundColor,
                error: ColorsLightRed.errorColor,
                textColor: ColorsLightRed.textColor,
                brightness: Brightness.light,
              )
            : _buildColorScheme(
                primary: ColorsDarkRed.primaryColor,
                secondary: ColorsDarkRed.accentColor,
                surface: ColorsDarkRed.backgroundColor,
                error: ColorsDarkRed.errorColor,
                textColor: ColorsDarkRed.textColor,
                brightness: Brightness.dark,
              );
    }
  }

  static ThemeExtension<MyColors> getExtension(
      {required ColorsState color, required ThemeModeState themeMode}) {
    if (themeMode == ThemeModeState.dark) {
      switch (color) {
        case ColorsState.blue:
          return MyColors.darkBlue;
        case ColorsState.green:
          return MyColors.darkGreen;
        case ColorsState.red:
          return MyColors.darkRed;
        case ColorsState.orange:
          return MyColors.dark;
      }
    }
    switch (color) {
      case ColorsState.blue:
        return MyColors.lightBlue;
      case ColorsState.green:
        return MyColors.lightGreen;
      case ColorsState.red:
        return MyColors.lightRed;
      case ColorsState.orange:
        return MyColors.light;
    }
  }

  static ColorScheme _buildColorScheme({
    required Color primary,
    required Color secondary,
    required Color surface,
    required Color error,
    required Color textColor,
    required Brightness brightness,
  }) {
    return ColorScheme(
      primary: primary,
      secondary: secondary,
      surface: surface,
      error: error,
      onPrimary: Colors.white,
      onSecondary: brightness == Brightness.light ? Colors.black : Colors.white,
      onSurface: textColor,
      onError: Colors.white,
      brightness: brightness,
    );
  }
}
