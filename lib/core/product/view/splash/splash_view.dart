import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/router/router.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    validate();
    super.initState();
  }

  void validate() async {
    String? email =
        LocalManagement.instance.fetchString(SharedPreferencesKeys.EMAIL_KEY);

    String? password = LocalManagement.instance
        .fetchString(SharedPreferencesKeys.PASSWORD_KEY);

    int? idKey =
        LocalManagement.instance.fetchInteger(SharedPreferencesKeys.ID_KEY);

    if (email != null && password != null && idKey != null) {
      try {
        ref.read(authProvider).database.validateCompanyId(idKey).then((status) {
          if (status == true) {
            try {
              ref
                  .read(authProvider)
                  .auth
                  .signInMethod(idKey, email, password)
                  .then(
                    (value) =>
                        NavRoute(const MainRoute()).toPushReplecement(context),
                  );
            } catch (e) {
              debugPrint(e.toString());
              NavRoute(const LoginRoute()).toPushReplecement(context);
            }
          }
        });
      } catch (e) {
        print(e.toString());
        NavRoute(const LoginRoute()).toPushReplecement(context);
      }
    } else {
      NavRoute(const LoginRoute()).toPushReplecement(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
