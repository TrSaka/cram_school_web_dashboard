import 'package:flutter/material.dart';
import 'package:flutter_school/core/constants/enums/announcement_enum.dart';
import 'package:flutter_school/models/announcement_model.dart';
import 'package:mobx/mobx.dart';
part 'announcement_view_model.g.dart';

class AnnouncementViewModel = _AnnouncementViewModelBase
    with _$AnnouncementViewModel;

abstract class _AnnouncementViewModelBase with Store {
  List announcementTypes = <AnnouncementType>[
    AnnouncementType.GENERAL_ANNOUNCEMENT, //0
    AnnouncementType.CLASS_ANNOUNCEMENT, //1
    AnnouncementType.PRIVATE_ANNOUNCEMENT, //2
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController studentClassController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();

  clearTextForms() {
    titleController.clear();
    subtitleController.clear();
    studentClassController.clear();
    studentNumberController.clear();
  }

  setFormsByModel(AnnouncementModel model) {
    titleController.text = model.title;
    subtitleController.text = model.subtitle;
    studentClassController.text = model.studentClass.toString();
    studentNumberController.text = model.studentNumber.toString();
  }

  @observable
  DateTime selectedDateTime = DateTime.now();

  @action
  changeDateTimerPickerData(DateTime? newDateTime) {
    if (newDateTime != null) {
      selectedDateTime = newDateTime;
    } else {
      selectedDateTime = DateTime.now();
      debugPrint("User not changed the announcement date");
    }
  }
}
