import 'package:flutter/material.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  final bool isCurrentPage;

  const OnBoardingPageIndicator({super.key, required this.isCurrentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 6 : 6,
      width: isCurrentPage ? 20 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage
            ? Theme.of(context).primaryColor
            : Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
