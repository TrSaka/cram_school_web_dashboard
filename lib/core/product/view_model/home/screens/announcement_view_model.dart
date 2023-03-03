import 'package:flutter/material.dart';
import 'package:flutter_school/core/constants/enums/announcement_enum.dart';
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
