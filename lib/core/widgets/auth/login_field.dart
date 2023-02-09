import 'package:flutter/material.dart';
import 'package:flutter_school/core/widgets/auth/text_forms.dart';

import 'custom_divider.dart';
import 'login_button.dart';

class LoginFieldWidget extends StatelessWidget {
  const LoginFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(
        size.height > 770
            ? 64
            : size.height > 670
                ? 32
                : 16,
      ),
      child: Center(
        child: Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            color: Colors.white, // login popup color
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Form(
                    key: viewModel.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        topText("SYSTEM LOG IN"),
                        const SizedBox(height: 8),
                        CustomDivider(size: size),
                        const CompanyForm(),
                        const EmailForm(),
                        const PasswordForm(),
                        const LoginButton(text: "Sign In"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text topText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Colors.grey[700],
      ),
    );
  }
}
