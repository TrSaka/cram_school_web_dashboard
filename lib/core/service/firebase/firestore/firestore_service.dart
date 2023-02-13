// ignore_for_file: prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:flutter_school/core/service/firebase/firestore/base_firestore_service.dart';

import '../../../../models/user_model.dart';

class FirestoreService extends BaseFirestoreService {
  static FirestoreService? _instance;
  static FirestoreService? get instance {
    if (_instance == null) _instance = FirestoreService._init();
    return _instance;
  }

  FirestoreService._init();

  @override
  Future<bool> validateCompanyId(AuthModel model) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = database.collection("CRAM SCHOOL");
      var document = await collectionRef.doc(model.numberID.toString()).get();
      if (document.exists == true) {
        debugPrint("School was exist");
        return true; //if user's cram school is in database
      } else {
        return false; //if user's scram schools is not in the database
      }
    } catch (e) {
      return false; //for errors
    }
  }
}
