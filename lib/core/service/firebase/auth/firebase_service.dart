// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/service/firebase/auth/base_fireabase.dart';
import 'package:flutter_school/models/auth_model.dart';
import '../../../../models/student_model.dart';

class AuthService extends BaseFirebaseService {
  static AuthService? _instance;
  static AuthService? get instance {
    if (_instance == null) _instance = AuthService._init();
    return _instance;
  }

  AuthService._init();

  @override
  bool isUserLogIn() {
    if (auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future signInMethod(AuthModel model) async {
    try {
      UserCredential response = await auth.signInWithEmailAndPassword(
          email: model.email, password: model.password);
      debugPrint("user logged in ");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signOutMethod() {
    return auth.signOut();
  }

  @override
  bool checkUser() {
    if (auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future registerUser(String email, StudentModel model) async {
    try {
      var response = await auth.createUserWithEmailAndPassword(
          email: email, password: model.password);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future deleteUserFromAuth(List userValue) async {
    try {
      User? user = auth.currentUser;
      //email password

      AuthCredential credentials = EmailAuthProvider.credential(
          email: userValue[0], password: userValue[1]);

      var result = await user!.reauthenticateWithCredential(credentials);

      return await result.user!.delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  String getAdminUid() {
    User? user = auth.currentUser;

    String data = user!.uid;
    debugPrint(data);
    return data;
  }

  @override
  Future sendResetEmail(StudentModel model) async {
    final response = await auth.sendPasswordResetEmail(email: model.email);
    try {
      return response;
    } catch (e) {
      
      debugPrint(e.toString());rethrow;
    }
  }
}
