import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'student_view_model.g.dart';

class StudentViewModel = _StudentViewModelBase with _$StudentViewModel;

abstract class _StudentViewModelBase with Store {
  List students = List.empty(growable: true);

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();


}
