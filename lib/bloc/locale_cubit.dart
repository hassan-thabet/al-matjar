
import 'dart:ui';

import 'package:almatjar/bloc/locale_state.dart';
import 'package:almatjar/language_cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<LocaleState>{
  LocaleCubit() : super (LocaleInitial());


  Future<void> getSavedLanguage()
  async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode)
  async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}