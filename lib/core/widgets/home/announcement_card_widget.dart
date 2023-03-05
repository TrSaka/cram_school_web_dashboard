import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/widgets/home/create_announcement_popup_widget.dart';
import '../../../models/announcement_model.dart';
import '../../product/view_model/home/screens/announcement_view_model.dart';
import '../../riverpod/firebase_riverpod.dart';

class AnnouncementCardWidget extends ConsumerWidget {
  const AnnouncementCardWidget({
    Key? key,
    required this.announcementModel,
    required AnnouncementViewModel viewModel,
    required TabController tabController,
  })  : _viewModel = viewModel,
        _tabController = tabController,
        super(key: key);

  final AnnouncementModel announcementModel;
  final AnnouncementViewModel _viewModel;
  final TabController _tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime currentDate = DateTime.now();
    DateTime announcementDate = announcementModel.deadline!;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ListTile(
        leading: const Icon(
          Icons.circle_notifications,
          color: Colors.blue,
        ),
        title: Text(announcementModel.title),
        subtitle: Text(announcementModel.subtitle),
        trailing: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 6,
            child: Row(
              children: [
                Text(
                  "${announcementDate.day} / ${announcementDate.month} / ${announcementDate.year}",
                  style: TextStyle(
                    color: announcementDate.day <=
                            currentDate
                                .day // kırmızı yapılacak eğer tarih geçmişse.
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                CreateEditAnnouncementWidget(
                    _tabController, true, announcementModel),
                IconButton(
                    onPressed: () async {
                      await ref.read(authProvider).deleteAnnouncement(
                            _viewModel.announcementTypes[_tabController.index],
                            announcementModel,
                          );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            )),
      ),
    );
  }
}
