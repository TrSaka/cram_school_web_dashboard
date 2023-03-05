// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:flutter_school/core/base/view/base_view.dart';
import 'package:flutter_school/core/constants/app/app_constants.dart';
import '../../../base/state/base_state.dart';
import '../../../widgets/auth/background/background_colors.dart';
import '../../../widgets/auth/background/background_text.dart';
import '../../../widgets/auth/copy_right_text_widget.dart';
import '../../../widgets/auth/login_field.dart';
import '../../view_model/auth/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late LoginViewModel _viewModel;

  //view must to be stupid

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        onDispose: () {
          _viewModel.clearControllers();
        },
        onModelReady: (model) => _viewModel = model,
        viewModel: LoginViewModel(),
        onPageBuilder: (context, value) {
          return Scaffold(
            body: SizedBox(
              width: getWidth(1),
              height: getHeight(1),
              child: Stack(
                children: const [
                  BackgroundColors(),
                  TopBackgroundText(),
                  BottomBackgroundText(),
                  CopyrightIcon(text: AppConstants.COPYRIGHT_CONSTANT),
                  LoginFieldWidget(),
                ],
              ),
            ),
          );
        });
  }
}
