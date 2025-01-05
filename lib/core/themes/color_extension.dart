import 'package:flutter/material.dart';
import 'package:theming_app_templete/cubit/settings_cubit.dart';

class MyColors extends ThemeExtension<MyColors> {
  final Color? primaryColor;

  const MyColors({required this.primaryColor});

  @override
  ThemeExtension<MyColors> copyWith({Color? primaryColor}) {
    return MyColors(
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
    );
  }
}

const themeExtensions = {
  ThemeModeState.light: {
    ColorsPalleteState.orange: MyColors(primaryColor: Colors.orange),
    ColorsPalleteState.blue: MyColors(primaryColor: Colors.blue),
    ColorsPalleteState.green: MyColors(primaryColor: Colors.green),
    ColorsPalleteState.red: MyColors(primaryColor: Colors.red),
    ColorsPalleteState.indigo: MyColors(primaryColor: Colors.indigo),
    ColorsPalleteState.purple: MyColors(primaryColor: Colors.purple),
  },
  ThemeModeState.dark: {
    ColorsPalleteState.orange: MyColors(primaryColor: Colors.orange),
    ColorsPalleteState.blue: MyColors(primaryColor: Colors.blue),
    ColorsPalleteState.green: MyColors(primaryColor: Colors.green),
    ColorsPalleteState.red: MyColors(primaryColor: Colors.red),
    ColorsPalleteState.indigo: MyColors(primaryColor: Colors.indigo),
    ColorsPalleteState.purple: MyColors(primaryColor: Colors.purple),
  },
};
