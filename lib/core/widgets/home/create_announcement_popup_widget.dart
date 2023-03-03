import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/constants/enums/announcement_enum.dart';
import 'package:flutter_school/core/product/view_model/home/screens/announcement_view_model.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';
import 'package:flutter_school/core/utils/responsive/app_responsive_sizes.dart';
import 'package:flutter_school/core/widgets/home/save_button.dart';

class CreateAnnouncementWidget extends ConsumerStatefulWidget {
  const CreateAnnouncementWidget(this.typeOfAnnouncement, this.editTheme, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateAnnouncementWidgetState();

  final AnnouncementType typeOfAnnouncement;
  final bool editTheme;
}

class _CreateAnnouncementWidgetState
    extends ConsumerState<CreateAnnouncementWidget> {
  final AnnouncementViewModel _viewModel = AnnouncementViewModel();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
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
        )),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Duyuru Ekle"),
              content: SizedBox(
                height: 600,
                width: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height:
                            DefaultResponsiveSizes.defaultResponsiveSizes * 2),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Başlık",
                      ),
                    ),
                    const SizedBox(
                        height: DefaultResponsiveSizes.defaultResponsiveSizes),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Açıklama",
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                pickDate(),
                TextButton(
                  onPressed: () {
                    //funcs
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
