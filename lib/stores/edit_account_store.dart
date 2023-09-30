import 'package:front_project/repositories/user_repository.dart';
import 'package:front_project/stores/user_manager_store.dart';
import 'package:front_project/utils/extension.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/User.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'edit_account_store.g.dart';

class EditAccountStore = _EditAccountStore with _$EditAccountStore;

abstract class _EditAccountStore with Store {
  _EditAccountStore(){
    user = userManagerStore.user!;//Copia os dados do usuário para user
    name = user.name;
    email = user.email;
  }

  late User user;//Vamos copiar os dados do usuário para esta variável, para não modificar o usuário do UserManagerStore

  UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  /*
  VARIAVEIS OBSERVAVEIS PARA UTILIZAR PARA EDITAR OS DADOS DO USUARIO
  */

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

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  //Utilizado para receber a mensagem do erro do Parse
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
  bool get isFormValid => nameValid && emailValid;

  @computed
  dynamic get sendPressed => (isFormValid && !loading) ? _editData : null;

  Future<bool> _editData() async{
    setLoading(true);
    setError(null);

    user.name = name;
    user.email = email;

    try{
      await UserRepository().save(user);//Manda salvar no banco
      userManagerStore.setUser(user);//Se não der erro, então atualizamos os usuário do Singleton UserManagerStore
      setLoading(false);
      return true;
    }catch(e){
      setError(e.toString());
    }

    setLoading(false);
    return false;
  }
}
