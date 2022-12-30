import 'package:almatjar/features/explore/presentation/bloc/explore_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());

  Future<void> getUserName() async {
    emit(UserDataLoading());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .get()
        .then(
      (res) {
        print(res.data()!.toString());
        String userName = res.data()!['user_name'].toString();
        emit(UserDataLoaded(userName: userName));
      },
      onError: (error) => print("Error completing: $error"),
    );
  }
}
