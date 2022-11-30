import 'package:almatjar/features/authenticate/presentation/widgets/register_with_button_widget.dart';
import 'package:almatjar/global_app_localizations.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'register_title'.tr(context),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'register_description'.tr(context),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/google.png',
                buttonTextLabel: 'google'.tr(context),
                buttonBackgroundColor: Colors.white,
                labelColor: Colors.black,
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/facebook.png',
                buttonTextLabel: 'facebook'.tr(context),
                buttonBackgroundColor: const Color(0xff1577F2),
                labelColor: Colors.white,
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/apple.png',
                buttonTextLabel: 'apple'.tr(context),
                buttonBackgroundColor: Colors.black,
                labelColor: Colors.white,
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/email.png',
                buttonTextLabel: 'email'.tr(context),
                buttonBackgroundColor: const Color(0xffFC6B68),
                labelColor: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'have_account'.tr(context),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        'login'.tr(context),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffFC6B68),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
