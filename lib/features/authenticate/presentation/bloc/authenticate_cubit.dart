import 'dart:developer';
import 'dart:io';
import 'package:almatjar/features/authenticate/data/local/user_data_cache_helper.dart';
import 'package:almatjar/features/authenticate/data/remote/save_user_on_firestore.dart';
import 'package:almatjar/features/authenticate/presentation/bloc/authenticate_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../../../home/presentation/pages/home_page.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  AuthenticateCubit() : super(AuthenticateInitial());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final ImagePicker picker = ImagePicker();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String imagePath = '';

  String email = '';
  String password = '';
  String firstName = '';
  String phoneNumber = '';
  String lastName = '';
  String image = '';


  pickImageFile () async {
    try{
      final pickImage = await picker.pickImage(source: ImageSource.gallery);
      imagePath = pickImage!.path;
      emit(ImagePickedSuccessfully(imageFile: File(pickImage.path)));
    }catch(error){
      log(error.toString());
    }
  }

  uploadImage(String path) async {
    try {
      File file = File(path);
      final ref = firebaseStorage.ref().child('users/images/${DateTime.now().toString()}');
      await ref.putFile(file);
      log('image uploaded successfully ');
      String url = await ref.getDownloadURL();
      log(url);
      image = url;
    }catch(e)
    {
      log(e.toString());
    }
  }


  // Logout method
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    UserDataCacheHelper().setUnAuthState();
    if (kDebugMode) {
      print(FirebaseAuth.instance.currentUser?.email);
    }
  }

  //SIGN UP METHOD
  Future<void> signUpWithEmail(
      BuildContext context,
      {required String email, required String password}) async {
    try {

      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      await uploadImage(imagePath);
      SaveUserOnFirestore(
          uid: uid ,
          firstName: firstName ,
          lastName: lastName ,
          email: email ,
          password: password ,
          phoneNumber: phoneNumber ,
          image : image ,
      ).save();

      UserDataCacheHelper().setAuthState(userUid : uid!);
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
  Future<void> signInWithEmail(BuildContext context,
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user?.uid;
      UserDataCacheHelper().setAuthState(userUid : uid!);
      if (kDebugMode) {
        print('Logged in successfully');
        print(userCredential.user?.email);
      }
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => const HomePage()));
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
      final uid = user?.uid;
      SaveUserOnFirestore(
          uid : uid,
          firstName : user?.displayName,
          lastName: '',
          email : user?.email,
          phoneNumber : user?.phoneNumber,
          password :'google password',
          image: user?.photoURL ,
      )
          .save();
      UserDataCacheHelper().setAuthState(userUid: uid!);
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());

      }
    }
  }

  //SIGN IN WITH FACEBOOK METHOD
  Future<UserCredential> signInWithFacebook(BuildContext context) async  {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData(fields: "name,email,picture.width(200)");
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    final uid = userCredential.user!.uid;
    if (loginResult.status == LoginStatus.success) {
      SaveUserOnFirestore(
          uid : uid,
          firstName : userData['name'],
          lastName : '' ,
          email : userData['email'],
          phoneNumber : null,
          password : 'facebook password' ,
          image:  userData["picture"]["data"]["url"],
      )
          .save();
      UserDataCacheHelper().setAuthState(userUid: uid);
      if (kDebugMode) {
        print(userData);
      }
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => const HomePage()));
    }
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
