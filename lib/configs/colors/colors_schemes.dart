import 'package:flutter/material.dart';
import 'package:uni_wien_zuhayr_test/configs/colors/app_colors.dart';

//ANCHOR - Theme Colors

abstract class ApplicationColors {
  ColorScheme get colorScheme;
}

class DarkThemeColors implements ApplicationColors {
  @override
  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.blueGreen,
        onPrimary: Colors.white,
        secondary: Colors.black,
        onSecondary: Colors.white,
        secondaryContainer: AppColors.lightSilver,
        onSecondaryContainer: Colors.white,
        tertiary: Colors.indigo.shade200,
        onTertiary: AppColors.eerieBlack,
        surface: Colors.black,
        onSurface: Colors.white,
        error: AppColors.portlandOrange,
        onError: Colors.white,
      );
}

class LightThemeColors implements ApplicationColors {
  @override
  ColorScheme get colorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.blueGreen,
        onPrimary: Colors.white,
        secondary: Colors.black,
        onSecondary: AppColors.eerieBlack,
        secondaryContainer: AppColors.lightSilver,
        onSecondaryContainer: Colors.white,
        primaryContainer: AppColors.antiFlashWhite,
        onPrimaryContainer: AppColors.eerieBlack,
        tertiary: Colors.brown,
        onTertiary: AppColors.eerieBlack,
        surface: Colors.white,
        onSurface: AppColors.cadetGrey,
        error: AppColors.portlandOrange,
        onError: Colors.white,
      );
}
