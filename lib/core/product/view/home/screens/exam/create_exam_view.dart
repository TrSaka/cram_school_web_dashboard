import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/base/view/base_view.dart';
import '../../../../../utils/color/scheme_colors.dart';
import '../../../../../widgets/global/tab_bar_widget.dart';
import '../../../../view_model/home/screens/exam/create_exam_view_model.dart';

class CreateExamView extends ConsumerStatefulWidget {
  const CreateExamView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateExamViewState();
}

class _CreateExamViewState extends ConsumerState<CreateExamView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  CreateExamViewModel _viewModel = CreateExamViewModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: _viewModel,
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: AppBar(
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
                    textTab("Sınav Ayarları"),
                    textTab("Soru Sayıları"),
                    textTab("Cevap Anahtarı"),
                    textTab("Tab 5"),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CreateExamForms(text: "Sınav Adı"),
                              const SizedBox(width: 20),
                              dropDownButtonCategory(), //AYT TYT LGS options available
                            ],
                          ),
                          const SizedBox(height: 30),
                          datePicker(context),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Kitapçık Sayısı :",
                                style: TextStyle(fontSize: 18),
                              ),
                              dropDownButtonExamBookCount(),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                    Column(
                      children: const [
                        Text("2"),
                      ],
                    ),
                    Column(
                      children: const [
                        Text("3"),
                      ],
                    ),
                    Column(
                      children: const [
                        Text("4"),
                      ],
                    ),
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

  Observer datePicker(BuildContext context) {
    return Observer(builder: (_) {
      return TextButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: _viewModel.dateTime,
              firstDate: _viewModel.dateTime,
              lastDate: _viewModel.lastTime,
              initialDatePickerMode: DatePickerMode.day,
            ).then((selectedDate) => selectedDate != null
                ? _viewModel.changeSelectedDateTime(selectedDate)
                : null);
          },
          child: dateTimePicker());
    });
  }

  Container dateTimePicker() {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: UIColors.PRIMARY_COLOR),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          _viewModel.selectedDateTime == null
              ? "Sınav Tarihi"
              : "Tarih : ${_viewModel.selectedDateTime!.day}/${_viewModel.selectedDateTime!.month}/${_viewModel.selectedDateTime!.year}",
          style: const TextStyle(color: UIColors.PRIMARY_COLOR, fontSize: 16),
        ),
      ),
    );
  }

  SizedBox dropDownButtonCategory() {
    return SizedBox(
        height: 50,
        width: 80,
        child: Observer(builder: (_) {
          return DropdownButton(
            value: _viewModel.dropDownCategoryValue,
            menuMaxHeight: 200,
            items: [
              menuItem("AYT"),
              menuItem("TYT"),
              menuItem("LGS"),
            ],
            onChanged: (value) =>
                _viewModel.changeDropDownValue(false, value.toString()),
          );
        }));
  }

  SizedBox dropDownButtonExamBookCount() {
    return SizedBox(
        height: 50,
        width: 80,
        child: Observer(builder: (_) {
          return DropdownButton(
            value: _viewModel.dropDownBookCountValue,
            menuMaxHeight: 200,
            items: [
              menuItem("1"),
              menuItem("2"),
              menuItem("3"),
              menuItem("4"),
            ],
            onChanged: (value) =>
                _viewModel.changeDropDownValue(true, value.toString()),
          );
        }));
  }

  DropdownMenuItem<String> menuItem(String category) =>
      DropdownMenuItem(value: category, child: Text(category));
}

class CreateExamForms extends StatelessWidget {
  const CreateExamForms({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: null,
        decoration: InputDecoration(
            hintText: text,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
