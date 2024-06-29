import 'package:go_router/go_router.dart';
import 'package:uni_wien_zuhayr_test/features/home/pages/pages.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      context.pushReplacement(HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: SizedBox.expand(
        child: Text(
          context.loc.welcomeTextSplashScreen,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
