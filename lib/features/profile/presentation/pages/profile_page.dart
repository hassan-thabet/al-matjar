import 'package:almatjar/features/cart/test_page.dart';
import 'package:almatjar/features/settings/data/global_app_localizations.dart';
import 'package:almatjar/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authenticate/presentation/bloc/authenticate_cubit.dart';
import '../../../authenticate/presentation/pages/register_page.dart';
import '../bloc/profile_cubit.dart';
import '../widgets/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 34),
            child: Column(
              children: [
                BlocBuilder<ProfileCubit , ProfileState>
                  (
                    builder: (context , state){
                      if (state is UserDataLoaded){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 88,
                                  width: 88,
                                  child: CircleAvatar(
                                    backgroundImage:
                                    (state.image != '')
                                        ? NetworkImage(state.image)
                                        : const NetworkImage('https://firebasestorage.googleapis.com/v0/b/al-matjar-90333.appspot.com/o/placeholder.png?alt=media&token=0ad3ca0c-dadd-4e97-bded-14b8840a2b56'),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: FittedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.userName,
                                        style: Theme.of(context).textTheme.headline1,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        state.email,
                                        style: Theme.of(context).textTheme.headline6,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    }

                  ),

                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height / 50, horizontal: height / 50),
                        width: width - 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(70),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            CustomListTile(
                              Icons.person_outline_rounded,
                              "My Profile".tr(context),
                              () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TestPage()));
                              },
                            ),
                            CustomListTile(Icons.shopping_basket_outlined,
                                "My Orders".tr(context), () {}),
                            CustomListTile(Icons.wallet_outlined,
                                "My Wallet".tr(context), () {}),
                            CustomListTile(
                              Icons.offline_bolt_outlined,
                              "Challenges".tr(context),
                                  () {},
                            ),
                            CustomListTile(
                              Icons.error_outline,
                              "suggestions".tr(context),
                                  () {},
                            ),
                            CustomListTile(
                              Icons.dangerous_outlined,
                              "terms".tr(context),
                                  () {},
                            ),
                            CustomListTile(
                              Icons.question_answer_outlined,
                              "connect".tr(context),
                                  () {},
                            ),
                            CustomListTile(
                              Icons.power_settings_new_rounded,
                              "logout".tr(context),
                                  () {
                                BlocProvider.of<AuthenticateCubit>(context)
                                    .signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const RegisterPage()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
