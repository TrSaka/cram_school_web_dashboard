import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_school/models/student_model.dart';

import '../../../../models/auth_model.dart';

abstract class BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signInMethod(AuthModel model);

  Future signOutMethod();

  Future registerUser(String email, StudentModel model);

  bool checkUser();

  String getAdminUid();

  Future deleteUserFromAuth(List userValue);

  bool isUserLogIn();

  Future sendResetEmail(StudentModel model);
}
