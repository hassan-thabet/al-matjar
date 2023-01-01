import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class GlobalAppLocalizations
{
  final Locale? locale;

  GlobalAppLocalizations({ this.locale });

  static LocalizationsDelegate<GlobalAppLocalizations> delegate = _GlobalAppLocalizationsDelegate();
  static GlobalAppLocalizations? of(BuildContext context)
  {
    return Localizations.of< GlobalAppLocalizations>(context, GlobalAppLocalizations);
  }
  late Map<String ,String> _localizedStrings;

  Future loadJsonLanguage() async
  {
    String jsonString = await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');
    Map<String , dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }
  String translate(String key) => _localizedStrings[key] ?? '';
}

class _GlobalAppLocalizationsDelegate extends LocalizationsDelegate<GlobalAppLocalizations>
{
  @override
  bool isSupported(Locale locale) {
    return ['en' , 'ar'].contains(locale.languageCode);
  }

  @override
  Future<GlobalAppLocalizations> load(Locale locale) async {
    GlobalAppLocalizations localizations = GlobalAppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<GlobalAppLocalizations> old) => false;
}

extension TranslateX on String
{
  String tr (BuildContext context)
  {
    return GlobalAppLocalizations.of(context)!.translate(this);
  }
}