import 'dart:io';
import 'package:uni_wien_zuhayr_test/features/home/widgets/widgets.dart';
import 'shared_providers.dart';

final prefsProvider = ChangeNotifierProvider<UserPreferencesNotifier>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return UserPreferencesNotifier(prefs);
});

class UserPreferencesNotifier extends ChangeNotifier {
  UserPreferencesNotifier(this._prefs);

  final SharedPreferences _prefs;

  //ANCHOR - Dark Mode

  bool get isDarkMode => _prefs.getBool(PrefKeys.darkMode) ?? false;

  Future<void> switchDarkMode() async {
    _prefs.setBool(PrefKeys.darkMode, !isDarkMode);
    notifyListeners();
  }

  Future<void> setTheme({required bool dark}) async {
    _prefs.setBool(PrefKeys.darkMode, dark);
    notifyListeners();
  }

  //ANCHOR - Language

  String get languageCode {
    final configuredLanguage = _prefs.getString(PrefKeys.languageCode);

    if (configuredLanguage != null) {
      // user has already configured language in app settings
      return configuredLanguage;
    }

    /**
     * per localeName docs:
     * 
     * localeName returns a language (e.g., "en")
     * a language and country code (e.g. "en_US", "de_AT"), or
     * a language, country code and character set (e.g. "en_US.UTF-8")
     * 
     * we only need the language value
     */
    final platformLocale = Platform.localeName.substring(0, 2);

    final isDeviceLocaleSupported = SupportedLanguageCodes.values
        .where((lc) => lc.value == platformLocale)
        .isNotEmpty;

    if (isDeviceLocaleSupported) {
      /**
       *  user has not yet configured language
       *  fallback to device locale if supported
       **/

      return platformLocale;
    }

    // default to English
    return SupportedLanguageCodes.english.value;
  }

  Future<void> setLanguageCode(String languageCode) async {
    _prefs.setString(PrefKeys.languageCode, languageCode);
    notifyListeners();
  }
}
