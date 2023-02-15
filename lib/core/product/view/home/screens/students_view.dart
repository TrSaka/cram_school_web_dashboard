import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/base/view/base_view.dart';
import 'package:flutter_school/core/product/view_model/home/screens/student_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import '../../../../widgets/home/student_add_widget.dart';
import '../../../../widgets/home/student_card.dart';

class StudentsView extends ConsumerStatefulWidget {
  const StudentsView({super.key});

  @override
  ConsumerState<StudentsView> createState() => _StudentsViewState();
}

int selectedIndex = -1;

class _StudentsViewState extends ConsumerState<StudentsView> {
  StudentViewModel viewModel = StudentViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text("Öğrencilerim"), //app bar title
            actions:  [
              StudentAddButtonWidget(),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                      child: FutureBuilder(
                        future:
                            ref.watch(authProvider).database.getStudents(1402),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          }
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return StudentCard(
                                  userData: snapshot.data[index],
                                );
                              },
                            );
                          } else {
                            return const Text("No Data");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      onModelReady: (model) {
        viewModel = model;
      },
    );
  }
}
