import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/base/view/base_view.dart';
import 'package:flutter_school/core/extensions/case_extension.dart';
import 'package:flutter_school/core/product/view_model/home/screens/student_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/riverpod/search_field_riverpod.dart';
import 'package:flutter_school/core/utils/responsive/app_responsive_sizes.dart';
import '../../../../../models/student_model.dart';
import '../../../../widgets/home/edit_add_popup_widget.dart';
import '../../../../widgets/home/student_card.dart';

class StudentsView extends ConsumerStatefulWidget {
  const StudentsView({super.key});

  @override
  ConsumerState<StudentsView> createState() => _StudentsViewState();
}

int selectedIndex = -1;

class _StudentsViewState extends ConsumerState<StudentsView> {
  StudentViewModel _viewModel = StudentViewModel();
  @override
  Widget build(BuildContext context) {
    ref.listen(searchBarTextProvider, (previous, next) {
      if (previous != next) {
        //if someone type into search bar
        //our previous and next can not be same
        setState(() {});
        //refresh it
      }
    });
    String searchBarText = ref.watch(searchBarTextProvider.notifier).state;
    return BaseView(
      viewModel: _viewModel,
      onPageBuilder: (context, value) {
        return Scaffold(
          
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text("Öğrencilerim"), //app bar title
            actions: [
              StudentAddPopUpButtonWidget(false, null),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      DefaultResponsiveSizes.defaultResponsiveSizes * 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10),
                      Expanded(
                        child: FutureBuilder(
                          future: ref
                              .watch(authProvider)
                              .getStudentsOrStudent(null, false),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox();
                            }
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const SizedBox();
                                  }
                                  StudentModel singleUser =
                                      StudentModel.fromMap(
                                          snapshot.data[index]);

                                  if (singleUser.name.toUpc
                                          .contains(searchBarText.toUpc) ||
                                      singleUser.userNumber!.toUpc
                                          .contains(searchBarText.toUpc) ||
                                      singleUser.lastName.toUpc
                                          .contains(searchBarText.toUpc)) {
                                    return StudentCard(
                                      userData: StudentModel.fromMap(
                                          snapshot.data[index]),
                                      index: index,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              );
                            } else {
                              return const Text("Kayıtlı Öğrenci Yok");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onModelReady: (model) {
        _viewModel = model;
      },
    );
  }
}
