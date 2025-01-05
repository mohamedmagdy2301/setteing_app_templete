import 'package:flutter/material.dart';
import 'package:theming_app_templete/features/cubit/settings_cubit.dart';

import 'app_color_schemes.dart';

class AppTheme {
  static ThemeData getTheme(ColorsState color, ThemeModeState themeMode) {
    final colorScheme = AppColorSchemes.getColorScheme(color, themeMode);
    final extension =
        AppColorSchemes.getExtension(color: color, themeMode: themeMode);
    return ThemeData(
      colorScheme: colorScheme,
      extensions: [extension],
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
