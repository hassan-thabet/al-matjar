import 'package:flutter/material.dart';

class RegisterWithButtonWidget extends StatelessWidget {
  final String imageAssetPath;
  final String buttonTextLabel;
  final Color buttonBackgroundColor;
  final Color labelColor;

  const RegisterWithButtonWidget(
      {super.key,
      required this.imageAssetPath,
      required this.buttonTextLabel,
      required this.buttonBackgroundColor,
      required this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {},
        minWidth: double.infinity - 130,
        color: buttonBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Image.asset(imageAssetPath, height: 28, width: 28),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                buttonTextLabel,
                style: TextStyle(
                    color: labelColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
