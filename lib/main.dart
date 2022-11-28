import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'global_app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-matjar',
      debugShowCheckedModeBanner: false,
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
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){} , child: const Text('+'),),
      body: Center(child: Text('hello_world'.tr(context))),
      appBar: AppBar(),
      drawer: const Drawer(),
    );
  }
}

