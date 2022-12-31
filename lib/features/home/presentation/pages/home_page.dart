import 'package:almatjar/features/explore/presentation/bloc/explore_cubit.dart';
import 'package:almatjar/features/home/presentation/bloc/home_cubit.dart';
import 'package:almatjar/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is TabBarChangeState) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body:
                BlocProvider.of<HomeCubit>(context).pagesList[state.currentTab],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0,
                    onTap: (index) {
                      BlocProvider.of<HomeCubit>(context)
                          .changeNavBarIndex(index);

                      switch (index) {
                      // Explore
                        case 0:
                          BlocProvider.of<ExploreCubit>(context).getUserName();
                          break;

                      // Favorites
                        case 1:
                          /// BlocProvider.of< ... >(context).load();
                          break;

                      // Search
                        case 2:
                          /// BlocProvider.of< ... >(context).load();
                          break;

                      // Profile
                        case 3:
                          /// BlocProvider.of< ... >(context).load();
                          break;
                      }
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/svg/home.svg',
                              color: (state.currentTab == 0)
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).indicatorColor),
                          label: 'explore'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/svg/heart.svg',
                              color: (state.currentTab == 1)
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).indicatorColor),
                          label: 'favorites'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/svg/search.svg',
                              color: (state.currentTab == 2)
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).indicatorColor),
                          label: 'search'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/svg/user.svg',
                              color: (state.currentTab == 3)
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).indicatorColor),
                          label: 'profile'),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox(
          child: Text('data'),
        );
      },
    );
  }
}
