// ignore_for_file: prefer_conditional_assignment, avoid_function_literals_in_foreach_calls
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/constants/app/app_constants.dart';
import 'package:flutter_school/core/constants/enums/announcement_enum.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:flutter_school/core/service/firebase/firestore/base_firestore_service.dart';
import 'package:flutter_school/models/announcement_model.dart';
import '../../../../models/auth_model.dart';
import '../../../../models/student_model.dart';

class FirestoreService extends BaseFirestoreService {
  static FirestoreService? _instance;
  static FirestoreService? get instance {
    if (_instance == null) _instance = FirestoreService._init();
    return _instance;
  }

  FirestoreService._init();

  AuthModel returnAuthCachedData() {
    return LocalManagement.instance
        .fetchAuth(SharedPreferencesKeys.HIDE_CACHE_AUTH.toString());
  }

  CollectionReference returnUsersPath() {
    AuthModel cachedModel = returnAuthCachedData();
    return database
        .collection('CRAM SCHOOL')
        .doc(cachedModel.numberID.toString())
        .collection('Users');
  }

  @override
  Future getStudentsOrStudent(
      StudentModel? model, bool fetchSingleStudent) async {
    var model = returnAuthCachedData();
    StudentModel? selectedStudent;
    List<StudentModel> userList = [];
    final userPath = returnUsersPath();

    if (fetchSingleStudent == false) {
      await userPath
          .orderBy('name')
          .get()
          .then((value) => value.docs.forEach((element) {
                userList.add(convertToStudentModel(element.data()));
              }));

      return userList;
    } else {
      await userPath
          .where('userNumber', isEqualTo: model.numberID.toString())
          .get()
          .then((value) {
        value.docs.forEach((element) {
          selectedStudent = StudentModel.fromMap(element.data());
        });
      });

      return selectedStudent;
    }
  }

  @override
  Future saveUserToDatabase(StudentModel model) async {
    final userPath = returnUsersPath();

    Map<String, dynamic> dataToSave = {
      'name': model.name,
      'lastName': model.lastName,
      'password': model.password,
      'cramSchoolID': model.cramSchoolID.toString(),
      'profilePicUrl': model.profilePicUrl,
      'userNumber': model.userNumber.toString(),
      'email': model.email,
      'studentClass': model.studentClass,
    };

    try {
      final response = await userPath.add(dataToSave);
      userPath.doc(response.id).collection("exams").doc("userExamList");

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
      await adminUserPath.get().then(
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
    final userPath = returnUsersPath();
    late StudentModel userModel;
    List userSchoolNumbers = [];

    try {
      await userPath.get().then(
            (value) => value.docs.forEach(
              (userData) {
                debugPrint(userData.data().toString());

                userModel = convertToStudentModel(userData);
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

  StudentModel convertToStudentModel(userData) {
    return StudentModel(
      name: userData['name'],
      lastName: userData['lastName'],
      password: userData['password'],
      profilePicUrl: userData['profilePicUrl'],
      userNumber: int.parse(userData['userNumber']),
      cramSchoolID: int.parse(userData['cramSchoolID']),
      email: userData['email'],
      studentClass: userData['studentClass'],
    );
  }

  @override
  Future getUserUidAndDeleteUserFromDatabase(StudentModel model) async {
    late String willdeleteDocUID;
    late String email;
    late String password;
    late var data;

    List<String> userValues = [];

    final path = returnUsersPath();

    //if user in here data already saved:)
    await path
        .where('userNumber', isEqualTo: model.userNumber.toString())
        .get()
        .then((value) {
      value.docs.forEach((element) {
        willdeleteDocUID = element.id;
        data = element.data();
      });
      email = data['email'];
      password = data['password'];
    });

    await path.doc(willdeleteDocUID).delete().then(
          (value) => debugPrint("User data deleted succesfully"),
        );

    userValues = [email, password];

    return userValues;
  }

  @override
  Future updateUserData(
      StudentModel model, bool resetProfilePicUrl, int oldNumberID) async {
    AuthModel cachedAuthModel = returnAuthCachedData();

    var currentDocument;
    final path = returnUsersPath();

    final getByUserNumber = database
        .collection('CRAM SCHOOL')
        .doc(cachedAuthModel.numberID.toString())
        .collection('Users')
        .where('userNumber', isEqualTo: oldNumberID.toString())
        .get();

    await getByUserNumber.then((value) {
      value.docs.forEach((element) {
        currentDocument = element.id;
      });
    });
    if (resetProfilePicUrl == false) {
      return await path.doc(currentDocument).update({
        'name': model.name,
        'lastName': model.lastName,
        'userNumber': model.userNumber.toString(),
        'studentClass': model.studentClass,
      });
    } else {
      return await path.doc(currentDocument).update({
        'profilePicUrl': AppConstants.DEFAULT_PROFILE_PICTURE,
      });
    }
  }

  @override
  Future updateAnnouncement(
      AnnouncementType type, AnnouncementModel model) async {
    final cramSchoolID = returnAuthCachedData();
    final announcementPath = database
        .collection("CRAM SCHOOL")
        .doc(cramSchoolID.numberID.toString())
        .collection("Announcements");

    switch (type) {
      case AnnouncementType.GENERAL_ANNOUNCEMENT:
        return await announcementPath.doc("general").set(model.toMap());
      case AnnouncementType.CLASS_ANNOUNCEMENT:
        return await announcementPath.doc("specificClass").set(model.toMap());

      case AnnouncementType.PRIVATE_ANNOUNCEMENT:
        return await announcementPath.doc("private").set(model.toMap());
    }
  }

  @override
  Future<List<AnnouncementModel>> getAnnouncements(
      AnnouncementType type) async {
    List<AnnouncementModel> announcements = [];
    final cramSchoolID = returnAuthCachedData().numberID;
    final announcementPath = database
        .collection("CRAM SCHOOL")
        .doc(cramSchoolID.toString())
        .collection("Announcements");

    switch (type) {
      case AnnouncementType.GENERAL_ANNOUNCEMENT:
        await getData(announcementPath, announcements, "general");
        return announcements;

      case AnnouncementType.CLASS_ANNOUNCEMENT:
        await getData(announcementPath, announcements, "specificClass");
        return announcements;
      case AnnouncementType.PRIVATE_ANNOUNCEMENT:
        await getData(announcementPath, announcements, "private");
        return announcements;
    }
  }

  Future getData(CollectionReference announcementPath,
      List<AnnouncementModel> announcements, String filter) async {
    try {
      await announcementPath
          .doc(filter)
          .collection("Announcements")
          .get()
          .then((value) {
        value.docs.forEach((element) {
          final data = AnnouncementModel.fromMap(element.data());
          announcements.add(data);
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future deleteAnnouncement(
      AnnouncementType type, AnnouncementModel model) async {
    final cramSchoolID = returnAuthCachedData().numberID;

    late CollectionReference<Map<String, dynamic>> selectedAnnouncementPath;
    String? announcementUid;
    late String category;

    switch (type) {
      case AnnouncementType.GENERAL_ANNOUNCEMENT:
        category = 'general';
        selectedAnnouncementPath = database
            .collection("CRAM SCHOOL")
            .doc(cramSchoolID.toString())
            .collection('Announcements')
            .doc(category)
            .collection('Announcements');

        await selectedAnnouncementPath.get().then((value) {
          value.docs.forEach((element) {
            if (element['title'] == model.title &&
                element['subtitle'] == model.subtitle &&
                element['deadline'] == Timestamp.fromDate(model.deadline!)) {
              announcementUid = element.id;
            }
          });
        });

        break;

      case AnnouncementType.CLASS_ANNOUNCEMENT:
        category = 'specificClass';
        selectedAnnouncementPath = database
            .collection("CRAM SCHOOL")
            .doc(cramSchoolID.toString())
            .collection('Announcements')
            .doc(category)
            .collection('Announcements');

        await selectedAnnouncementPath.get().then((value) {
          value.docs.forEach((element) {
            if (element['title'] == model.title &&
                element['subtitle'] == model.subtitle &&
                element['studentClass'] == model.studentClass &&
                element['deadline'] == Timestamp.fromDate(model.deadline!)) {
              announcementUid = element.id;
            }
          });
        });
        break; //private func is not working correctly at now and make funcs shorter

      case AnnouncementType.PRIVATE_ANNOUNCEMENT:
        category = 'private';
        selectedAnnouncementPath = database
            .collection("CRAM SCHOOL")
            .doc(cramSchoolID.toString())
            .collection('Announcements')
            .doc(category)
            .collection('Announcements');

        await selectedAnnouncementPath.get().then((value) {
          value.docs.forEach((element) {
            if (element['title'] == model.title &&
                element['subtitle'] == model.subtitle &&
                element['studentNumber'] == model.studentNumber.toString() &&
                element['deadline'] == Timestamp.fromDate(model.deadline!)) {
              announcementUid = element.id;
            }
          });
        });
        break;
    }
    if (announcementUid.toString() == null) {
      print("ERRR");
    } else {
      return await selectedAnnouncementPath
          .doc(announcementUid.toString())
          .delete();
    }
  }
}
