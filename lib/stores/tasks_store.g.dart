// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on _TasksStoreBase, Store {
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_TasksStoreBase.descriptionValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_TasksStoreBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: '_TasksStoreBase.sendPressed'))
          .value;
  Computed<dynamic>? _$deletePressedComputed;

  @override
  dynamic get deletePressed =>
      (_$deletePressedComputed ??= Computed<dynamic>(() => super.deletePressed,
              name: '_TasksStoreBase.deletePressed'))
          .value;

  late final _$descriptionAtom =
      Atom(name: '_TasksStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_TasksStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_TasksStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_TasksStoreBase.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$_saveTaskAsyncAction =
      AsyncAction('_TasksStoreBase._saveTask', context: context);

  @override
  Future<bool> _saveTask() {
    return _$_saveTaskAsyncAction.run(() => super._saveTask());
  }

  late final _$_deleteAsyncAction =
      AsyncAction('_TasksStoreBase._delete', context: context);

  @override
  Future<bool> _delete() {
    return _$_deleteAsyncAction.run(() => super._delete());
  }

  late final _$_TasksStoreBaseActionController =
      ActionController(name: '_TasksStoreBase', context: context);

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction(
        name: '_TasksStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction(
        name: '_TasksStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction(
        name: '_TasksStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction(
        name: '_TasksStoreBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
loading: ${loading},
error: ${error},
showErrors: ${showErrors},
descriptionValid: ${descriptionValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed},
deletePressed: ${deletePressed}
    ''';
  }
}
