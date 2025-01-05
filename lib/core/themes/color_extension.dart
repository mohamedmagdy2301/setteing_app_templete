import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/colors_dark.dart';
import 'package:theming_app_templete/core/themes/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.primaryColor,
  });

  final Color? primaryColor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? primaryColor,
  }) {
    return MyColors(
      primaryColor: primaryColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      primaryColor: primaryColor,
    );
  }

  static MyColors dark = MyColors(
    primaryColor: ColorsDark.primaryColor,
  );

  static MyColors light = MyColors(
    primaryColor: ColorsLight.primaryColor,
  );
}
