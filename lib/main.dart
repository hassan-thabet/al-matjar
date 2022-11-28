import 'package:almatjar/bloc/locale_cubit.dart';
import 'package:almatjar/bloc/locale_state.dart';
import 'package:almatjar/settings.dart';
import 'package:flutter/material.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LocaleCubit()..getSavedLanguage()
          ),
        ],
        child: BlocBuilder<LocaleCubit , LocaleState>(
            builder: (context , state)
            {
              if(state is ChangeLocaleState)
              {
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
                  localeResolutionCallback: (deviceLocale , supportedLocales)
                  {
                    for(var locale in supportedLocales)
                    {
                      if(deviceLocale != null && deviceLocale.languageCode == locale.languageCode){
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  home: const HomeScreen(),
                );
              }
              return const SizedBox();
            }
        )

    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));} , child: const Text('+'),),
      body: Center(child: Text('hello_world'.tr(context))),
      appBar: AppBar(),
      drawer: const Drawer(),
    );
  }
}

