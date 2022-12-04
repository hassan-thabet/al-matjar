
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  PageController controller = PageController();

  OnBoardingCubit() : super(OnBoardingInitial());

  // On App Start
  startSplashPage() async {
    emit(SplashPageLoading());
    /// add new f like check connection or download some data from api
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashPageLoaded());
    emit(OnBoardingSlideChange(slideIndex: 0));
  }

  // onBoarding screen
  onSlideChange(int slideIndex) {
    emit(OnBoardingSlideChange(slideIndex: slideIndex));
  }
}
