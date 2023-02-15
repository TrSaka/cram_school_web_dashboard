// ignore_for_file: prefer_conditional_assignment

import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/service/firebase/firestore/base_firestore_service.dart';

import '../../../../models/auth_model.dart';
import '../../../../models/student_model.dart';

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

  @override
  Future getStudents(int idNumber) async {
    List<dynamic> userList = [];

    final userPath = database
        .collection('CRAM SCHOOL')
        .doc(idNumber.toString())
        .collection('Users');

    await userPath.get().then((value) => value.docs.forEach((element) {
          print(element.data());

          userList.add(element.data());
        }));

    return userList;
  }

  @override
  Future saveUserToDatabase(StudentModel model) async {
    final userPath = database
        .collection('CRAM SCHOOL')
        .doc(model.cramSchoolID.toString())
        .collection('Users');

    Map<String, dynamic> dataToSave = {
      'name': model.name,
      'lastName': model.lastName,
      'password': model.password,
      'cramSchoolID': model.cramSchoolID.toString(),
      'profilePicUrl': model.profilePicUrl,
      'userNumber': model.userNumber.toString(),
    };
    try {
      final response = await userPath.add(dataToSave);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
