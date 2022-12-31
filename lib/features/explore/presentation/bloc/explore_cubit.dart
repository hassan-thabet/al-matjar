import 'package:almatjar/features/explore/data/models/category_model.dart';
import 'package:almatjar/features/explore/presentation/bloc/explore_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());

  List<CategoryModel> categoryModel = [];
  Future<void> getUserName() async {
    emit(UserDataLoading());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (res) {
        if (kDebugMode) {
          print(res.data()!.toString());
        }
        String userName = res.data()!['user_name'].toString();
        emit(UserDataLoaded(userName: userName));
      },
      onError: (error) { if (kDebugMode) {
        print("Error completing: $error");
      } },
    );
  }

  getCategories () async {
    await FirebaseFirestore.instance
        .collection("categories")
        .get()
        .then((value) {
          for(int items = 0 ; items < value.docs.length ; items++){
            categoryModel.add(CategoryModel.fromJson(value.docs[items].data()));
          }
    });
  }
}
