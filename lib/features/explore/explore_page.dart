import 'package:almatjar/features/cart/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Explore'),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/svg/cart.svg',
              color: Colors.black54,
              height: 22,
              width: 22,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                'assets/svg/bell.svg',
                color: Colors.black54,
                height: 22,
                width: 22,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: const SafeArea(
          child: Center(
        child: Text('explore screen'),
      )),
    );
  }
}
