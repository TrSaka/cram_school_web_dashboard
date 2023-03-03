import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/base/view/base_view.dart';

import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';
import 'package:flutter_school/models/announcement_model.dart';

import '../../../../widgets/home/create_announcement_popup_widget.dart';
import '../../../../widgets/home/get_announcement_widget.dart';
import '../../../view_model/home/screens/announcement_view_model.dart';

class AnnouncementView extends ConsumerStatefulWidget {
  const AnnouncementView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnnouncementViewState();
}

class _AnnouncementViewState extends ConsumerState<AnnouncementView>
    with TickerProviderStateMixin {
  AnnouncementViewModel _viewModel = AnnouncementViewModel();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: _viewModel,
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: UIColors.primaryColor,
                  ),
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    textTab("Genel Duyuru"),
                    textTab("Sınıfa Özel"),
                    textTab("Öğrenciye Özel"),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 25),
              CreateAnnouncementWidget(
                _viewModel.announcementTypes[_tabController.index],
                false, //this button for create new object so it is false
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    getAnnouncementListWidget(),
                    getAnnouncementListWidget(),
                    getAnnouncementListWidget(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      onModelReady: (model) {
        _viewModel = model;
      },
    );
  }

  Tab textTab(String text) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  GetAnnouncementWidget getAnnouncementListWidget() {
    return GetAnnouncementWidget(
        ref: ref, viewModel: _viewModel, tabController: _tabController);
  }
}
