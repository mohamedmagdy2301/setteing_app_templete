import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/app_color_schemes.dart';
import 'package:theming_app_templete/core/themes/color_extension.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

class AppTheme {
  static ThemeData getTheme(
      ColorsPalleteState palette, ThemeModeState themeMode) {
    final colorScheme = AppColorSchemes.generateColorScheme(
        palette: palette, themeMode: themeMode);
    final extension = themeExtensions[themeMode]![palette];

    return ThemeData(
      colorScheme: colorScheme,
      extensions: [extension!],
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
