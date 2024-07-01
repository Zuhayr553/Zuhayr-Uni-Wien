import 'package:flutter/material.dart';
import 'pages.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider.notifier);
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));
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
            header: SizedBox(
              height: 100,
              child: Center(
                child: Icon(
                  FluentIcons.crown,
                  color: darkMode ? AppColors.platinum : AppColors.shinyBlack,
                  size: 40,
                ),
              ),
            ),
            items: [
              PaneItem(
                icon: const Icon(
                  FluentIcons.home,
                ),
                title: Text(
                  context.loc.homeTextHomePage,
                ),
                body: const HomeBody(),
              ),
              PaneItem(
                icon: const Icon(
                  FluentIcons.task_group,
                ),
                title: Text(
                  context.loc.taskManagerTextHomePage,
                ),
                body: const TasksBody(),
              ),
              PaneItem(
                icon: const Icon(
                  FluentIcons.settings,
                ),
                title: Text(
                  context.loc.settingsTextHomePage,
                ),
                body: const SettingsBody(),
              ),
            ],
            footerItems: [
              PaneItem(
                icon: GestureDetector(
                  onTap: () {
                    ref.read(prefsProvider).switchDarkMode();
                  },
                  child: Icon(
                    darkMode ? Icons.light_mode : Icons.dark_mode,
                    size: 30,
                  ),
                ),
                enabled: false,
                selectedTileColor: ButtonState.all(
                  const Color.fromRGBO(0, 0, 0, 0),
                ),
                tileColor: ButtonState.all(
                  const Color.fromRGBO(0, 0, 0, 0),
                ),
                body: const SizedBox.shrink(),
              ),
              PaneItemSeparator()
            ],
          ),
        ),
      ),
    );
  }
}
