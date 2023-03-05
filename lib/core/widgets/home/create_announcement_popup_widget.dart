// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/app/global/global_keys.dart';
import 'package:flutter_school/core/constants/enums/announcement_enum.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/product/view_model/home/screens/announcement_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';
import 'package:flutter_school/core/utils/responsive/app_responsive_sizes.dart';
import 'package:flutter_school/core/widgets/home/save_button.dart';
import 'package:flutter_school/models/announcement_model.dart';

class CreateEditAnnouncementWidget extends ConsumerStatefulWidget {
  const CreateEditAnnouncementWidget(
      this.tabController, this.editTheme, this.model,
      {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEditAnnouncementWidgetState();

  final TabController tabController;
  final bool editTheme;
  final AnnouncementModel? model;
}

class _CreateEditAnnouncementWidgetState
    extends ConsumerState<CreateEditAnnouncementWidget> {
  final AnnouncementViewModel _viewModel = AnnouncementViewModel();
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    _viewModel.clearTextForms();

    super.initState();
  }

  @override
  void dispose() {
    _viewModel.clearTextForms();
    super.dispose();
  }

  //_viewModel.announcementTypes[widget.tabController.index] gives us type of selected annoucement

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.editTheme == false
          ? defaultCreateButton(context)
          : editButton(),
      onTap: () async {
        if (widget.editTheme) {
          _viewModel.setFormsByModel(widget.model!);
        }
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: widget.editTheme == false
                  ? const Text("Duyuru Ekle")
                  : const Text("Duyuru Düzenle"),
              content: SizedBox(
                height: 600,
                width: 800,
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnnouncementFormField(
                          controller: _viewModel.titleController,
                          text: "Başlık"),
                      AnnouncementFormField(
                          controller: _viewModel.subtitleController,
                          text: "Açıklama"),

                      // default forms

                      _viewModel.announcementTypes[
                                  widget.tabController.index] ==
                              AnnouncementType.CLASS_ANNOUNCEMENT
                          ? AnnouncementFormField(
                              controller: _viewModel.studentClassController,
                              text: "Öğrenci Sınıfı")
                          : const SizedBox(),

                      _viewModel.announcementTypes[
                                  widget.tabController.index] ==
                              AnnouncementType.PRIVATE_ANNOUNCEMENT
                          ? AnnouncementFormField(
                              controller: _viewModel.studentNumberController,
                              text: "Öğrenci Numarası")
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              actions: [
                pickDate(),
                TextButton(
                  onPressed: () async {
                    if (widget.editTheme == false) {
                      await ref.read(authProvider).createAnnouncement(
                            _viewModel
                                .announcementTypes[widget.tabController.index],
                            announcementModelByType(_viewModel
                                .announcementTypes[widget.tabController.index]),
                          );
                      _viewModel.clearTextForms();
                    } else {
                      await ref.read(authProvider).updateAnnouncement(
                          _viewModel
                              .announcementTypes[widget.tabController.index],
                          announcementModelByType(_viewModel
                              .announcementTypes[widget.tabController.index]),
                          widget.model!);
                    }
                    NavRoute(null).toPop(context);
                  },
                  child: SaveButton(context: context),
                ),
              ],
            );
          },
        );
      },
    );
  }

  announcementModelByType(type) {
    switch (type) {
      case AnnouncementType.GENERAL_ANNOUNCEMENT:
        return AnnouncementModel(
            subtitle: _viewModel.subtitleController.text,
            title: _viewModel.titleController.text,
            deadline: _viewModel.selectedDateTime);

      case AnnouncementType.CLASS_ANNOUNCEMENT:
        return AnnouncementModel(
            subtitle: _viewModel.subtitleController.text,
            title: _viewModel.titleController.text,
            deadline: _viewModel.selectedDateTime,
            studentClass: _viewModel.studentClassController.text);
      case AnnouncementType.PRIVATE_ANNOUNCEMENT:
        return AnnouncementModel(
            subtitle: _viewModel.subtitleController.text,
            title: _viewModel.titleController.text,
            deadline: _viewModel.selectedDateTime,
            studentNumber: int.parse(_viewModel.studentNumberController.text));
    }
  }

  AnnouncementModel formsToModel() {
    return AnnouncementModel(
        subtitle: _viewModel.subtitleController.text,
        title: _viewModel.titleController.text,
        deadline: _viewModel.selectedDateTime,
        studentClass: _viewModel.studentClassController.text,
        studentNumber: _viewModel.studentNumberController.text.isNotEmpty
            ? int.parse(_viewModel.studentNumberController.text)
            : null);
  }

  SizedBox editButton() =>
      const SizedBox(width: 35, child: Icon(Icons.edit, color: Colors.green));

  Container defaultCreateButton(BuildContext context) {
    return Container(
        height: DefaultResponsiveSizes.defaultResponsiveSizes * 2,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(width: 10),
            Text("Duyuru Ekle", style: TextStyle(color: UIColors.bgColor)),
          ],
        )));
  }

  Observer pickDate() {
    return Observer(
      builder: (context) {
        return TextButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: dateTime,
              firstDate: dateTime,
              lastDate: DateTime(3000, 9, 7, 16),
              currentDate: dateTime,
            ).then((newDateTime) {
              _viewModel.changeDateTimerPickerData(newDateTime);
            });
          },
          child: Text(
            "Tarih : ${_viewModel.selectedDateTime.day}/${_viewModel.selectedDateTime.month}/${_viewModel.selectedDateTime.year}",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        );
      },
    );
  }
}

class AnnouncementFormField extends StatelessWidget {
  const AnnouncementFormField({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
            height: DefaultResponsiveSizes.defaultResponsiveSizes * 2),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: text),
          validator: (value) {
            if (value == "") {
              return "Bu alan zorunlu";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
