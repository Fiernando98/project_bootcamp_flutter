import 'package:flutter/cupertino.dart';
import 'package:project_bootcamp_flutter/translates/languages/language_en.dart';
import 'package:project_bootcamp_flutter/translates/languages/language_es.dart';
import 'package:project_bootcamp_flutter/translates/translates.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Translates> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      languagesSupported.contains(locale.languageCode);

  @override
  Future<Translates> load(Locale locale) => _load(locale);

  static Future<Translates> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn(locale.languageCode);
      case 'es':
        return LanguageEs(locale.languageCode);
      default:
        return LanguageEn(locale.languageCode);
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translates> old) => false;
}