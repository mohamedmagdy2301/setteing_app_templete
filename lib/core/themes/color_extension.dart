import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/themes/colors_dark.dart';
import 'package:theming_app_templete/core/themes/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  final Color? primaryColor;

  const MyColors({
    required this.primaryColor,
  });

  @override
  ThemeExtension<MyColors> copyWith({Color? primaryColor}) {
    return MyColors(
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
    );
  }

  // Light Theme Extensions
  static const MyColors light = MyColors(
    primaryColor: ColorsLight.primaryColor,
  );
  static const MyColors lightBlue = MyColors(
    primaryColor: ColorsLightBlue.primaryColor,
  );
  static const MyColors lightGreen = MyColors(
    primaryColor: ColorsLightGreen.primaryColor,
  );
  static const MyColors lightRed = MyColors(
    primaryColor: ColorsLightRed.primaryColor,
  );
  static const MyColors lightYellow = MyColors(
    primaryColor: ColorsLightIndigo.primaryColor,
  );

  // Dark Theme Extensions
  static const MyColors dark = MyColors(
    primaryColor: ColorsDark.primaryColor,
  );
  static const MyColors darkBlue = MyColors(
    primaryColor: ColorsDarkBlue.primaryColor,
  );
  static const MyColors darkGreen = MyColors(
    primaryColor: ColorsDarkGreen.primaryColor,
  );
  static const MyColors darkRed = MyColors(
    primaryColor: ColorsDarkRed.primaryColor,
  );
  static const MyColors darkYellow = MyColors(
    primaryColor: ColorsDarkIndigo.primaryColor,
  );
}
