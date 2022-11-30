import 'package:almatjar/bloc/locale_cubit.dart';
import 'package:almatjar/bloc/locale_state.dart';
import 'package:almatjar/features/onBoarding/presentation/bloc/onBoarding_cubit.dart';
import 'package:almatjar/features/onboarding/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'global_app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => LocaleCubit()..getSavedLanguage()),
            BlocProvider(
                create: (context) => OnBoardingCubit()..startSplashPage())
          ],
          child:
              BlocBuilder<LocaleCubit, LocaleState>(builder: (context, state) {
            if (state is ChangeLocaleState) {
              return MaterialApp(
                title: 'Al-matjar',
                debugShowCheckedModeBanner: false,
                locale: state.locale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalAppLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return deviceLocale;
                },
                theme: ThemeData(
                  disabledColor: const Color(0xffFC6B68),
                  fontFamily: state.locale.languageCode == "ar"
                      ? 'Loew Next Arabic'
                      : "Raleway",
                ),
                home: const SplashPage(),
              );
            }
            return const SizedBox();
          })),
    );
  }
}

