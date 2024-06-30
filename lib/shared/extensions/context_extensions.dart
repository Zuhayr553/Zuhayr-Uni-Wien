import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uni_wien_zuhayr_test/configs/colors/app_colors.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;

  CircularProgressIndicator circularProgressIndicator() {
    final isDarkMode = Theme.of(this).brightness == Brightness.dark;
    final color = isDarkMode ? AppColors.ghostWhite : AppColors.shinyBlack;
    return CircularProgressIndicator(color: color);
  }
}
