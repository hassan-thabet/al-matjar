import 'package:almatjar/features/profile/global_app_localizations.dart';
import 'package:flutter/material.dart';

import '../widgets/otp_form.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              'verification'.tr(context),
            ),
            elevation: 0,
          ),
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "OTP Verification",
                  ),
                  const Text("We sent your code to +1 898 860 ***"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("This code will expired in "),
                      TweenAnimationBuilder(
                        tween: Tween(begin: 30.0, end: 0.0),
                        duration: const Duration(seconds: 60),
                        builder: (_, dynamic value, child) => Text(
                          "00:${value.toInt()}",
                        ),
                      ),
                    ],
                  ),
                  const OtpForm(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // OTP code resend
                    },
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
