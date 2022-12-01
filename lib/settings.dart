import 'package:almatjar/bloc/locale_cubit.dart';
import 'package:almatjar/bloc/locale_state.dart';
import 'package:almatjar/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<LocaleCubit , LocaleState>(
            builder: (context , state)
            {
              if(state is ChangeLocaleState)
                {
                  return Column(
                    children: [
                      DropdownButton<String>(
                        value: state.locale.languageCode,
                        items: ['ar' , 'en'].map((String items) {
                          return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items)
                          );
                        }).toList(),
                        onChanged: (String? newValue)
                        {
                          if(newValue != null)
                          {
                            BlocProvider.of<LocaleCubit>(context).changeLanguage(newValue);
                          }
                        },
                      ),
              Text('lang'.tr(context)),
                    ],
                  );
                }
              return const SizedBox();
            }
        )
      ),
    );
  }
}
