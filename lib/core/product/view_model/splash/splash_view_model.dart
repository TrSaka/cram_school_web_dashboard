// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:mobx/mobx.dart';
import '../../../../models/auth_model.dart';
import '../../../riverpod/firebase_riverpod.dart';
import '../../../service/cache/locale_management.dart';
import '../../router/nav_route.dart';
import '../../router/router.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  void validate(WidgetRef ref, BuildContext context) async {
    late AuthModel authData;

    var data = await LocalManagement.instance
        .fetchAuth(SharedPreferencesKeys.CACHE_AUTH.toString());

    if (data['status'] != false) {
      authData = AuthModel.fromMap(data);
      AuthModel userModel = AuthModel(
        numberID: authData.numberID,
        email: authData.email,
        password: authData.password,
      );
      try {
        ref.read(authProvider).validateAdmin(userModel)!.then((status) {
          if (status == true) {
            try {
              ref.read(authProvider).loginUser(userModel)?.then(
                    (value) =>
                        NavRoute(const MenuRoute()).toPushReplecement(context),
                  );
            } catch (e) {
              debugPrint(e.toString());
              NavRoute(const LoginRoute()).toPushReplecement(context);
            }
          }
        });
      } catch (e) {
        debugPrint(e.toString());
        NavRoute(const LoginRoute()).toPushReplecement(context);
      }
    } else {
      NavRoute(const LoginRoute()).toPushReplecement(context);
    }
  }
}
