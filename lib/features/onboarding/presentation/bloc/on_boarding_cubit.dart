
import 'package:almatjar/features/authenticate/data/local/user_data_cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  PageController controller = PageController();

  OnBoardingCubit() : super(OnBoardingInitial());

  // On App Start
  startSplashPage() async {
    emit(SplashPageLoading());
    await Future.delayed(const Duration(seconds: 2));
    bool auth = await UserDataCacheHelper().getAuthState();
    if(auth == true){
      emit(SplashPageLoaded(authState: true));
    }else{
      emit(SplashPageLoaded(authState: false));
    }

    emit(OnBoardingSlideChange(slideIndex: 0));
  }

  // onBoarding screen
  onSlideChange(int slideIndex) {
    emit(OnBoardingSlideChange(slideIndex: slideIndex));
  }


}
