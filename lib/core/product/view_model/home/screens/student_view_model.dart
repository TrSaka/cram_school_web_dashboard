// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_school/core/extensions/case_extension.dart';
import 'package:mobx/mobx.dart';
import '../../../../../models/auth_model.dart';
import '../../../../../models/student_model.dart';
import '../../../../constants/app/app_constants.dart';
import '../../../../constants/enums/cache_enum.dart';
import '../../../../service/cache/locale_management.dart';
part 'student_view_model.g.dart';

class StudentViewModel = _StudentViewModelBase with _$StudentViewModel;

abstract class _StudentViewModelBase with Store {
  List students = List.empty(growable: true);

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController classController = TextEditingController();

  AuthModel cachedAuthModel = LocalManagement.instance
      .fetchAuth(SharedPreferencesKeys.HIDE_CACHE_AUTH.toString());

  StudentModel convertModelForUpdate(AuthModel cachedAuthModel, userModel) {
    return StudentModel(
      name: nameController.text,
      userNumber: int.parse(numberController.text),
      lastName: lastNameController.text,
      password: userModel!.password, // can not be changed
      cramSchoolID: cachedAuthModel.numberID, //admin's id
      email: userModel!.email, //can not be changed
      studentClass: classController.text,
    );
  }

  filterAndShow(StudentModel singleUser, String searchBarText, widget) {
    if (singleUser.name.toUpc.contains(searchBarText.toUpc) ||
        singleUser.userNumber!.toUpc.contains(searchBarText.toUpc) ||
        singleUser.lastName.toUpc.contains(searchBarText.toUpc)) {
      return widget;
    } else {
      return const SizedBox();
    }
  }

  StudentModel convertModelForSave(AuthModel authModel) {
    return StudentModel(
      name: nameController.text,
      email: emailController.text,
      lastName: lastNameController.text,
      password: passWordController.text,
      profilePicUrl: AppConstants.DEFAULT_PROFILE_PICTURE,
      cramSchoolID: authModel.numberID,
      userNumber: int.parse(numberController.text),
      studentClass: classController.text,
    );
  }

  fetchUserDataAndShowInFormField(StudentModel userModel) {
    emailController.text = userModel.email;
    passWordController.text = userModel.password;
    lastNameController.text = userModel.lastName;
    numberController.text = userModel.userNumber.toString();
    nameController.text = userModel.name;
    classController.text = userModel.studentClass;
  }
}
