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

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //EMAIL
  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();
  String? get emailError{
    if (!showErros || emailValid) {
      return null;
    } else {
      return 'Email invalido';
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
    if (!showErros || passwordValid) {
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
  bool showErros = false;

  //Quando clicar no botão "Entrar" sem os dados estarem validos, exibir os erros
  @action
  void invalidSendPressed() => showErros = true;

  //VERIFICAÇÃO DE TODOS CAMPOS CORRETOS
  @computed
  bool get isLoginValid => emailValid && passwordValid;

  @computed
  //se os dados de login e senha são validos e não estiver carregando, ativa o botão "Entrar". Este quando clicado chama a funcao _login
  dynamic get loginPressed => (isLoginValid && !loading) ? _login : null;

  @action
  Future<void> _login() async{
    setLoading(true);
    setError(null);

    try {
      //tenta fazer o login se for sucesso o user vai contar todos os dados do usuario
      final User user = await UserRepository().loginWithEmail(email, password);
      //faz o usuario ficar disponivel para ser acessado de qualquer local do app
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      setError(e.toString());
    }
    setLoading(false);
  }
}
