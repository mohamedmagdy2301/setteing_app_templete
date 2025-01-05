import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/theme_palette_model.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

const darkPalettes = {
  ColorsPalleteState.orange: ThemePaletteModel(
    primary: Colors.orange,
    secondary: Colors.orangeAccent,
    background: Color(0xFF121212),
    text: Color(0xFFBBDEFB),
    error: Color(0xFFEF5350),
  ),
  ColorsPalleteState.blue: ThemePaletteModel(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    background: Color(0xFF121212),
    text: Color(0xFFBBDEFB),
    error: Color(0xFFEF5350),
  ),
  ColorsPalleteState.green: ThemePaletteModel(
    primary: Colors.green,
    secondary: Colors.greenAccent,
    background: Color(0xFF121212),
    text: Color(0xFFC8E6C9),
    error: Color(0xFFEF5350),
  ),
  ColorsPalleteState.red: ThemePaletteModel(
    primary: Colors.red,
    secondary: Colors.redAccent,
    background: Color(0xFF121212),
    text: Color(0xFFFFCDD2),
    error: Color(0xFFEF5350),
  ),
  ColorsPalleteState.indigo: ThemePaletteModel(
    primary: Colors.indigo,
    secondary: Colors.indigoAccent,
    background: Color(0xFF121212),
    text: Color(0xFFFFCDD2),
    error: Color(0xFFEF5350),
  ),
};
