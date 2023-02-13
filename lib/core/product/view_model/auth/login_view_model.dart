// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;
TextEditingController idController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

abstract class _LoginViewModelBase with Store {
  final formKey = GlobalKey<FormState>();

  //Password shadow lock settings
  @observable
  bool lockState = true;

  @action
  void changeLockState() {
    lockState = !lockState;
  }



  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    idController.clear();
  }

  //Remember Me Checkbox

  @observable
  bool rememberMeCheckBoxState = false;

  @action
  void changeRememberMeBoxState() {
    rememberMeCheckBoxState = !rememberMeCheckBoxState;
    debugPrint("CheckBox State => $rememberMeCheckBoxState");
  }
}
