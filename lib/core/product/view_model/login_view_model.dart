import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;
TextEditingController idController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

abstract class _LoginViewModelBase with Store {
  final formKey = GlobalKey<FormState>();

  @observable
  int userCount = 0;

  @observable
  bool lockState = true;

  @action
  void changeLockState() {
    lockState = !lockState;
  }

  @action
  void increment() {
    userCount++;
  }
}
