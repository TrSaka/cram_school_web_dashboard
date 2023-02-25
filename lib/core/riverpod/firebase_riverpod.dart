import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/announcement_enum.dart';
import 'package:flutter_school/core/service/firebase/auth/firebase_service.dart';
import 'package:flutter_school/core/service/firebase/firestore/firestore_service.dart';
import 'package:flutter_school/core/service/firebase/storage/storage_service.dart';
import 'package:flutter_school/models/announcement_model.dart';
import 'package:flutter_school/models/auth_model.dart';
import 'package:flutter_school/models/student_model.dart';

class FirebaseProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;

  final AuthService _auth = AuthService.instance!; //from repo
  final FirestoreService _database = FirestoreService.instance!; //from repo
  final StorageService _storage = StorageService.instance!; //from repo

  bool get isLoading => _isLoading;

  Future<UserCredential>? loginUser(AuthModel model) async {
    _userCredential = await _auth.signInMethod(model);
    return _userCredential!;
    //uer in !
  }

  Future<bool>? validateAdmin(AuthModel model) {
    return _database.validateAdminAccount(model);
  }

  Future<bool>? checkNewUserID(StudentModel model) async {
    return await _database.checkNewStudentID(model);
  }

  Future<bool> validateSchool(AuthModel model) async {
    if (await validateSchool(model)) {
      //if user's school exist make it true
      return true;
    } else {
      return false; //else make it false;
    }
  }

  Future getStudentsOrStudent(
      StudentModel? model, bool fetchSingleStudent) async {
    return await _database.getStudentsOrStudent(model, fetchSingleStudent);
    //give index to 0 for fetch all students
  }

  Future saveUserData(StudentModel model) async {
    return await _database.saveUserToDatabase(model);
  }

  Future registerUser(String email, StudentModel model) async {
    return await _auth.registerUser(email, model);
  }

  Future? getDefaultProfilePicture() async {
    return await _storage.fetchDefaultProfilePic();
  }

  Future sendResetEmail(StudentModel model) async {
    return await _auth.sendResetEmail(model);
  }

  Future deleteUserFromDatabase(StudentModel model) async {
    return await _database.getUserUidAndDeleteUserFromDatabase(model);
  }

  Future updateUserData(
      StudentModel model, bool resetProfilePicUrl, int oldNumberID) async {
    return await _database.updateUserData(
        model, resetProfilePicUrl, oldNumberID);
  }

  Future deleteUserFromAuth(userData) async {
    return await _auth.deleteUserFromAuth(userData);
  }

  Future signOut() async {
    return await _auth.signOutMethod();
  }

  Future deleteAnnouncement(AnnouncementType type , AnnouncementModel model)async{
    return await _database.deleteAnnouncement(type, model);
  }

  Future<bool> checkUser() async {
    bool? state = _auth.checkUser();
    return state;
  }

  Future getAnnouncements(AnnouncementType type) async {
    return await _database.getAnnouncements(type);
  }

  String getAdminUserUid() {
    return _auth.getAdminUid();
  }

  setLoader(loader) {
    _isLoading = loader;
    notifyListeners();
  }
}

final authProvider = ChangeNotifierProvider<FirebaseProvider>((ref) {
  return FirebaseProvider();
});
