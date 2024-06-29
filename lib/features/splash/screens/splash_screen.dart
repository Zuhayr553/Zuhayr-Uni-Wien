import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_wien_zuhayr_test/features/home/pages/pages.dart';

class SplashScreen extends HookConsumerWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
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
            Text(
              context.loc.welcomeTextSplashScreen,
              textAlign: TextAlign.center,
              style: FluentTheme.of(context).typography.bodyLarge,
            )
                .animate(controller: animationController)
                .fadeIn(duration: const Duration(seconds: 1))
                .slide(duration: const Duration(seconds: 1)),
          ],
        ),
      ),
    );
  }
}
