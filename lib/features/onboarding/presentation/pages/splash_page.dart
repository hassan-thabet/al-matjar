import 'package:almatjar/features/authenticate/data/local/user_data_cache_helper.dart';
import 'package:almatjar/features/onboarding/presentation/bloc/on_boarding_cubit.dart';
import 'package:almatjar/features/onboarding/presentation/bloc/on_boarding_state.dart';
import 'package:almatjar/home_page.dart';
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
          }else{
            Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const OnBoardingPage()));
          }
        }
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xffFC6B68),
          child: const Center(
            child: Text(
              'Al - matjar',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
