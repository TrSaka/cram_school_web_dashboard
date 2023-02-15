// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/app/app_constants.dart';
import 'package:flutter_school/core/constants/app/global/global_keys.dart';
import 'package:flutter_school/core/product/view_model/home/screens/student_view_model.dart';
import 'package:flutter_school/core/widgets/global/text_forms.dart';
import 'package:flutter_school/core/widgets/home/popup_button.dart';
import '../../../models/student_model.dart';
import '../../constants/enums/cache_enum.dart';
import '../../riverpod/firebase_riverpod.dart';
import '../../service/cache/locale_management.dart';
import '../../utils/color/scheme_colors.dart';

class StudentAddButtonWidget extends ConsumerWidget {
  StudentViewModel _viewModel = StudentViewModel();
  StudentAddButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: UIColors.defaultPadding * 2),
      child: SizedBox(
        height: 30,
        width: 100,
        child: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Container(
                    height: 600,
                    width: 1000,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          AddUserFormFields(
                              text: "Öğrenci İsmi",
                              validate: (p0) {
                                if (p0!.isEmpty || p0.length < 2) {
                                  return "Bu alan zorunlu";
                                } else {
                                  return null;
                                }
                              },
                              controller: _viewModel.nameController),
                          AddUserFormFields(
                              text: "Öğrenci Soyad",
                              validate: (p0) {
                                if (p0!.isEmpty || p0.length < 2) {
                                  return "Bu alan zorunlu";
                                } else {
                                  return null;
                                }
                              },
                              controller: _viewModel.lastNameController),
                          AddUserFormFields(
                              text: "Öğrenci Numarası",
                              validate: (p0) {
                                if (p0!.contains(AppConstants.VALIDATE_ID)) {
                                  return "Geçersiz karakter";
                                } else if (p0.isEmpty) {
                                  return "Bu alan zorunlu";
                                } else {
                                  return null;
                                }
                              },
                              controller: _viewModel.numberController),
                          AddUserFormFields(
                              text: "Email",
                              validate: (p0) {
                                if (p0!.contains(AppConstants.VALIDATE_EMAIL)) {
                                  return null;
                                } else {
                                  return "Geçersiz email";
                                }
                              },
                              controller: _viewModel.emailController),
                          AddUserFormFields(
                              text: "Şifre",
                              validate: (p0) {
                                if (p0!.isEmpty) {
                                  return "Bu alan zorunlu";
                                }
                              },
                              controller: _viewModel.passWordController),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Kaydet",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          debugPrint("Validated");
                          var model = StudentModel(
                            name: _viewModel.nameController.text,
                            lastName: _viewModel.lastNameController.text,
                            password: _viewModel.passWordController.text,
                            profilePicUrl: LocalManagement.instance.fetchString(
                                    SharedPreferencesKeys.DEFAULT_PROFILE) ??
                                "null",
                            cramSchoolID: 1402,
                            userNumber: int.parse(_viewModel.numberController.text),
                          );
                          try {
                            ref.read(authProvider).auth.registerUser(
                                  _viewModel.emailController.text,
                                  model,
                                );
                            try {
                              ref
                                  .read(authProvider)
                                  .database
                                  .saveUserToDatabase(model);
                              Navigator.pop(context);
                            } catch (e) {
                              rethrow;
                            }
                          } catch (e) {
                            rethrow;
                          }
                        }
                      },
                    ),
                  ],
                  scrollable: true,
                  title: const Text("Öğrenci Ekle"),
                );
              },
            );
          },
          child: const Text(
            "Öğrenci Ekle",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
