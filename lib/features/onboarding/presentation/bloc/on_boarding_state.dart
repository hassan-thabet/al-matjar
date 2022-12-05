abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

// Splash Page States
class SplashPageLoading extends OnBoardingState {}

class SplashPageLoaded extends OnBoardingState {
  final bool authState;
  final bool firstTimeState;

  SplashPageLoaded({required this.authState, required this.firstTimeState});
}

// OnBoarding Page States

class OnBoardingSlideChange extends OnBoardingState {
  final int slideIndex;
  OnBoardingSlideChange({required this.slideIndex});
}
