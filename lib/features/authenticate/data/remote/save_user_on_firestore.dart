import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SaveUserOnFirestore {
  final String? uid;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;

  SaveUserOnFirestore({
      required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password
  });

  save() {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final userData = <String, dynamic>{
      "user_name": '$firstName $lastName',
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
    };

    try {
      firebaseFirestore.collection('users').doc(uid).set(userData);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
