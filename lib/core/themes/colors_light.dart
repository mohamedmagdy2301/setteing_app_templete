import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/theme_palette_model.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

const lightPalettes = {
  ColorsPalleteState.orange: ThemePaletteModel(
    primary: Colors.orange,
    secondary: Colors.orangeAccent,
    background: Color(0xFFECECEC),
    text: Color(0xFF2D2D2D),
    error: Color(0xFFE53935),
  ),
  ColorsPalleteState.blue: ThemePaletteModel(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    background: Color(0xFFECECEC),
    text: Color(0xFF2D2D2D),
    error: Color(0xFFE53935),
  ),
  ColorsPalleteState.green: ThemePaletteModel(
    primary: Colors.green,
    secondary: Colors.greenAccent,
    background: Color(0xFFECECEC),
    text: Color(0xFF2D2D2D),
    error: Color(0xFFE53935),
  ),
  ColorsPalleteState.red: ThemePaletteModel(
    primary: Colors.red,
    secondary: Colors.redAccent,
    background: Color(0xFFECECEC),
    text: Color(0xFF2D2D2D),
    error: Color(0xFFE53935),
  ),
  ColorsPalleteState.indigo: ThemePaletteModel(
    primary: Colors.indigo,
    secondary: Colors.indigoAccent,
    background: Color(0xFFECECEC),
    text: Color(0xFF2D2D2D),
    error: Color(0xFFE53935),
  ),
};
