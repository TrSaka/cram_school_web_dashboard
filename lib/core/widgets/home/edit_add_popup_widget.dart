// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/app/app_constants.dart';
import 'package:flutter_school/core/constants/app/global/global_keys.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/view_model/home/screens/student_view_model.dart';
import 'package:flutter_school/core/utils/responsive/app_responsive_sizes.dart';
import 'package:flutter_school/core/widgets/global/text_forms.dart';
import '../../../models/student_model.dart';
import '../../riverpod/firebase_riverpod.dart';

class StudentAddPopUpButtonWidget extends ConsumerWidget {
  StudentAddPopUpButtonWidget(this.editMode, this.userModel, {super.key});
  final bool editMode;
  final StudentModel? userModel;
  final StudentViewModel _viewModel = StudentViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: editMode == false
              ? DefaultResponsiveSizes.defaultResponsiveSizes * 2
              : 0),
      child: SizedBox(
        height: 30,
        width: editMode == false ? 100 : 50,
        child: TextButton(
          onPressed: () async {
            if (editMode == true) {
              await _viewModel.fetchUserDataAndShowInFormField(userModel);
            }
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
                          sameUserFormField(
                              "Öğrenci İsmi", _viewModel.nameController),
                          sameUserFormField(
                              "Öğrenci Soyad", _viewModel.lastNameController),
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
                              disableType: !editMode,
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
                              hide: editMode,
                              disableType: !editMode,
                              text: "Şifre",
                              validate: (p0) {
                                if (p0!.isEmpty) {
                                  return "Bu alan zorunlu";
                                } else if (p0.length < 5) {
                                  return "Güçsüz şifre";
                                }
                                return null;
                              },
                              controller: _viewModel.passWordController),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        editMode == false
                            ? const SizedBox()
                            : Row(
                                children: [
                                  InkWell(
                                    child: actionButtons(
                                        context, "Şifre Sıfırlama Emaili"),
                                    onTap: () async {
                                      await ref
                                          .read(authProvider)
                                          .sendResetEmail(userModel!);
                                      NavRoute(null).toPop(context);
                                    },
                                  ),
                                  InkWell(
                                    child: actionButtons(
                                        context, "Profil Resmini Sıfırla"),
                                    onTap: () {
                                      ref.read(authProvider).updateUserData(
                                          userModel!,
                                          true,
                                          userModel!.userNumber!);
                                      NavRoute(null).toPop(context);
                                    },
                                  ),
                                ],
                              ),
                        InkWell(
                          child: saveButton(context),
                          onTap: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              if (editMode == false) {
                                debugPrint("Validated");
                                StudentModel model =
                                    _viewModel.convertModelForSave(
                                        _viewModel.cachedAuthModel);
                                ref
                                    .read(authProvider)
                                    .checkNewUserID(model)!
                                    .then((ifIdIsAvailable) {
                                  if (ifIdIsAvailable == true) {
                                    try {
                                      ref.read(authProvider).registerUser(
                                            _viewModel.emailController.text,
                                            model,
                                          );
                                      try {
                                        ref
                                            .read(authProvider)
                                            .saveUserData(model);
                                        Navigator.pop(context);
                                      } catch (e) {
                                        rethrow;
                                      }
                                    } catch (e) {
                                      rethrow;
                                    }
                                  } else {
                                    debugPrint("Wrong ID");
                                  }
                                });
                              } else {
                                StudentModel convertedModel =
                                    _viewModel.convertModelForUpdate(
                                        _viewModel.cachedAuthModel, userModel);
                                ref
                                    .read(authProvider)
                                    .checkNewUserID(convertedModel)!
                                    .then((editedUIDIsAvailable) {
                                  if (editedUIDIsAvailable == true) {
                                    try {
                                      ref.read(authProvider).updateUserData(
                                          convertedModel,
                                          false,
                                          userModel!.userNumber!);
                                    } catch (e) {
                                      debugPrint(e.toString());
                                    }
                                    NavRoute(null).toPop(context);
                                  }
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                  scrollable: true,
                  title: editMode == false
                      ? const Text("Öğrenci Ekle")
                      : const Text("Öğrenciyi Düzenle"),
                );
              },
            );
          },
          child: Center(
            child: editMode == false ? addText() : editIcon(),
          ),
        ),
      ),
    );
  }

  Container saveButton(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text("Kaydet", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Padding actionButtons(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
          height: 40,
          width: 175,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ))),
    );
  }

  Text addText() {
    return const Text(
      "Öğrenci Ekle",
      style: TextStyle(color: Colors.white),
    );
  }

  Icon editIcon() {
    return const Icon(
      Icons.edit,
      color: Colors.green,
    );
  }

  AddUserFormFields sameUserFormField(
      String text, TextEditingController controller) {
    return AddUserFormFields(
        text: text,
        validate: (p0) {
          if (p0!.isEmpty || p0.length < 2) {
            return "Bu alan zorunlu";
          } else {
            return null;
          }
        },
        controller: controller);
  }
}
