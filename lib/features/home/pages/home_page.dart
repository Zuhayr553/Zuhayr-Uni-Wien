import 'package:fluent_ui/fluent_ui.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";
import 'package:uni_wien_zuhayr_test/features/language/language.dart';
import 'package:uni_wien_zuhayr_test/shared/extensions/context_extensions.dart';

class HomePage extends ConsumerWidget {
  static const routeName = 'homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref
        .watch(languageProvider(context).select((p) => p.supportedLanguages));
    final currentLang =
        ref.watch(languageProvider(context).select((p) => p.currentLanguage));

    return ScaffoldPage(
      content: PageStorage(
        bucket: PageStorageBucket(),
        child: NavigationView(
          pane: NavigationPane(
            onChanged: (index) {},
            header: Text(
              context.loc.welcomeTextSplashScreen,
            ),
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.home),
                body: const Text('Home'),
                title: const Text('Home'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: const Text('Settings'),
                body: const Text('Settings'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.info),
                title: const Text('About'),
                body: const Text('About'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
