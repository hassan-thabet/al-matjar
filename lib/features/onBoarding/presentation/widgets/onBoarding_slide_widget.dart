import 'package:flutter/material.dart';

class OnBoardingSlideWidget extends StatelessWidget {
  final String imagePath, title, description;

  const OnBoardingSlideWidget(this.imagePath, this.title, this.description,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.add),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 30, color: Colors.brown),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.brown))
        ],
      ),
    );
  }
}
