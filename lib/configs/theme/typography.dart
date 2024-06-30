import 'theme.dart';

class AppTypography {
  AppTypography._(
    this.context, {
    required this.colors,
    required this.isDark,
  });

  factory AppTypography.createDark(
      BuildContext context, ApplicationColors colors) {
    return AppTypography._(context, colors: colors, isDark: true);
  }

  factory AppTypography.createLight(
      BuildContext context, ApplicationColors colors) {
    return AppTypography._(context, colors: colors, isDark: false);
  }

  final BuildContext context;
  final ApplicationColors colors;
  final bool isDark;

  Typography get appTextTheme => Typography.fromBrightness(
        brightness: isDark ? Brightness.dark : Brightness.light,
        color: isDark ? Colors.white : Colors.black,
      );
}
