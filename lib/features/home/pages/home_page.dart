import 'pages.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref
        .watch(languageProvider(context).select((p) => p.supportedLanguages));
    final currentLang =
        ref.watch(languageProvider(context).select((p) => p.currentLanguage));
    final selectedIndex = ref.watch(selectedIndexProvider.notifier);

    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: PageStorage(
        bucket: PageStorageBucket(),
        child: NavigationView(
          clipBehavior: Clip.hardEdge,
          pane: NavigationPane(
            onChanged: (index) {
              selectedIndex.setSelectedIndex(index);
            },
            selected: ref.watch(selectedIndexProvider),
            size: NavigationPaneSize(openWidth: 100.w),
            header: const SizedBox(
              height: 20,
            ),
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.home),
                body: const HomeBody(),
                title: Text(context.loc.homeTextHomePage),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.task_group),
                title: Text(context.loc.taskManagerTextHomePage),
                body: const TasksBody(),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: Text(context.loc.settingsTextHomePage),
                body: const SettingsBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
