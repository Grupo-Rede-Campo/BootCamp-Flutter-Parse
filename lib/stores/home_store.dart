import 'package:front_project/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/Task.dart';
import '../repositories/task_repository.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore(){
    reaction((_) => userManagerStore.isLoggedIn, (_) {
      getTaskList();
    });
  }

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  ObservableList<Task> taskList = ObservableList();//Lista das tarefas

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @computed
  bool get showProgress => loading && taskList.isEmpty;

  @action
  Future<void> getTaskList() async {//Carrega a lista de tarefas
    setLoading(true);

    try {
      taskList.clear();
      final tasks = await TaskRepository().getAllTasks();
      taskList.addAll(tasks);
      setError(null);
    } catch (e) {
      setError(e.toString());
    }

    setLoading(false);
  }
}