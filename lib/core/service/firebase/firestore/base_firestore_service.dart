import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_school/models/auth_model.dart';
import 'package:flutter_school/models/student_model.dart';

abstract class BaseFirestoreService {
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<bool> checkNewStudentID(StudentModel model);

  Future saveUserToDatabase(StudentModel model);

  Future<bool> validateAdminAccount(AuthModel model);

  Future getStudentsOrStudent(StudentModel? model, bool fetchSingleStudent);

  Future getUserUidAndDeleteUserFromDatabase(StudentModel model);

  Future updateUserData(StudentModel model,bool resetProfilePicUrl);
}
