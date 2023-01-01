import 'package:almatjar/features/authenticate/presentation/widgets/login_form_widget.dart';
import 'package:almatjar/features/settings/data/global_app_localizations.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'login'.tr(context),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: const SignInFormWidget(),
        )),
      ),
    );
  }
}
