// ignore_for_file: prefer_conditional_assignment
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:flutter_school/core/service/firebase/storage/base_storage.dart';
import 'package:flutter_school/models/exam_model.dart';
import '../../../../models/auth_model.dart';

class StorageService extends BaseFirebaseStorage {
  static StorageService? _instance;
  static StorageService? get instance {
    if (_instance == null) _instance = StorageService._init();
    return _instance;
  }

  StorageService._init();

  AuthModel returnAuthCachedData() {
    return LocalManagement.instance
        .fetchAuth(SharedPreferencesKeys.HIDE_CACHE_AUTH.toString());
  }

  @override
  Future<dynamic>? fetchDefaultProfilePic() async {
    final imagePath = storage.ref().child('profile_pic.png');
    String? url = await imagePath.getDownloadURL();

    await LocalManagement.instance
        .cacheString(SharedPreferencesKeys.DEFAULT_PROFILE, url);
    return null;
  }

  @override
  Future storeExamTxtFile(ExamModel model, String txtName) async {
    final String cramSchoolID = returnAuthCachedData().numberID.toString();

    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    result == null ? null : debugPrint("File Selected");
    txtName = txtName.contains("txt") == true ? txtName : "$txtName.txt";

    Reference storageRef =
        storage.ref("$cramSchoolID/exams/${model.examName}/").child(txtName);

    String filePath = "$cramSchoolID/exams/${model.examName}/$txtName";
    File file = File(filePath);

    try {
      return await storageRef.putFile(file);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
