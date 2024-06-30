import 'widgets.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(prefsProvider.select((p) => p.isDarkMode));
    final currentLang =
        ref.watch(languageProvider(context).select((p) => p.currentLanguage));
    return ScaffoldPage(
      padding: const EdgeInsets.all(24),
      content: Column(
        children: [
          headerBoldText(
            context,
            context.loc.settingsTextHomePage,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              ? Language(SupportedLanguageCodes.german.value)
                              : Language(SupportedLanguageCodes.english.value),
                        );
                  },
                  child: Text(
                    currentLang.languageCode ==
                            SupportedLanguageCodes.german.value
                        ? context.loc.germanTextSettingsPage
                        : context.loc.englishTextSettingsPage,
                    style: FluentTheme.of(context).typography.body?.copyWith(
                        color: darkMode
                            ? AppColors.richBlack
                            : AppColors.ghostWhite),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bodyText(
                context,
                context.loc.darkModeTextSettingsPage,
                customFontSize: 14,
              ),
              SizedBox(
                child: ToggleSwitch(
                  checked: darkMode,
                  onChanged: (val) {
                    ref.read(prefsProvider).switchDarkMode();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
