import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../configs/colors/app_colors.dart';
import '../configs/theme/app_styles.dart';
import 'routes.dart';
import '../shared/providers/shared_providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(prefsProvider.select((p) => p.languageCode));
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));
    return CustomPaint(
      painter: PreloadBackgroundPainter(),
      child: ScreenUtilInit(
        designSize: const Size(641, 1007),
        builder: (context, _) => FluentApp.router(
          theme: ref.watch(lightThemeProvider(context)),
          color: darkMode ? AppColors.richBlack : AppColors.ghostWhite,
          darkTheme: ref.watch(darkThemeProvider(context)),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          locale: Locale.fromSubtags(languageCode: languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) => "Demo Application",
          debugShowCheckedModeBanner: false,
          routerConfig: Routes.router,
        ),
      ),
    );
  }
}

class PreloadBackgroundPainter extends CustomPainter {
  PreloadBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var rect = Offset.zero & size;
    paint.shader = AppStyle.backgroundGradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
