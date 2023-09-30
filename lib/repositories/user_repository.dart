import 'package:front_project/repositories/parse_errors.dart';
import 'package:front_project/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../models/User.dart';

class UserRepository {

  //CADASTRO
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserCpf, user.cpf);

    final response = await parseUser.signUp();

    if (response.success) {
      return User.fromParse(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  //LOGIN
  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return User.fromParse(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  //ATUALIZAR/SALVAR
  Future<void> save(User user) async {
    final ParseUser parseUser = await ParseUser.currentUser();//Obtem o usuário atual é armazenado localmente

    //Atualiza os novos dados
    if (parseUser != null) {
      parseUser.set<String>(keyUserName, user.name);
      parseUser.set<String>(keyUserEmail, user.email);

      final response = await parseUser.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    }
  }

  //SAIR
  Future<void> logout() async {
    final ParseUser currentUser = await ParseUser.currentUser();//Obtem o usuário atual é armazenado localmente
    await currentUser.logout();
  }

  //USUÁRIO ATUAL
  Future<User?> currentUser() async {
    final parseUser = await ParseUser.currentUser();//Obtem o usuário atual é armazenado localmente
    if (parseUser != null) {
      final response = await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);//Se houver um usuário logado, tenta obter os dados desse usuário do servidor Parse.
      //Verifica se a sessão do usuário já não está expirada (por exemplo, se já não foi desconectado por que esta logado a muitos dias)
      if (response!.success) {
        return User.fromParse(response.result);
      } else {
        //Se a sessão do usuário não for mais valida fazemos o logout deste usuário removendo da memória
        await parseUser.logout();
      }
    }
    return null;
  }
}
