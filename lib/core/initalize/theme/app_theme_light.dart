import 'package:flutter/material.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';

mixin AppThemeLight implements ThemeData {
  static ThemeData theme = ThemeData(
    //add sizes
    primaryColor: UIColors.PRIMARY_COLOR,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
