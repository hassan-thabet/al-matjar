import 'package:almatjar/features/authenticate/presentation/widgets/register_with_button_widget.dart';
import 'package:almatjar/features/settings/data/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authenticate_cubit.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<AuthenticateCubit>(context).formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              onSaved: (value) {
                BlocProvider.of<AuthenticateCubit>(context).email = value!;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'emailAddress'.tr(context).toUpperCase(),
                labelStyle:
                    const TextStyle(color: Colors.black54, fontSize: 14),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColor.withAlpha(10),
                      child: Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).iconTheme.color,
                      )),
                ),
              ),
              style: Theme.of(context).textTheme.overline,
              cursorColor: Colors.black54,
              cursorWidth: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              onSaved: (value) {
                BlocProvider.of<AuthenticateCubit>(context).password = value!;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'password'.tr(context).toUpperCase(),
                  labelStyle:
                      const TextStyle(color: Colors.black54, fontSize: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).primaryColor.withAlpha(10),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Theme.of(context).iconTheme.color,
                        )),
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.black54,
                    ),
                  )),
              style: Theme.of(context).textTheme.overline,
              cursorColor: Colors.black54,
              cursorWidth: 1,
              obscureText: true,
            ),
          ),
          RegisterWithButtonWidget(
            buttonTextLabel: 'login'.tr(context),
            buttonBackgroundColor: Theme.of(context).primaryColor,
            labelColor: Colors.white,
            onClick: () {
              BlocProvider.of<AuthenticateCubit>(context)
                  .formKey
                  .currentState
                  ?.save();
              BlocProvider.of<AuthenticateCubit>(context).signInWithEmail(
                  context,
                  email: BlocProvider.of<AuthenticateCubit>(context).email,
                  password:
                      BlocProvider.of<AuthenticateCubit>(context).password);
            },
          ),
        ],
      ),
    );
  }
}
