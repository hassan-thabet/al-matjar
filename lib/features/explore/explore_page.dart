import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [
          AppBarCustom(),
        ],
      )),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 14, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/svg/cart.svg',
              color: Colors.black54,
              height: 22,
              width: 22,
            ),
          ),
          const Text(
            'Explore',
            style: TextStyle(fontSize: 18),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/svg/bell.svg',
              color: Colors.black54,
              height: 22,
              width: 22,
            ),
          ),
        ],
      ),
    );
  }
}
