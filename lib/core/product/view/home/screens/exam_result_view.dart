import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/base/view/base_view.dart';
import 'package:flutter_school/core/product/view_model/home/exam_result_view_model.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/core/riverpod/search_field_riverpod.dart';
import 'package:flutter_school/core/utils/responsive/app_responsive_sizes.dart';
import 'package:flutter_school/core/widgets/global/circular_progess_widget.dart';
import 'package:flutter_school/models/student_model.dart';

class ExamResultView extends ConsumerStatefulWidget {
  const ExamResultView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExamResultViewState();
}

class _ExamResultViewState extends ConsumerState<ExamResultView> {
  ExamResultViewModel _viewModel = ExamResultViewModel();
  TextEditingController controller = TextEditingController();

  bool sort = true;

  List<StudentModel> filterData = [];
  List filteredData = [];

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData.sort((a, b) => a.name.compareTo(b.name));
      } else {
        filterData.sort((a, b) => b.name.compareTo(a.name));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(searchBarTextProvider, (previous, next) {
      if (previous != next) {}
    });

    return BaseView(
      viewModel: _viewModel,
      onModelReady: (model) async {
        _viewModel = model;
      },
      onPageBuilder: (context, value) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Öğrenci Notları"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: DefaultResponsiveSizes.defaultResponsiveSizes * 2),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.file_upload_outlined)),
                )
              ],
            ),
            body: FutureBuilder(
                future:
                    ref.read(authProvider).getStudentsOrStudent(null, false),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomCircular();
                  }
                  if (snapshot.hasData) {
                    filterData = snapshot.data;
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: PaginatedDataTable(
                                sortColumnIndex: 0,
                                sortAscending: sort,
                                source: RowSource(
                                  myData: filterData,
                                  count: filterData.length,
                                ),
                                rowsPerPage: 10,
                                columnSpacing: 10,
                                columns: [
                                  dataColumn("İsim / Soy İsim"),
                                  dataColumn("Okul Numarası"),
                                  dataColumn("Son Sınav Puanı"),
                                  dataColumn(""),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }));
      },
    );
  }

  DataColumn dataColumn(String text) {
    return DataColumn(
        label: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
          });
          onsortColum(columnIndex, ascending);
        });
  }
}

class RowSource extends DataTableSource {
  List<StudentModel> myData;
  final int count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData[index]);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(StudentModel data) {
  return DataRow(
    cells: [
      DataCell(Text("${data.name} ${data.lastName}")),
      DataCell(Text(data.userNumber.toString())),
      DataCell(Text(
          data.exams.toString() == "null" ? "0,0000" : data.exams.toString())),
      DataCell(const Icon(Icons.add, color: Colors.green), onTap: () {})
    ],
  );
}
