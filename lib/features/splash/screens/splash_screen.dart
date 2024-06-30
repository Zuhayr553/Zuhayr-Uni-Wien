import '../../home/home.dart';
import 'screen.dart';

class SplashScreen extends HookConsumerWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));

    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..forward();

    useEffect(() {
      Future.delayed(const Duration(seconds: 4), () async {
        context.pushReplacement(HomePage.routeName);
      });
      return;
    }, []);

    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: Icon(
                  FluentIcons.crown,
                  color: darkMode ? AppColors.platinum : AppColors.shinyBlack,
                  size: 40,
                ),
              ),
            ),
            Text(
              context.loc.welcomeTextSplashScreen,
              textAlign: TextAlign.center,
              style: FluentTheme.of(context).typography.bodyLarge,
            )
                .animate(controller: animationController)
                .fadeIn(duration: const Duration(seconds: 1))
                .slide(duration: const Duration(seconds: 2)),
          ],
        ),
      ),
    );
  }
}
