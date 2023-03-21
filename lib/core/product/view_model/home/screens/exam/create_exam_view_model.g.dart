// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_exam_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateExamViewModel on _CreateExamViewModelBase, Store {
  late final _$dropDownCategoryValueAtom = Atom(
      name: '_CreateExamViewModelBase.dropDownCategoryValue', context: context);

  @override
  Object? get dropDownCategoryValue {
    _$dropDownCategoryValueAtom.reportRead();
    return super.dropDownCategoryValue;
  }

  @override
  set dropDownCategoryValue(Object? value) {
    _$dropDownCategoryValueAtom.reportWrite(value, super.dropDownCategoryValue,
        () {
      super.dropDownCategoryValue = value;
    });
  }

  late final _$dropDownBookCountValueAtom = Atom(
      name: '_CreateExamViewModelBase.dropDownBookCountValue',
      context: context);

  @override
  Object? get dropDownBookCountValue {
    _$dropDownBookCountValueAtom.reportRead();
    return super.dropDownBookCountValue;
  }

  @override
  set dropDownBookCountValue(Object? value) {
    _$dropDownBookCountValueAtom
        .reportWrite(value, super.dropDownBookCountValue, () {
      super.dropDownBookCountValue = value;
    });
  }

  late final _$selectedDateTimeAtom =
      Atom(name: '_CreateExamViewModelBase.selectedDateTime', context: context);

  @override
  DateTime? get selectedDateTime {
    _$selectedDateTimeAtom.reportRead();
    return super.selectedDateTime;
  }

  @override
  set selectedDateTime(DateTime? value) {
    _$selectedDateTimeAtom.reportWrite(value, super.selectedDateTime, () {
      super.selectedDateTime = value;
    });
  }

  late final _$_CreateExamViewModelBaseActionController =
      ActionController(name: '_CreateExamViewModelBase', context: context);

  @override
  void changeSelectedDateTime(DateTime time) {
    final _$actionInfo = _$_CreateExamViewModelBaseActionController.startAction(
        name: '_CreateExamViewModelBase.changeSelectedDateTime');
    try {
      return super.changeSelectedDateTime(time);
    } finally {
      _$_CreateExamViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDropDownValue(bool isDropDownCount, String? selected) {
    final _$actionInfo = _$_CreateExamViewModelBaseActionController.startAction(
        name: '_CreateExamViewModelBase.changeDropDownValue');
    try {
      return super.changeDropDownValue(isDropDownCount, selected);
    } finally {
      _$_CreateExamViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dropDownCategoryValue: ${dropDownCategoryValue},
dropDownBookCountValue: ${dropDownBookCountValue},
selectedDateTime: ${selectedDateTime}
    ''';
  }
}
