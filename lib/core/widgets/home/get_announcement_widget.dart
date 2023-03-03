import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/announcement_model.dart';
import '../../product/view_model/home/screens/announcement_view_model.dart';
import '../../riverpod/firebase_riverpod.dart';

class GetAnnouncementWidget extends ConsumerWidget {
  const GetAnnouncementWidget({
    Key? key,
    required this.ref,
    required AnnouncementViewModel viewModel,
    required TabController tabController,
  })  : _viewModel = viewModel,
        _tabController = tabController,
        super(key: key);

  final WidgetRef ref;
  final AnnouncementViewModel _viewModel;
  final TabController _tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref
          .read(authProvider)
          .getAnnouncements(_viewModel.announcementTypes[_tabController.index]),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              AnnouncementModel announcementModel = snapshot.data[index];
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: const Icon(
                    Icons.circle_notifications,
                    color: Colors.blue,
                  ),
                  title: Text(announcementModel.subtitle),
                  subtitle: Text(announcementModel.title),
                  trailing: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 6,
                      child: Row(
                        children: [
                          Text(announcementModel.deadline!.toString()),
                          const SizedBox(width: 20),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () async {
                                await ref.read(authProvider).deleteAnnouncement(
                                    _viewModel.announcementTypes[
                                        _tabController.index],
                                    announcementModel);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      )),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text("Data is null"));
        }
      },
    );
  }
}
