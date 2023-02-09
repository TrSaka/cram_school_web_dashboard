import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signInMethod(int id, String email, String password);


  Future signOutMethod();

  bool isUserLogIn();
}
