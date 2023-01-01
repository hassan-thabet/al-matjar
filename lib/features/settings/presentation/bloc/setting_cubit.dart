import 'dart:ui';
import 'package:almatjar/features/settings/data/language_cache_helper.dart';
import 'package:almatjar/features/settings/presentation/bloc/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(LocaleInitial());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
    await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode)
  async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}