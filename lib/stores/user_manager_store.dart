/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
*/
import 'package:flutter/material.dart';
import 'package:front_project/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/User.dart';


part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {

  //construtor
  _UserManagerStore() {
    _getCurrentUser();
  }

  @observable
  User? user;

  @action
  void setUser(User? value) => user = value;

  //retorna true se tiver um usuario logado senao false
  @computed
  bool get isLoggedIn => user != null;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  //funcao para peagar o usuario ja logado no app()
  Future<void> _getCurrentUser() async {
    setLoading(true);
    final user = await UserRepository().currentUser();
    setUser(user);
    setLoading(false);
  }

  //metodo para deslogar
  Future<void> logout() async {
    setLoading(true);
    await UserRepository().logout();
    setUser(null);
    setLoading(false);
  }
}
