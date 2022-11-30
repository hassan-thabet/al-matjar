import 'package:almatjar/features/onBoarding/presentation/bloc/onBoarding_cubit.dart';
import 'package:almatjar/features/onBoarding/presentation/bloc/onBoarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onBoarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is SplashPageLoaded) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const OnBoardingPage()));
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
