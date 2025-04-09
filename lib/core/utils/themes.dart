import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: "GeneralSans",
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.white,
      onPrimary: AppColors.white,
      secondary: AppColors.greyMain,
      onSecondary: AppColors.blackMain,
      error: Color(0xFFED1010),
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.blackMain,
    ),
  );
}
