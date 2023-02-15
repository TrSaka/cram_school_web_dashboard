import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_school/models/auth_model.dart';
import 'package:flutter_school/models/student_model.dart';

abstract class BaseFirestoreService {
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future validateCompanyId(AuthModel model);

  Future saveUserToDatabase(StudentModel model);

  Future getStudents(int idNumber);
}
