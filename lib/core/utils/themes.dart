import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

class AppThemes{
  static final lightTheme = ThemeData(
    fontFamily: "GeneralSans",
    brightness: Brightness.light,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
    )
  );
}