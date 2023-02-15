import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/service/firebase/auth/firebase_service.dart';
import 'package:flutter_school/core/service/firebase/firestore/firestore_service.dart';
import 'package:flutter_school/core/service/firebase/storage/storage_service.dart';
import 'package:flutter_school/models/auth_model.dart';
import 'package:flutter_school/models/student_model.dart';

class FirebaseProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;

  AuthService auth = AuthService.instance!; //from repo
  FirestoreService database = FirestoreService.instance!; //from repo
  StorageService storage = StorageService.instance!; //from repo

  bool get isLoading => _isLoading;
  UserCredential? get userCredentinal => _userCredential;

  Future<UserCredential>? loginUser(AuthModel model) async {
    _userCredential = await auth.signInMethod(model);
    return _userCredential!;
    //uer in !
  }

  Future<bool> validateSchool(AuthModel model) async {
    if (await validateSchool(model)) {
      //if user's school exist make it true
      return true;
    } else {
      return false; //else make it false;
    }
  }

  Future getUsers(int id) async {
    return await database.getStudents(id);
  }

  Future saveUserData(StudentModel model) async {
    return await database.saveUserToDatabase(model);
  }

  Future registerUser(String email, StudentModel model) async {
    return await auth.registerUser(email, model);
  }

  Future? getDefaultProfilePicture() async {
    return await storage.fetchDefaultProfilePic();
  }

  Future<bool> checkUser() async {
    bool? state = auth.checkUser();
    return state;
  }

  setLoader(loader) {
    _isLoading = loader;
    notifyListeners();
  }
}

final authProvider = ChangeNotifierProvider<FirebaseProvider>((ref) {
  return FirebaseProvider();
});
