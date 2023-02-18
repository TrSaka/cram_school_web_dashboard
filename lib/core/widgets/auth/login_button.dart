// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/view_model/auth/login_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/riverpod/remember_riverpod.dart';
import 'package:flutter_school/core/service/cache/locale_management.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';
import 'package:flutter_school/models/auth_model.dart';
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
          onTap: () {
            AuthModel model = AuthModel(
                numberID: int.parse(idController.text),
                email: emailController.text,
                password: passwordController.text);

            authNotifier.validateAdmin(model)!.then(
              (value) {
                if (value == true) {
                  return authNotifier.loginUser(model) //run the login method
                      ?.then((value) {
                    switch (rememberMeState) {
                      case true:
                        LocalManagement.instance
                            .cacheAuth(model, rememberMeState);
                        break;
                      case false:
                        debugPrint("User do not selected remember me button");
                        break;

                      default:
                    }
                    LocalManagement.instance.cacheAuth(model, false);

                    ref.read(authProvider).getAdminUserUid();
                    NavRoute(const MenuRoute()).toPushReplecement(context);
                  });
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
