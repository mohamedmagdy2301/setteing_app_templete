import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/color_extension.dart';
import 'package:theming_app_templete/core/themes/colors_dark.dart';
import 'package:theming_app_templete/core/themes/colors_light.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

class AppColorSchemes {
  static ColorScheme getColorScheme(
      ColorsPalleteState color, ThemeModeState themeMode) {
    switch (color) {
      case ColorsPalleteState.orange:
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

      case ColorsPalleteState.blue:
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
      case ColorsPalleteState.green:
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
      case ColorsPalleteState.red:
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
      {required ColorsPalleteState color, required ThemeModeState themeMode}) {
    if (themeMode == ThemeModeState.dark) {
      switch (color) {
        case ColorsPalleteState.blue:
          return MyColors.darkBlue;
        case ColorsPalleteState.green:
          return MyColors.darkGreen;
        case ColorsPalleteState.red:
          return MyColors.darkRed;
        case ColorsPalleteState.orange:
          return MyColors.dark;
      }
    }
    switch (color) {
      case ColorsPalleteState.blue:
        return MyColors.lightBlue;
      case ColorsPalleteState.green:
        return MyColors.lightGreen;
      case ColorsPalleteState.red:
        return MyColors.lightRed;
      case ColorsPalleteState.orange:
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
