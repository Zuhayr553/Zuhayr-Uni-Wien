import 'package:uni_wien_zuhayr_test/features/home/models/models.dart';
import 'package:uni_wien_zuhayr_test/shared/widgets/text_widgets.dart';
import 'widgets.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref
        .watch(languageProvider(context).select((p) => p.supportedLanguages));
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
                height: 30.h,
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
                height: 30.h,
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
