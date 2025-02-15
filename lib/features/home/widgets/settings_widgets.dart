import 'widgets.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));
    final currentLang =
        ref.watch(languageProvider(context).select((p) => p.currentLanguage));
    return ScaffoldPage(
      content: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          children: [
            headerBoldText(
              context,
              context.loc.settingsTextHomePage,
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: 300.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bodyText(
                    context,
                    context.loc.switchTextSettingsPage,
                    customFontSize: 14,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: ToggleButton(
                      checked: currentLang.languageCode ==
                          SupportedLanguageCodes.german.value,
                      onChanged: (val) {
                        ref.read(languageProvider(context)).setCurrentLanguage(
                              val
                                  ? Language(
                                      SupportedLanguageCodes.german.value,
                                    )
                                  : Language(
                                      SupportedLanguageCodes.english.value,
                                    ),
                            );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          currentLang.languageCode ==
                                  SupportedLanguageCodes.german.value
                              ? context.loc.germanTextSettingsPage
                              : context.loc.englishTextSettingsPage,
                          style:
                              FluentTheme.of(context).typography.body?.copyWith(
                                    color: darkMode
                                        ? AppColors.richBlack
                                        : AppColors.ghostWhite,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: 300.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bodyText(
                    context,
                    context.loc.darkModeTextSettingsPage,
                    customFontSize: 14,
                  ),
                  Container(
                    width: 50,
                    height: 28,
                    margin: EdgeInsets.only(right: 28.w),
                    child: ToggleSwitch(
                      checked: darkMode,
                      onChanged: (val) {
                        ref.read(prefsProvider).switchDarkMode();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
