import 'package:almatjar/features/authenticate/data/local/user_data_cache_helper.dart';
import 'package:almatjar/features/authenticate/data/remote/save_user_on_firestore.dart';
import 'package:almatjar/features/authenticate/presentation/bloc/authenticate_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../home/presentation/pages/home_page.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  AuthenticateCubit() : super(AuthenticateInitial());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String firstName = '';
  String phoneNumber = '';
  String lastName = '';



  // Logout method
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    UserDataCacheHelper().setUnAuthState();
    if (kDebugMode) {
      print(FirebaseAuth.instance.currentUser?.email);
    }
  }

  //SIGN UP METHOD
  Future<void> signUpWithEmail(BuildContext context,
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (kDebugMode) {
        print(userCredential.user?.email);
      }
      SaveUserOnFirestore(firstName, lastName, email, phoneNumber, password)
          .save();
      UserDataCacheHelper().setAuthState();
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message!);
        print(email);
      }
    }
  }

  //SIGN IN METHOD
  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserDataCacheHelper().setAuthState();
      if (kDebugMode) {
        print('Logged in successfully');
        print(userCredential.user?.email);
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message!);
        print('error on login');
        print(email);
      }
    }
  }

  //SIGN IN WITH GOOGLE METHOD
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication?.idToken,
          accessToken: googleSignInAuthentication?.accessToken);
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(authCredential);
      User? user = userCredential.user;
      if (kDebugMode) {
        print(user?.email);
      }
      SaveUserOnFirestore(user?.displayName, '', user?.email, user?.phoneNumber,
              'google password')
          .save();
      UserDataCacheHelper().setAuthState();
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());

      }
    }
  }

  //SIGN IN WITH FACEBOOK METHOD
  Future<UserCredential> signInWithFacebook(BuildContext context) async {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData(fields: "name,email");
    if (loginResult.status == LoginStatus.success) {
      SaveUserOnFirestore(userData['name'], '' ,userData['email'], null,
          'facebook password')
          .save();
      UserDataCacheHelper().setAuthState();
      if (kDebugMode) {
        print(userData);
      }
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => const HomePage()));
    }
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
