import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobx/mobx.dart';
import '../../../../models/user_model.dart';
import '../../../constants/enums/cache_enum.dart';
import '../../../riverpod/firebase_riverpod.dart';
import '../../../service/cache/locale_management.dart';
import '../../router/nav_route.dart';
import '../../router/router.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  void validate(WidgetRef ref, BuildContext context) async {
    await LocalManagement.prefrencesInit();



    String? email =
        LocalManagement.instance.fetchString(SharedPreferencesKeys.EMAIL_KEY);

    String? password = LocalManagement.instance
        .fetchString(SharedPreferencesKeys.PASSWORD_KEY);

    int? idKey =
        LocalManagement.instance.fetchInteger(SharedPreferencesKeys.ID_KEY);

    if (email != null && password != null && idKey != null) {
      AuthModel userModel =
          AuthModel(numberID: idKey, email: email, password: password);
      try {
        ref
            .read(authProvider)
            .database
            .validateCompanyId(userModel)
            .then((status) {
          if (status == true) {
            try {
              ref.read(authProvider).auth.signInMethod(userModel).then(
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
