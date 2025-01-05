import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/color_extension.dart';
import 'package:theming_app_templete/core/themes/colors_dark.dart';
import 'package:theming_app_templete/core/themes/colors_light.dart';

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = _createTheme(
    colorScheme: const ColorScheme(
      primary: ColorsLight.primaryColor,
      secondary: ColorsLight.accentColor,
      surface: ColorsLight.backgroundColor,
      error: ColorsLight.errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: ColorsLight.textColor,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    extensions: <ThemeExtension<dynamic>>[MyColors.light],
  );

  // Dark Theme
  static final ThemeData darkTheme = _createTheme(
    colorScheme: const ColorScheme(
      primary: ColorsDark.primaryColor,
      secondary: ColorsDark.accentColor,
      surface: ColorsDark.backgroundColor,
      error: ColorsDark.errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: ColorsDark.textColor,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    extensions: <ThemeExtension<dynamic>>[MyColors.dark],
  );

  // Base Theme Creator
  static ThemeData _createTheme({
    required ColorScheme colorScheme,
    required List<ThemeExtension<dynamic>>? extensions,
  }) {
    return ThemeData(
      extensions: extensions,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
