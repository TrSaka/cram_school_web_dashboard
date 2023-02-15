// ignore_for_file: prefer_conditional_assignment

import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:flutter_school/core/service/firebase/storage/base_storage.dart';

class StorageService extends BaseFirebaseStorage {
  static StorageService? _instance;
  static StorageService? get instance {
    if (_instance == null) _instance = StorageService._init();
    return _instance;
  }

  StorageService._init();

  @override
  Future<dynamic>? fetchDefaultProfilePic() async {
    final imagePath = storage.ref().child('profile_pic.png');
    String url = await imagePath.getDownloadURL();

    if (url != null) {
      LocalManagement.instance
          .cacheString(SharedPreferencesKeys.DEFAULT_PROFILE, url);
    }
    return null;
  }
}
