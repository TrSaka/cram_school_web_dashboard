import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/extensions/case_extension.dart';
import 'package:flutter_school/core/riverpod/search_field_riverpod.dart';
import 'package:flutter_school/core/widgets/global/circular_progess_widget.dart';
import '../../../models/announcement_model.dart';
import '../../product/view_model/home/screens/announcement_view_model.dart';
import '../../riverpod/firebase_riverpod.dart';
import 'announcement_card_widget.dart';

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
    ref.listen(searchBarTextProvider, (oldText, newText) {
      oldText != newText;
    });

    String searchedText = ref.watch(searchBarTextProvider.notifier).state;
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
              if (searchedText == "") {
                return AnnouncementCardWidget(
                  announcementModel: announcementModel,
                  viewModel: _viewModel,
                  tabController: _tabController,
                );
              } else if (announcementModel.title.toUpc
                      .contains(searchedText.toUpc) ||
                  announcementModel.subtitle.toUpc
                      .contains(searchedText.toUpc) ||
                  announcementModel.deadline.toUpc.contains(searchedText)) {
                return AnnouncementCardWidget(
                  announcementModel: announcementModel,
                  viewModel: _viewModel,
                  tabController: _tabController,
                );
              } else {
                return const SizedBox();
              }
            },
          );
        } else {
          return const CustomCircular();
        }
      },
    );
  }
}
