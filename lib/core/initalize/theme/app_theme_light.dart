import 'package:flutter/material.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';

mixin AppThemeLight implements ThemeData {
  static ThemeData theme = ThemeData(
    //add sizes
    primaryColor: UIColors.PRIMARY_COLOR,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: UIColors.PRIMARY_COLOR,
      elevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColorLight: const Color(0xFFe7f3f3),
  );
}
