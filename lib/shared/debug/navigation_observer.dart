import 'package:flutter/widgets.dart';
import 'package:uni_wien_zuhayr_test/logger.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    logger.d('[Navigation] Pushed route: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    logger.d('[Navigation] Popped route: ${route.settings.name}');
  }
}
