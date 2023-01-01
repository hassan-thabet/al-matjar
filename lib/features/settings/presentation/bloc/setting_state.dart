
import 'dart:ui';

abstract class SettingState {}

class LocaleInitial extends SettingState {}


class ChangeLocaleState extends SettingState
{
  final Locale locale;
  ChangeLocaleState({required this.locale});
}