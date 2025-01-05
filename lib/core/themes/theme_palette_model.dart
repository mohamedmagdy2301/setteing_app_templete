import 'package:flutter/material.dart';

class ThemePaletteModel {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color text;
  final Color error;

  const ThemePaletteModel({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.text,
    required this.error,
  });
}

List<Color> colorPalette = [
  Colors.amber,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.indigo,
  Colors.purple, // Add your new color
];
