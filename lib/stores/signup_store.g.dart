// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on _SignupStore, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid => (_$nameValidComputed ??=
          Computed<bool>(() => super.nameValid, name: '_SignupStore.nameValid'))
      .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignupStore.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_SignupStore.passwordValid'))
          .value;
  Computed<bool>? _$isSignUpValidComputed;

  @override
  bool get isSignUpValid =>
      (_$isSignUpValidComputed ??= Computed<bool>(() => super.isSignUpValid,
              name: '_SignupStore.isSignUpValid'))
          .value;
  Computed<dynamic>? _$signUpPressedComputed;

  @override
  dynamic get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<dynamic>(() => super.signUpPressed,
              name: '_SignupStore.signUpPressed'))
          .value;

  late final _$nameAtom = Atom(name: '_SignupStore.name', context: context);

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

  late final _$emailAtom = Atom(name: '_SignupStore.email', context: context);

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

  late final _$cpfAtom = Atom(name: '_SignupStore.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignupStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$obscurePasswordAtom =
      Atom(name: '_SignupStore.obscurePassword', context: context);

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SignupStore.loading', context: context);

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

  late final _$errorAtom = Atom(name: '_SignupStore.error', context: context);

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
      Atom(name: '_SignupStore.showErrors', context: context);

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

  late final _$_SignupStoreActionController =
      ActionController(name: '_SignupStore', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo =
        _$_SignupStoreActionController.startAction(name: '_SignupStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscurePassword() {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setObscurePassword');
    try {
      return super.setObscurePassword();
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
cpf: ${cpf},
password: ${password},
obscurePassword: ${obscurePassword},
loading: ${loading},
error: ${error},
showErrors: ${showErrors},
nameValid: ${nameValid},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
isSignUpValid: ${isSignUpValid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
