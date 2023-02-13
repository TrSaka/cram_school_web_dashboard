import 'package:firebase_auth/firebase_auth.dart';

import '../../../../models/user_model.dart';

abstract class BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signInMethod(AuthModel model);

  Future signOutMethod();

  bool checkUser();

  bool isUserLogIn();
}
