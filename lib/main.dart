import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_wien_zuhayr_test/shared/debug/navigation_observer.dart';
import 'package:uni_wien_zuhayr_test/features/onboarding/onboarding.dart';
import 'package:uni_wien_zuhayr_test/features/splash/presentation/screens/splash_screen.dart';
import 'package:uni_wien_zuhayr_test/routes.dart';
import 'package:uni_wien_zuhayr_test/shared/providers/shared_providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const AquaApp(),
    ),
  );
}

class AquaApp extends ConsumerWidget {
  const AquaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(prefsProvider.select((p) => p.languageCode));
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));
    return CustomPaint(
      painter: PreloadBackgroundPainter(),
      child: ScreenUtilInit(
        designSize: const Size(641, 1007),
        builder: (context, _) => MaterialApp(
          navigatorObservers: [AppNavigationObserver()],
          theme: ref.watch(lightThemeProvider(context)),
          darkTheme: ref.watch(darkThemeProvider(context)),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          locale: Locale.fromSubtags(languageCode: languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) => "Demo Application",
          onGenerateRoute: (settings) {
            final route = Routes.pages[settings.name];

            if (route == null) {
              assert(false, 'Need to implement ${settings.name}');
              return null;
            }

            return route(settings);
          },
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context),
            child: child!,
          ),
        ),
      ),
    );
  }
}
