import 'package:flutter/material.dart';

class RegisterWithButtonWidget extends StatelessWidget {
  final String? imageAssetPath;
  final String buttonTextLabel;
  final Color buttonBackgroundColor;
  final Color labelColor;
  final VoidCallback onClick;

  const RegisterWithButtonWidget(
      {super.key,
        this.imageAssetPath,
        required this.buttonTextLabel,
        required this.buttonBackgroundColor,
        required this.labelColor,
        required this.onClick
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onClick,
        minWidth: double.infinity - 130,
        color: buttonBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Row(

          mainAxisAlignment: (imageAssetPath == null) ? MainAxisAlignment.center : MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: (imageAssetPath != null) ? Image.asset(imageAssetPath!, height: 28, width: 28) : const SizedBox(),
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
