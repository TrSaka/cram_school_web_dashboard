import 'package:mobx/mobx.dart';
part 'create_exam_view_model.g.dart';

class CreateExamViewModel = _CreateExamViewModelBase with _$CreateExamViewModel;

abstract class _CreateExamViewModelBase with Store {
  final dateTime = DateTime.now();

  final lastTime = DateTime(DateTime.now().year + 1);

  @observable
  Object? dropDownCategoryValue;
  @observable
  Object? dropDownBookCountValue;

  @observable
  DateTime? selectedDateTime;

  @action
  void changeSelectedDateTime(DateTime time) {
    selectedDateTime = time;
  }

  @action
  void changeDropDownValue(bool isDropDownCount,String? selected) {
    if (selected is String) {
      isDropDownCount == false ? dropDownCategoryValue = selected : dropDownBookCountValue = selected;
    } else {
      dropDownCategoryValue = "Sınav Türü";
    }
  }
}
