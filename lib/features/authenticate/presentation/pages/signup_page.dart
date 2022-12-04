import 'package:almatjar/features/authenticate/presentation/widgets/signup_form_widget.dart';
import 'package:almatjar/global_app_localizations.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        appBar: AppBar(
          backgroundColor: const Color(0xffF8F9FA),
          title: Text(
            'signup'.tr(context),
            style: const TextStyle(color: Colors.black87),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: const SignupFormWidget(),
        )),
      ),
    );
  }
}