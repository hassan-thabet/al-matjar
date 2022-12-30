import 'package:almatjar/features/explore/presentation/pages/explore_page.dart';
import 'package:almatjar/features/home/presentation/bloc/home_state.dart';
import 'package:almatjar/features/profile/presentation/pages/profile_page.dart';
import 'package:almatjar/features/search/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../favorites/favorites_page.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/svg/home.svg',
        ),
        label: 'explore'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/svg/heart.svg'), label: 'favorites'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/svg/search.svg'),
        label: 'notifications'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/svg/user.svg'), label: 'profile'),
  ];

  List<Widget> pagesList = const [
    ExplorePage(),
    FavoritesPage(),
    SearchPage(),
    ProfilePage(),
  ];

  void changeNavBarIndex(int index) {
    emit(TabBarChangeState(index));
  }
}
