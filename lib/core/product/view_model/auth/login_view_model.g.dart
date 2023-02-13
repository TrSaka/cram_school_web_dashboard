// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
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

  late final _$rememberMeCheckBoxStateAtom = Atom(
      name: '_LoginViewModelBase.rememberMeCheckBoxState', context: context);

  @override
  bool get rememberMeCheckBoxState {
    _$rememberMeCheckBoxStateAtom.reportRead();
    return super.rememberMeCheckBoxState;
  }

  @override
  set rememberMeCheckBoxState(bool value) {
    _$rememberMeCheckBoxStateAtom
        .reportWrite(value, super.rememberMeCheckBoxState, () {
      super.rememberMeCheckBoxState = value;
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
  void changeRememberMeBoxState() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.changeRememberMeBoxState');
    try {
      return super.changeRememberMeBoxState();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lockState: ${lockState},
rememberMeCheckBoxState: ${rememberMeCheckBoxState}
    ''';
  }
}
