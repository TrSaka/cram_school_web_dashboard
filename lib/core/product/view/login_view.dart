import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_school/core/base/view/base_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../base/state/base_state.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late LoginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: TextButton(
              child: const Text(
                "Tap me !",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                viewModel.increment();
              },
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Observer(
                    builder: (_) => Text(
                          '${viewModel.userCount}',
                          style: const TextStyle(fontSize: 20),
                        )),
              ),
            ],
          ),
        );
      },
      onModelReady: (model) {
        viewModel = model;
      },
    );
  }
}
