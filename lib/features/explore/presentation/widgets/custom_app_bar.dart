import 'package:almatjar/features/profile/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

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
          Text(
            'Explore'.tr(context),
            style: const TextStyle(fontSize: 18),
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
