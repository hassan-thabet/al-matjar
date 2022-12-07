import 'package:almatjar/features/authenticate/presentation/pages/register_page.dart';
import 'package:almatjar/features/onboarding/presentation/bloc/on_boarding_cubit.dart';
import 'package:almatjar/features/onboarding/presentation/bloc/on_boarding_state.dart';
import 'package:almatjar/features/onboarding/presentation/widgets/on_boarding_page_indicator.dart';
import 'package:almatjar/features/onboarding/presentation/widgets/on_boarding_slide_widget.dart';
import 'package:almatjar/features/home/presentation/pages/home_page.dart';
import 'package:almatjar/features/profile/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: double.infinity - 120,
            width: double.infinity,
            child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
              builder: (context, state) {
                return PageView(
                  onPageChanged: (index) {
                    BlocProvider.of<OnBoardingCubit>(context)
                        .onSlideChange(index);
                  },
                  controller:
                      BlocProvider.of<OnBoardingCubit>(context).controller,
                  children: <Widget>[
                    OnBoardingSlideWidget(
                        'assets/images/increase.png',
                        'on_boarding_title1'.tr(context),
                        'on_boarding_description1'.tr(context)),
                    OnBoardingSlideWidget(
                        'assets/images/shipping.png',
                        'on_boarding_title2'.tr(context),
                        'on_boarding_description2'.tr(context)),
                    OnBoardingSlideWidget(
                        'assets/images/payment.png',
                        'on_boarding_title3'.tr(context),
                        'on_boarding_description3'.tr(context)),
                    OnBoardingSlideWidget(
                        'assets/images/marketing.png',
                        'on_boarding_title4'.tr(context),
                        'on_boarding_description4'.tr(context)),
                  ],
                );
              },
            )),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
              builder: (context, state) {
            if (state is OnBoardingSlideChange) {
              if (state.slideIndex != 3) {
                return Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: Text(
                          'skip'.tr(context).toUpperCase(),
                          style: Theme.of(context).textTheme.button?.copyWith(
                              color: Theme.of(context).indicatorColor),
                        ),
                      ),
                          Row(
                            children: [
                              for (int i = 0; i < 4; i++)
                                i == state.slideIndex
                                    ? const OnBoardingPageIndicator(
                                    isCurrentPage: true)
                                    : const OnBoardingPageIndicator(
                                    isCurrentPage: false),
                            ],
                          ),
                          MaterialButton(
                            onPressed: () {
                          BlocProvider.of<OnBoardingCubit>(context)
                              .controller
                              .animateToPage(state.slideIndex + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.linear);
                        },
                        color: Theme.of(context).primaryColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        child: Text(
                          'next'.tr(context).toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                        ],
                      ),
                    );
                  }
                  return Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      color: Theme.of(context).primaryColor,
                      elevation: 12,
                      minWidth: 200,
                      height: 44,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Text(
                        'start'.tr(context).toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              }),
        ));
  }
}
