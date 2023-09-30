// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditAccountStore on _EditAccountStore, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_EditAccountStore.nameValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_EditAccountStore.emailValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_EditAccountStore.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: '_EditAccountStore.sendPressed'))
          .value;

  late final _$nameAtom =
      Atom(name: '_EditAccountStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_EditAccountStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_EditAccountStore.loading', context: context);

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
      Atom(name: '_EditAccountStore.error', context: context);

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
      Atom(name: '_EditAccountStore.showErrors', context: context);

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

  late final _$_EditAccountStoreActionController =
      ActionController(name: '_EditAccountStore', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditAccountStoreActionController.startAction(
        name: '_EditAccountStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_EditAccountStoreActionController.startAction(
        name: '_EditAccountStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_EditAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_EditAccountStoreActionController.startAction(
        name: '_EditAccountStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_EditAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_EditAccountStoreActionController.startAction(
        name: '_EditAccountStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_EditAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_EditAccountStoreActionController.startAction(
        name: '_EditAccountStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_EditAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
loading: ${loading},
error: ${error},
showErrors: ${showErrors},
nameValid: ${nameValid},
emailValid: ${emailValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
