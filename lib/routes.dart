import 'package:flutter/material.dart';
import '../features/home/home.dart';
import 'features/splash/pages/splash_screen.dart';
import '../shared/debug/navigation_observer.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: SplashScreen.routeName,
    observers: [AppNavigationObserver()],
    routes: [
      /// ANCHOR: Splash
      GoRoute(
        path: SplashScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: SplashScreen(),
        ),
      ),

      /// ANCHOR: Home
      GoRoute(
        path: HomePage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          fullscreenDialog: true,
          child: const HomePage(),
        ),
      ),
    ],
  );
}
