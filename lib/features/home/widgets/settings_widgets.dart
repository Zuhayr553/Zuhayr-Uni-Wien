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
          headerBoldText(context, 'Settings'),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bodyText(
                context,
                'Switch Language',
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
                        ? 'German'
                        : 'English',
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
                'Dark Mode',
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
