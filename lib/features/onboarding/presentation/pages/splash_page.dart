import 'package:almatjar/features/authenticate/presentation/pages/register_page.dart';
import 'package:almatjar/features/onBoarding/presentation/bloc/on_boarding_cubit.dart';
import 'package:almatjar/features/onBoarding/presentation/bloc/on_boarding_state.dart';
import 'package:almatjar/features/home/presentation/pages/home_page.dart';
import 'package:almatjar/features/settings/data/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state)  {
        if (state is SplashPageLoaded) {
          if(state.authState == true){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }else {
            if (state.firstTimeState == false) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnBoardingPage()));
            }
          }
        }
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Text(
              'app_name'.tr(context),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
