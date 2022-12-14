import 'package:almatjar/features/authenticate/presentation/pages/login_page.dart';
import 'package:almatjar/features/authenticate/presentation/pages/signup_page.dart';
import 'package:almatjar/features/authenticate/presentation/widgets/register_with_button_widget.dart';
import 'package:almatjar/features/settings/data/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authenticate_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'register_description'.tr(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 130,
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/google.png',
                buttonTextLabel: 'google'.tr(context),
                buttonBackgroundColor: Colors.white,
                labelColor: Colors.black,
                onClick: () async
                {
                  await BlocProvider.of<AuthenticateCubit>(context)
                      .signInWithGoogle(context);
                },
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/facebook.png',
                buttonTextLabel: 'facebook'.tr(context),
                buttonBackgroundColor: const Color(0xff1577F2),
                labelColor: Colors.white,
                onClick: () async {
                  await BlocProvider.of<AuthenticateCubit>(context)
                      .signInWithFacebook(context);
                },
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/apple.png',
                buttonTextLabel: 'apple'.tr(context),
                buttonBackgroundColor: Colors.black,
                labelColor: Colors.white,
                onClick: () {  },
              ),
              RegisterWithButtonWidget(
                imageAssetPath: 'assets/icons/email.png',
                buttonTextLabel: 'email'.tr(context),
                buttonBackgroundColor: const Color(0xffFC6B68),
                labelColor: Colors.white,
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                },
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
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: Text(
                        'login'.tr(context),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
