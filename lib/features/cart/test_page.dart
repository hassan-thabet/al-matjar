import 'package:almatjar/features/profile/global_app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authenticate/presentation/bloc/authenticate_cubit.dart';
import '../authenticate/presentation/pages/register_page.dart';
import '../profile/presentation/bloc/locale_cubit.dart';
import '../profile/presentation/bloc/locale_state.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'signup',
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(child:
            BlocBuilder<LocaleCubit, LocaleState>(builder: (context, state) {
          if (state is ChangeLocaleState) {
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                DropdownButton<String>(
                  value: state.locale.languageCode,
                  items: ['ar', 'en'].map((String items) {
                    return DropdownMenuItem<String>(
                        value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      BlocProvider.of<LocaleCubit>(context)
                          .changeLanguage(newValue);
                    }
                  },
                ),
                Text('lang'.tr(context)),
                const SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: MaterialButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticateCubit>(context).signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    color: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Logout User'),
                        Icon(Icons.logout_rounded),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const SizedBox();
        })),
      ),
    );
  }
}
