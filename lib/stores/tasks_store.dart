import 'package:front_project/models/Task.dart';
import 'package:mobx/mobx.dart';

import '../repositories/task_repository.dart';

part 'tasks_store.g.dart';

class TasksStore = _TasksStoreBase with _$TasksStore;

abstract class _TasksStoreBase with Store {

  _TasksStoreBase(this.task){
    description = task.description ?? '';
  }

  late Task task;

  //DESCRIÇÃO
  @observable
  String description = "";

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description != null && description.length > 5;
  String? get descriptionError {
    if (!showErrors || descriptionValid){
      return null;
    } else if (description.isEmpty) {
      return 'Informe uma descrição';
    } else {
      return 'A descrição deve ter no mínimo 6 caracteres';
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
  bool get isFormValid => descriptionValid;

  @computed
  dynamic get sendPressed => (isFormValid && !loading) ? _saveTask : null;

  @computed
  dynamic get deletePressed => _delete;

  @action
  Future<bool> _saveTask() async{
    setLoading(true);
    setError(null);

    task.description = description;

    try{
      await TaskRepository().save(task);
      setLoading(false);
      return true;
    }catch(e){
      setError(e.toString());
    }

    setLoading(false);
    return false;
  }

  @action
  Future<bool> _delete() async{
    setLoading(true);
    setError(null);

    try{
      await TaskRepository().delete(task);
      setLoading(false);
      return true;
    }catch(e){
      setError(e.toString());
    }

    setLoading(false);
    return false;
  }
}
