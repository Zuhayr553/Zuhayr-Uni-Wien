import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_wien_zuhayr_test/features/home/pages/home_page.dart';
import 'package:uni_wien_zuhayr_test/features/splash/presentation/screens/splash_screen.dart';
import 'package:uni_wien_zuhayr_test/shared/debug/navigation_observer.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    observers: [AppNavigationObserver()],
    routes: [
      /// Splash
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: SplashScreen(),
        ),
        routes: [
          /// Home
          GoRoute(
            path: HomePage.routeName,
            name: 'home',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const HomePage(),
            ),
          ),
        ],
      ),
    ],
  );
}
