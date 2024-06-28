import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_wien_zuhayr_test/configs/colors/colors_schemes.dart';
import 'package:uni_wien_zuhayr_test/configs/theme/theme.dart';

class AppStyle {
  const AppStyle._();

  static final lightColors = LightThemeColors();
  static final darkColors = DarkThemeColors();

  static const backgroundGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [
      Colors.black,
      Colors.white,
    ],
  );

  static FluentThemeData createLightThemeData(BuildContext context) {
    final typography = AppTypography.createLight(context, lightColors);
    return _create(lightColors, typography);
  }

  static FluentThemeData createDarkThemeData(BuildContext context) {
    final typography = AppTypography.createDark(context, darkColors);
    return _create(darkColors, typography);
  }

  static FluentThemeData _create(
      ApplicationColors colors, AppTypography typography) {
    return FluentThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: colors.colorScheme.surface,
      typography: typography.appTextTheme,
    );
  }
}
