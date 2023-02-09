import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/view_model/login_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';

import '../../product/router/router.dart';

class LoginButton extends ConsumerWidget {
  final String text;
  const LoginButton({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            authNotifier
                .loginUser(int.parse(idController.text), emailController.text,
                    passwordController.text)
                ?.then(
                  (value) =>
                      NavRoute(const MainRoute()).toPushReplecement(context),
                );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
