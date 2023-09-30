
import 'package:front_project/stores/user_manager_store.dart';
import 'package:front_project/utils/extension.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/User.dart';
import '../repositories/user_repository.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  //NAME
  @observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.isNameValid();
  String? get nameError {
    if (!showErrors || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome inválido';
    }
  }

  //EMAIL
  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String? get emailError{
    if (!showErrors || emailValid) {
      return null;
    } else {
      return 'Email invalido';
    }
  }

  //CPF
  @observable
  String cpf = '';

  @action
  void setCpf(String value) => cpf = value;

  bool get cpfValid => cpf != null && cpf.length == 14;

  String? get cpfError {
    if (!showErrors || cpfValid) {
      return null;
    } else if (cpf.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'CPF inválido';
    }
  }

  //PASSWORD
  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;
  String? get passwordError {
    if (!showErrors || passwordValid) {
      return null;
    } else {
      return 'A senha deve ter no minimo 6 digitos';
    }
  }

  @observable
  bool obscurePassword = true;

  @action
  void setObscurePassword() => obscurePassword = !obscurePassword;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  //Utilizado para receber a mensagem do erro do Parse no momento do login
  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool showErrors = false;

  //Quando clicar no botão "Entrar" sem os dados estarem validos, exibir os erros
  @action
  void invalidSendPressed() => showErrors = true;

  @computed
  bool get isSignUpValid => nameValid && emailValid && passwordValid && cpfValid;

  @computed
  dynamic get signUpPressed => (isSignUpValid && !loading) ? _signUp : null;


  Future<void> _signUp() async {
    setLoading(true);
    setError(null);

    final user = User(name: name, email: email, cpf: cpf, password: password);

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      setError(e.toString());
    }

    setLoading(false);
  }
}