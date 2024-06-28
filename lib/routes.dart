import 'package:flutter/material.dart';
import 'package:uni_wien_zuhayr_test/features/splash/presentation/screens/splash_screen.dart';

mixin Routes {
  static final Map<String,
      MaterialPageRoute<Object> Function(RouteSettings settings)> pages = {
    SplashScreen.routeName: (settings) => MaterialPageRoute<Object>(
          builder: (context) => const SplashScreen(),
          settings: settings,
        ),
  };
}
