import 'dart:ui';

import 'package:smart_dream/mixins/locale_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_dream/repositories/contracts/preferences_repository.dart';
import 'package:smart_dream/config/storage_keys.dart' as StorageKeyConfig;

class PreferencesRepositoryImpl
    with LocaleMixin
    implements PreferencesRepository {
  //

  @override
  Future<Locale> get locale async {
    return await getLocale();
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        StorageKeyConfig.LOCALE_LANGUAGE_KEY, locale.languageCode);

    await prefs.setString(
        StorageKeyConfig.LOCALE_SCRIPT_KEY, locale.scriptCode.toString());

    await prefs.setString(
        StorageKeyConfig.LOCALE_COUNTRY_KEY, locale.countryCode.toString());
  }

  //
}
