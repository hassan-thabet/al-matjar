
import 'package:almatjar/features/authenticate/data/local/first_time_cache_helper.dart';
import 'package:almatjar/features/authenticate/data/local/user_data_cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  PageController controller = PageController();

  OnBoardingCubit() : super(OnBoardingInitial());

  // On App Start
  startSplashPage() async {
    await Future.delayed(const Duration(seconds: 2));
    String? auth = await UserDataCacheHelper().getAuthState();
    bool firstTime = await FirstTimeCacheHelper().getFirstTimeState();
    if (auth != null) {
      emit(SplashPageLoaded(authState: true, firstTimeState: false));
    } else {
      if (firstTime == false) {
        emit(SplashPageLoaded(authState: false, firstTimeState: false));
      } else {
        emit(SplashPageLoaded(authState: false, firstTimeState: true));
      }
    }

    emit(OnBoardingSlideChange(slideIndex: 0));
  }

  // onBoarding screen
  onSlideChange(int slideIndex) {
    FirstTimeCacheHelper().setFirstTimeState();
    emit(OnBoardingSlideChange(slideIndex: slideIndex));
  }


}
