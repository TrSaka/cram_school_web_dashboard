// ignore_for_file: prefer_conditional_assignment
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
  Future getStudents(int idNumber) async {
    List<dynamic> userList = [];

    final userPath = database
        .collection('CRAM SCHOOL')
        .doc(idNumber.toString())
        .collection('Users');

    await userPath.get().then((value) => value.docs.forEach((element) {
          debugPrint(element.data().toString());
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

  @override
  Future<bool> validateAdminAccount(AuthModel model) async {
    final adminUserPath = database.collection('Admins');
    late AuthModel adminModel;

    List<AuthModel> accounts = [];

    try {
      final response = await adminUserPath.get().then(
            (value) => value.docs.forEach(
              (userData) {
                debugPrint(userData.data().toString());

                adminModel = AuthModel(
                    numberID: int.parse(userData['cramSchoolID']),
                    email: userData['email'],
                    password: userData['password']);
                accounts.add(adminModel);
              },
            ),
          );
      if (accounts.contains(model)) {
        debugPrint("True");
        return true;
      } else {
        debugPrint("False");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> checkNewStudentID(StudentModel model) async {
    final adminUserPath = database
        .collection('CRAM SCHOOL')
        .doc(model.cramSchoolID.toString())
        .collection('Users');
    late StudentModel userModel;
    List userSchoolNumbers = [];
    try {
      final response = await adminUserPath.get().then(
            (value) => value.docs.forEach(
              (userData) {
                debugPrint(userData.data().toString());

                userModel = StudentModel(
                  name: userData['name'],
                  lastName: userData['lastName'],
                  password: userData['password'],
                  profilePicUrl: userData['profilePicUrl'],
                  userNumber: int.parse(userData['userNumber']),
                  cramSchoolID: int.parse(userData['cramSchoolID']),
                );
                userSchoolNumbers.add(userModel.userNumber);
              },
            ),
          );

      if (userSchoolNumbers.contains(model.userNumber) == true) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
      return true;
    }
  }
}
