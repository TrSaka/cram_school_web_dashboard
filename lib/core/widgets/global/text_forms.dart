// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_school/core/constants/app/app_constants.dart';
import '../../product/view_model/auth/login_view_model.dart';

LoginViewModel viewModel = LoginViewModel();

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Observer(builder: (context) {
          return TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value != null) {
                  return null;
                } else {
                  return "Bu alan zorunlu";
                }
              },
              obscureText: viewModel.lockState,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    viewModel.changeLockState();
                  },
                  icon: Icon(
                    viewModel.lockState == false
                        ? Icons.lock_open_rounded
                        : Icons.lock,
                  ),
                ),
              ));
        }),
      ],
    );
  }
}

class EmailForm extends StatelessWidget {
  const EmailForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        TextFormField(
          validator: (value) {
            if (value != null) {
              if (value.contains(AppConstants.VALIDATE_EMAIL)) {
                return null;
              }
              return "Yanlış email";
            } else {
              return "Bu alan zorunlu";
            }
          },
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon(Icons.mail_outline),
          ),
        ),
      ],
    );
  }
}

class CompanyForm extends StatelessWidget {
  const CompanyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value != null) {
          if (value.contains(RegExp(AppConstants.VALIDATE_ID))) {
            return "Yanlış kurum kodu";
          }
        }
        if (value == null) {
          return "Bu alan zorunlu";
        } else if (value.length != 4) {
          return "Yanlış kurum kodu";
        }
        return null;
      },
      controller: idController,
      decoration: const InputDecoration(
        hintText: 'ID',
        labelText: 'ID',
        suffixIcon: Icon(Icons.key),
      ),
    );
  }
}

class AddUserFormFields extends StatelessWidget {
  AddUserFormFields({
    required this.text,
    required this.validate,
    required this.controller,
    Key? key,  this.disableType,
  }) : super(key: key);
  final String text;
  final bool? disableType;
  String? Function(String?)? validate;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        enabled:disableType??true,
        controller: controller,
        validator: validate,
        decoration: InputDecoration(
          labelText: text,
        ),
      ),
    );
  }
}
