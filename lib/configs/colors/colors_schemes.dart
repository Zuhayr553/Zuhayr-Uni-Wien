import "colors.dart";

//ANCHOR - Theme Colors

abstract class ApplicationColors {
  Color get navigationPaneBackgroundColor;
  Color get toggleButtonColor;
  Color get shadowColor;
  Brightness get brightness;
  ColorScheme get colorScheme;
}

//ANCHOR - Dark Colors

class DarkThemeColors implements ApplicationColors {
  @override
  Color get navigationPaneBackgroundColor => AppColors.shinyBlack;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get toggleButtonColor => AppColors.platinum;

  @override
  Color get shadowColor => AppColors.darkGray;

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

//ANCHOR - Light Colors

class LightThemeColors implements ApplicationColors {
  @override
  Color get navigationPaneBackgroundColor => Colors.white;

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get toggleButtonColor => AppColors.shinyBlack;

  @override
  Color get shadowColor => AppColors.lightGray;

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
