import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_school/models/user_model.dart';

abstract class BaseFirestoreService {
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future validateCompanyId(AuthModel model);
}
