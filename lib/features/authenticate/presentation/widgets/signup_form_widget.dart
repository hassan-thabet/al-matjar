import 'package:almatjar/features/authenticate/presentation/bloc/authenticate_state.dart';
import 'package:almatjar/features/authenticate/presentation/widgets/register_with_button_widget.dart';
import 'package:almatjar/features/settings/data/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authenticate_cubit.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<AuthenticateCubit>(context).formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              BlocProvider.of<AuthenticateCubit>(context).pickImageFile();
            },
            child: SizedBox(
                height: 128,
                width: 128,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    BlocBuilder<AuthenticateCubit , AuthenticateState>(
                        builder: (context , state){
                          if (state is ImagePickedSuccessfully) {
                            if(state.imageFile != null){
                              return CircleAvatar(
                                backgroundImage: AssetImage(state.imageFile!.path),
                              );
                            }else{
                              return const CircleAvatar(
                                backgroundImage: AssetImage('assets/images/placeholder.png'),
                              );
                            }
                          }
                          return const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/placeholder.png'),
                          );
                        }
                    ),
                    Positioned(
                        bottom: -12,
                        right: -20,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 4,
                          fillColor: Colors.white,
                          shape: const CircleBorder(),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Theme.of(context).iconTheme.color,
                            size: 18,
                          ),
                        ))
                  ],
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    onSaved: (value) {
                      BlocProvider.of<AuthenticateCubit>(context).firstName =
                          value!;
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
                      labelText: 'firstName'.tr(context).toUpperCase(),
                      labelStyle:
                          const TextStyle(color: Colors.black54, fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).primaryColor.withAlpha(10),
                            child: Icon(
                              Icons.looks_one_outlined,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                    ),
                    style: Theme.of(context).textTheme.overline,
                    cursorColor: Colors.black54,
                    cursorWidth: 1,
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    onSaved: (value) {
                      BlocProvider.of<AuthenticateCubit>(context).lastName =
                          value!;
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
                      labelText: 'lastName'.tr(context).toUpperCase(),
                      labelStyle:
                          const TextStyle(color: Colors.black54, fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).primaryColor.withAlpha(10),
                            child: Icon(
                              Icons.looks_two_outlined,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                    ),
                    style: Theme.of(context).textTheme.overline,
                    cursorColor: Colors.black54,
                    cursorWidth: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
            ],
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
                BlocProvider.of<AuthenticateCubit>(context).phoneNumber =
                    value!;
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
                labelText: 'phoneNumber'.tr(context).toUpperCase(),
                labelStyle:
                    const TextStyle(color: Colors.black54, fontSize: 14),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColor.withAlpha(10),
                      child: Icon(
                        Icons.phone_android_rounded,
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
            buttonTextLabel: 'signup'.tr(context),
            buttonBackgroundColor: Theme.of(context).primaryColor,
            labelColor: Colors.white,
            onClick: () {
              BlocProvider.of<AuthenticateCubit>(context)
                  .formKey
                  .currentState
                  ?.save();
              BlocProvider.of<AuthenticateCubit>(context).signUpWithEmail(
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
