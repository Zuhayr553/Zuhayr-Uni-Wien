import 'package:flutter/material.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";
import 'package:uni_wien_zuhayr_test/features/language/language.dart';

class LanguageSettingsScreen extends HookConsumerWidget {
  static const routeName = '/languageSettingsScreen';
  const LanguageSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref
        .watch(languageProvider(context).select((p) => p.supportedLanguages));
    final currentLang =
        ref.watch(languageProvider(context).select((p) => p.currentLanguage));

    return Scaffold();
  }
}
