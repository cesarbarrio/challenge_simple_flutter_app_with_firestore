import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dream/config/storage_keys.dart' as StorageKeyConfig;
import 'package:smart_dream/config/api.dart' as ApiConfig;

class LocaleMixin {
  //

  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final String? languageCode =
        prefs.getString(StorageKeyConfig.LOCALE_LANGUAGE_KEY);
    final String? scriptCode =
        prefs.getString(StorageKeyConfig.LOCALE_SCRIPT_KEY);
    final String? countryCode =
        prefs.getString(StorageKeyConfig.LOCALE_COUNTRY_KEY);

    String? language;

    if (languageCode != null) {
      language = languageCode;
      if (scriptCode != null) {
        language += '_$scriptCode';
        if (countryCode != null) {
          language += '_$countryCode';
        }
      }
    }

    return (language == null) ? ApiConfig.API_LANGUAGE_DEFAULT : language;
  }

  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString(StorageKeyConfig.LOCALE_LANGUAGE_KEY);
    final scriptCode = prefs.getString(StorageKeyConfig.LOCALE_SCRIPT_KEY);
    final countryCode = prefs.getString(StorageKeyConfig.LOCALE_COUNTRY_KEY);

    Locale localePrefs = Locale.fromSubtags();

    if (languageCode != null) {
      localePrefs = Locale.fromSubtags(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
    }

    return localePrefs;
  }

  //
}
