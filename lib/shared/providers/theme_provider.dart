import 'package:uni_wien_zuhayr_test/configs/theme/app_styles.dart';
import 'package:uni_wien_zuhayr_test/shared/providers/shared_providers.dart';

final darkThemeProvider =
    Provider.autoDispose.family<ThemeData, BuildContext>((ref, context) {
  return AppStyle.createDarkThemeData(context);
});

final lightThemeProvider =
    Provider.autoDispose.family<ThemeData, BuildContext>((ref, context) {
  return AppStyle.createLightThemeData(context);
});
