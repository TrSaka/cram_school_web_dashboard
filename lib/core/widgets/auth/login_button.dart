// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/view_model/login_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/riverpod/remember_riverpod.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';
import '../../product/router/router.dart';

class LoginButton extends ConsumerWidget {
  final String text;
  const LoginButton({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool rememberMeState = ref.watch(rememberMeProvider);
    final authNotifier = ref.watch(authProvider);
    LoginViewModel viewModel = LoginViewModel();
    return Column(
      children: [
        const SizedBox(height: 64),
        InkWell(
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: UIColors.PRIMARY_COLOR,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: UIColors.PRIMARY_COLOR.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          onTap: () async {
            authNotifier.database
                .validateCompanyId(int.parse(idController.text))
                .then(
              (state) {
                //validated school id in here !

                if (state == true) {
                  // if exist
                  return authNotifier
                      .loginUser(
                          int.parse(idController.text), //run the login method
                          emailController.text,
                          passwordController.text)
                      ?.then((value) {
                    if (rememberMeState == true) {
                      LocalManagement.instance.cacheString(
                          SharedPreferencesKeys.EMAIL_KEY,
                          emailController.text);
//not val
                      LocalManagement.instance.cacheString(
                          SharedPreferencesKeys.PASSWORD_KEY,
                          passwordController.text);

                      LocalManagement.instance.cacheInteger(
                          SharedPreferencesKeys.ID_KEY,
                          int.parse(idController.text));

                      //if remember me is tick
/*
                      LocalManagement.cacheString(
                          SharedPreferencesKeys.EMAIL_KEY,
                          emailController.text);

                      debugPrint("EMAIL SAVED");

                      LocalManagement().cacheString(key, value);

                      LocalManagement.fetchString(
                                  SharedPreferencesKeys.PASSWORD_KEY) !=
                              null
                          ? LocalManagement.cacheString(
                              SharedPreferencesKeys.PASSWORD_KEY,
                              passwordController.text)
                          : null;
                      debugPrint("PASSWORD SAVED");

                      LocalManagement.fetchInteger(
                                  SharedPreferencesKeys.ID_KEY) !=
                              null
                          ? LocalManagement.cacheInteger(
                              SharedPreferencesKeys.ID_KEY,
                              int.parse(idController.text))
                          : null;
                      debugPrint("ID SAVED");
                      */
                    }

                    NavRoute(const MainRoute()).toPushReplecement(context);
                  });
                } else if (state == false) {
                  //else give an error
                  debugPrint("Not found user or cram school id");
                }
              },
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
