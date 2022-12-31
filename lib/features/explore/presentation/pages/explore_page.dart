import 'package:almatjar/features/explore/presentation/bloc/explore_cubit.dart';
import 'package:almatjar/features/explore/presentation/bloc/explore_state.dart';
import 'package:almatjar/features/profile/global_app_localizations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/custom_app_bar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                textStyle:  Theme.of(context)
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            BlocBuilder<ExploreCubit , ExploreState>(
                builder: (context , state) {
                  return Expanded(
                    child: GridView.count(
                        crossAxisCount: 4,
                        children: List.generate(
                            BlocProvider.of<ExploreCubit>(context).categoryModel.length,
                                (index) {
                                return Center(
                                    child: Column(
                                      children: [
                                        Image.network(BlocProvider.of<ExploreCubit>(context).categoryModel[index].image , width: 40 , height: 40,),
                                        Text(BlocProvider.of<ExploreCubit>(context).categoryModel[index].name),
                                      ],
                                    )
                                );
                        }
                        )
                    ),
                  );
                })
      ],
        )),
      ),
    );
  }
}
