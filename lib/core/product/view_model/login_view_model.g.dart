// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$userCountAtom =
      Atom(name: '_LoginViewModelBase.userCount', context: context);

  @override
  int get userCount {
    _$userCountAtom.reportRead();
    return super.userCount;
  }

  @override
  set userCount(int value) {
    _$userCountAtom.reportWrite(value, super.userCount, () {
      super.userCount = value;
    });
  }

  late final _$lockStateAtom =
      Atom(name: '_LoginViewModelBase.lockState', context: context);

  @override
  bool get lockState {
    _$lockStateAtom.reportRead();
    return super.lockState;
  }

  @override
  set lockState(bool value) {
    _$lockStateAtom.reportWrite(value, super.lockState, () {
      super.lockState = value;
    });
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void changeLockState() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.changeLockState');
    try {
      return super.changeLockState();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userCount: ${userCount},
lockState: ${lockState}
    ''';
  }
}