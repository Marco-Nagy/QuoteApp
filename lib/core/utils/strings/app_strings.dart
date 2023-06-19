import 'package:flutter/material.dart';
import 'package:quotes/config/locale/app_localizations.dart';

extension AppStrings on BuildContext {
  static const fontFamily = 'Tajwal';
  static const cachedRandomQuote = 'CACHED_RANDOM_QUOTE';
  static const String englishCode = 'en';
  static const String arabicCode = 'ar';
  static const String locale = 'locale';
}

getTranslatedText(String kye, BuildContext context) {
  return AppLocalizations.of(context)?.translate(kye);
}
