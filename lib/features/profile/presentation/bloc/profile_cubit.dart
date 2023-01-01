import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());



  getUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
          (res) async {
        if (kDebugMode) {
          print(res.data()!.toString());
        }
        emit(UserDataLoaded(
            userName: res.data()!['user_name'],
            email: res.data()!['email'],
            image: res.data()!['image']
        ));


          },
      onError: (error) { if (kDebugMode) {
        print("Error completing: $error");
      } },
    );
  }
}