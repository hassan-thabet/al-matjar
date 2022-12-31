import 'package:almatjar/features/authenticate/presentation/bloc/authenticate_cubit.dart';
import 'package:almatjar/features/explore/presentation/bloc/explore_cubit.dart';
import 'package:almatjar/features/home/presentation/bloc/home_cubit.dart';
import 'package:almatjar/features/onBoarding/presentation/bloc/on_boarding_cubit.dart';
import 'package:almatjar/features/onBoarding/presentation/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/profile/global_app_localizations.dart';
import 'features/profile/presentation/bloc/locale_cubit.dart';
import 'features/profile/presentation/bloc/locale_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarIconBrightness: Brightness.dark // Dark == white status bar -- for IOS.
    ));
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
                create: (context) => OnBoardingCubit()..startSplashPage()),
            BlocProvider(create: (context) => AuthenticateCubit()),
            BlocProvider(
                create: (context) => HomeCubit()..changeNavBarIndex(0)),
            BlocProvider(create: (context) => ExploreCubit()..getUserName()..getCategories()),
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
                  fontFamily: state.locale.languageCode == "ar"
                      ? 'Loew Next Arabic'
                      : "Raleway",
                  appBarTheme: const AppBarTheme(
                      centerTitle: true,
                      titleTextStyle: TextStyle(color: Colors.black87),
                      iconTheme: IconThemeData(color: Colors.black87)),
                  primaryColor: const Color(0xffFC6B68),
                  indicatorColor: const Color(0xff8D8E8F),
                  scaffoldBackgroundColor: const Color(0xffEFF3F6),
                  textTheme: const TextTheme(
                      headline1: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.black),
                      headline2: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          color: Colors.white),
                      headline6: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black54),
                      button: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white),
                      labelMedium: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54),
                      overline: TextStyle(color: Colors.black, fontSize: 18)),
                  iconTheme: const IconThemeData(
                    color: Color(0xffFC6B68),
                  ),
                ),
                home: const SplashPage(),
              );
            }
            return const SizedBox();
          })),
    );
  }
}

