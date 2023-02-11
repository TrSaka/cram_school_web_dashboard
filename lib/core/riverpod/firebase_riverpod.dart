import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/service/firebase/auth/firebase_service.dart';
import 'package:flutter_school/core/service/firebase/firestore/firestore_service.dart';

class FirebaseProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;

  AuthService auth = AuthService.instance!; //from repo
  FirestoreService database = FirestoreService.instance!; //from repo

  bool get isLoading => _isLoading;
  UserCredential? get userCredentinal => _userCredential;

  Future<UserCredential>? loginUser(
      int id, String email, String password) async {
    _userCredential = await auth.signInMethod(id, email, password);
    return _userCredential!;
    //uer in !
  }

  Future<bool> validateSchool(int id) async {
    if (await validateSchool(id)) {
      //if user's school exist make it true
      return true;
    } else {
      return false; //else make it false;
    }
  }

  setLoader(loader) {
    _isLoading = loader;
    notifyListeners();
  }
}

final authProvider = ChangeNotifierProvider<FirebaseProvider>((ref) {
  return FirebaseProvider();
});
