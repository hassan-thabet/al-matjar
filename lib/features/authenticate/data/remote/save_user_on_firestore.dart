import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SaveUserOnFirestore {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;

  SaveUserOnFirestore(this.firstName, this.lastName, this.email,
      this.phoneNumber, this.password);

  save() {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final userData = <String, dynamic>{
      "user_name": '$firstName $lastName',
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
    };

    try {
      firebaseFirestore.collection('users').doc(email).set(userData);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
