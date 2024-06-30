import 'package:fluent_ui/fluent_ui.dart';
import '../../configs/theme/app_styles.dart';
import '../../shared/providers/shared_providers.dart';

final darkThemeProvider =
    Provider.autoDispose.family<FluentThemeData, BuildContext>((ref, context) {
  return AppStyle.createDarkThemeData(context);
});

final lightThemeProvider =
    Provider.autoDispose.family<FluentThemeData, BuildContext>((ref, context) {
  return AppStyle.createLightThemeData(context);
});
