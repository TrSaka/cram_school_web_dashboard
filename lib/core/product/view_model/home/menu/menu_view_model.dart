// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/router/router.dart';
import 'package:flutter_school/core/product/view/home/screens/announcement_view.dart';
import 'package:flutter_school/core/product/view/home/screens/exam_result_view.dart';
import 'package:flutter_school/core/product/view/home/screens/homeworks_view.dart';
import 'package:flutter_school/core/product/view/home/screens/settings_view.dart';
import 'package:flutter_school/core/product/view/home/screens/students_view.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:mobx/mobx.dart';
part 'menu_view_model.g.dart';

class MenuViewModel = _MenuViewModelBase with _$MenuViewModel;

abstract class _MenuViewModelBase with Store {
  List<Widget> pages = const [
    StudentsView(),
    ExamResultView(),
    HomeWorkView(),
    AnnouncementView(),
    SettingsView(),
  ];

  void checkUserLoggedProtectUrl(WidgetRef ref, BuildContext context) async {
    if (await ref.read(authProvider).checkUser() == true) {
      debugPrint("Access Status Okay");
      return null;
    } else {
      debugPrint("Access Status Denied");
      NavRoute(const LoginRoute()).toPushReplecement(context);
    }
  }

  void deleteRememberMeDataFromCache() {
    LocalManagement.instance.deleteString(SharedPreferencesKeys.EMAIL_KEY);
    // LocalManagement.instance.deleteString(SharedPreferencesKeys.PASSWORD_KEY);
    LocalManagement.instance.deleteInteger(SharedPreferencesKeys.ID_KEY);
  }
}

final pageChangeProvider =
    NotifierProvider<PageNotifier, int>(PageNotifier.new);

class PageNotifier extends Notifier<int> {
  PageNotifier();

  void changeState(int number) {
    state = number;
  }

  @override
  int build() {
    return 0;
  }
}
