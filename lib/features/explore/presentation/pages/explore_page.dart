import 'package:almatjar/features/explore/presentation/bloc/explore_cubit.dart';
import 'package:almatjar/features/explore/presentation/bloc/explore_state.dart';
import 'package:almatjar/features/explore/presentation/widgets/custom_offer_card.dart';
import 'package:almatjar/features/settings/data/global_app_localizations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/custom_app_bar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      'welcome'.tr(context),
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 22),
                    ),
                    BlocBuilder<ExploreCubit, ExploreState>(
                      builder: (context, state) {
                        if (state is UserDataLoaded) {
                          return AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                state.userName,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 22),
                                speed: const Duration(milliseconds: 300),
                              ),
                            ],
                            totalRepeatCount: 1,
                            pause: const Duration(milliseconds: 150),
                          );
                        }
                        return const Text('');
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/icons/welcome.png',
                      width: 28,
                      height: 28,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  onSaved: (value) {},
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    //labelStyle: const TextStyle(color: Colors.black54, fontSize: 14),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SvgPicture.asset('assets/svg/search.svg',
                          color: Colors.black54),
                    ),
                    hintText: 'search'.tr(context),
                  ),
                  style: Theme.of(context).textTheme.overline,
                  cursorColor: Colors.black54,
                  cursorWidth: 1,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Offers',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              BlocBuilder<ExploreCubit, ExploreState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      CarouselSlider(
                          options: CarouselOptions(
                              pauseAutoPlayOnManualNavigate: true,
                              pauseAutoPlayOnTouch: true,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                BlocProvider.of<ExploreCubit>(context)
                                    .indexChange(index);
                              }),
                          items: <Widget>[
                            for (var index = 0;
                                index <
                                    BlocProvider.of<ExploreCubit>(context)
                                        .listOfOffers
                                        .length;
                                index++)
                              CustomOfferCard(
                                title: BlocProvider.of<ExploreCubit>(context)
                                    .listOfOffers[index]
                                    .title,
                                imageUrl: BlocProvider.of<ExploreCubit>(context)
                                    .listOfOffers[index]
                                    .image,
                              ),
                          ]),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var index = 0;
                                  index <
                                      BlocProvider.of<ExploreCubit>(context)
                                          .listOfOffers
                                          .length;
                                  index++)
                                Container(
                                  width: (BlocProvider.of<ExploreCubit>(context)
                                              .currentIndex ==
                                          index)
                                      ? 12
                                      : 8,
                                  height:
                                      (BlocProvider.of<ExploreCubit>(context)
                                                  .currentIndex ==
                                              index)
                                          ? 12
                                          : 8,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (BlocProvider.of<
                                                      ExploreCubit>(context)
                                                  .currentIndex ==
                                              index)
                                          ? (Theme.of(context).primaryColor)
                                              .withOpacity(0.9)
                                          : Theme.of(context).indicatorColor),
                                )
                            ]

                            // BlocProvider.of<ExploreCubit>(context)
                            //     .listOfOffers
                            //     .asMap()
                            //     .entries
                            //     .map((entry) {
                            //   return Container(
                            //     width: (BlocProvider.of<ExploreCubit>(context).currentIndex == 0) ? 8 : 12,
                            //     height:(BlocProvider.of<ExploreCubit>(context).currentIndex == 0) ? 8 : 12,
                            //     margin: const EdgeInsets.symmetric(
                            //         vertical: 8.0, horizontal: 4.0),
                            //     decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         color: (Theme.of(context).primaryColor).withOpacity(0.9)
                            //     ),
                            //   );
                            // }
                            // ).toList(),
                            ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'categories'.tr(context),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              BlocBuilder<ExploreCubit, ExploreState>(
                  builder: (context, state) {
                return Expanded(
                  flex: 0,
                  child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      children: List.generate(
                          BlocProvider.of<ExploreCubit>(context)
                              .listOfCategories
                              .length, (index) {
                        return Center(
                            child: Column(
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withAlpha(10),
                                child: Image.network(
                                  BlocProvider.of<ExploreCubit>(context)
                                      .listOfCategories[index]
                                      .image,
                                  color: Theme.of(context).primaryColor,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            Text(BlocProvider.of<ExploreCubit>(context)
                                .listOfCategories[index]
                                .name
                                .toUpperCase()),
                          ],
                        ));
                      })),
                );
              }),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
