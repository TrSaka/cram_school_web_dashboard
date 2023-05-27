// ignore_for_file: prefer_conditional_assignment
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:flutter_school/core/service/firebase/storage/base_storage.dart';
import 'package:flutter_school/models/auth_model.dart';
import 'package:flutter_school/models/exam_model.dart';

class StorageService extends BaseFirebaseStorage {
  static StorageService? _instance;
  static StorageService? get instance {
    if (_instance == null) _instance = StorageService._init();
    return _instance;
  }

  StorageService._init();

  AuthModel authCachedData = LocalManagement.instance
      .fetchAuth(SharedPreferencesKeys.HIDE_CACHE_AUTH.toString());

  @override
  Future<dynamic>? fetchDefaultProfilePic() async {
    final imagePath = storage.ref().child('profile_pic.png');
    String? url = await imagePath.getDownloadURL();

    await LocalManagement.instance
        .cacheString(SharedPreferencesKeys.DEFAULT_PROFILE, url);
    return null;
  }

  @override
  Future fetchAndStoreTxtFile(ExamModel model) async {
    final String cramSchoolID = authCachedData.numberID.toString();

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['txt'],
      type: FileType.custom,
    );

    if (result != null && result.files.isNotEmpty) {
      final platformFile = result.files.single;
      final blob = platformFile.bytes; //web byte android path
      final txtName = platformFile.name; //selected document's name

      Reference storageRef =
          storage.ref("$cramSchoolID/exams/${model.examName}/").child(txtName);

      try {
        debugPrint("Storage has been completed");
        return await storageRef.putData(blob!);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      debugPrint("No file selected.");
    }
  }
}
