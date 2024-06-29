import 'package:flutter/material.dart';
import 'package:uni_wien_zuhayr_test/configs/colors/app_colors.dart';

//ANCHOR - Theme Colors

abstract class ApplicationColors {
  Color get navigationPaneBackgroundColor;
  Color get toggleButtonColor;
  ColorScheme get colorScheme;
}

class DarkThemeColors implements ApplicationColors {
  @override
  Color get navigationPaneBackgroundColor => AppColors.shinyBlack;

  @override
  Color get toggleButtonColor => AppColors.platinum;

  @override
  ColorScheme get colorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.deepSkyBlue,
        onPrimary: Colors.white,
        secondary: AppColors.darkSlateGray,
        onSecondary: Colors.white,
        secondaryContainer: AppColors.darkGray,
        onSecondaryContainer: Colors.white,
        primaryContainer: AppColors.richBlack,
        onPrimaryContainer: Colors.white,
        tertiary: AppColors.emeraldGreen,
        onTertiary: Colors.white,
        surface: AppColors.richBlack,
        onSurface: Colors.white,
        error: AppColors.flame,
        onError: Colors.white,
      );
}

class LightThemeColors implements ApplicationColors {
  @override
  Color get navigationPaneBackgroundColor => Colors.white;

  @override
  Color get toggleButtonColor => AppColors.shinyBlack;

  @override
  ColorScheme get colorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.deepSkyBlue,
        onPrimary: Colors.white,
        secondary: AppColors.platinum,
        onSecondary: AppColors.richBlack,
        secondaryContainer: AppColors.lightGray,
        onSecondaryContainer: AppColors.richBlack,
        primaryContainer: AppColors.ghostWhite,
        onPrimaryContainer: AppColors.richBlack,
        tertiary: AppColors.coral,
        onTertiary: Colors.white,
        surface: AppColors.ghostWhite,
        onSurface: AppColors.richBlack,
        error: AppColors.flame,
        onError: Colors.white,
      );
}
