import 'package:firebase_storage/firebase_storage.dart';

abstract class BaseFirebaseStorage {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future? fetchDefaultProfilePic();  
}
