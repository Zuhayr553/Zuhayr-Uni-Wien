import 'package:uni_wien_zuhayr_test/shared/providers/shared_providers.dart';

enum SupportedLanguageCodes {
  english('en'),
  german('de');

  const SupportedLanguageCodes(this.value);

  final String value;
}

final languageProvider =
    Provider.family.autoDispose<LanguageProvider, BuildContext>((ref, context) {
  final prefs = ref.watch(prefsProvider);
  return LanguageProvider(ref, context, prefs);
});

class LanguageProvider extends ChangeNotifier {
  final ProviderRef ref;
  final BuildContext context;
  final UserPreferencesNotifier prefs;

  LanguageProvider(this.ref, this.context, this.prefs);

  List<Language> get supportedLanguages => [
        Language(SupportedLanguageCodes.english.value),
        Language(SupportedLanguageCodes.german.value),
      ];

  Language get currentLanguage => supportedLanguages.firstWhere(
        (e) => e.languageCode == prefs.languageCode,
        orElse: () => supportedLanguages.first,
      );

  Future<void> setCurrentLanguage(Language language) async {
    prefs.setLanguageCode(language.languageCode);
    notifyListeners();
  }
}
