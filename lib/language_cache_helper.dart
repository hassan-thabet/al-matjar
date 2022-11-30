import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('locale', languageCode);
  }

  Future<String> getCachedLanguageCode() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString('locale');
    final String phoneLocale = window.locale.languageCode;
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return phoneLocale;
    }
  }
}