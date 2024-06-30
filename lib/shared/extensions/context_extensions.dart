import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../configs/colors/colors.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;

  CircularProgressIndicator circularProgressIndicator() {
    final isDarkMode = Theme.of(this).brightness == Brightness.dark;
    final color = isDarkMode ? AppColors.ghostWhite : AppColors.shinyBlack;
    return CircularProgressIndicator(color: color);
  }
}
