import 'package:front_project/models/Task.dart';
import 'package:front_project/repositories/parse_errors.dart';
import 'package:front_project/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class TaskRepository {
  Future<void> save(Task task) async {
    try {
      //Obtemos o usuário atual  armazenado localmente
      final parseUser = await ParseUser.currentUser() as ParseUser;

      final taskObject = ParseObject(keyTaskTable); //Cria uma nova instância de ParseObject indicando a tabela

      //Definindo as ACL - permissões deste objeto
      final parseAcl = ParseACL(owner: parseUser);
      parseAcl.setPublicReadAccess(allowed: true); //todos podem ler
      parseAcl.setPublicWriteAccess(allowed: false); //O único usuário que pode gravar objetos governados por esta ACL é o proprietário.
      taskObject.setACL(parseAcl);

      //definindo os campos
      if (task.id != null) taskObject.objectId = task.id; //se a task estiver sendo editada
      taskObject.set<String>(keyTaskDescription, task.description);
      taskObject.set<bool>(keyTaskIsActived, task.isActived);

      //Vinculando o usuário - Relacionamento ManyToOne - Muitas tasks para cada usuário
      taskObject.set<ParseUser>(keyTaskOwner, parseUser); //cria um ponteiro
      //taskObject.set(keyTaskOwner, parseUser.toPointer());//cria um ponteiro
      //taskObject.set<String>(keyTaskOwner, parseUser.objectId!);//Salva somente o id

      final response = await taskObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha ao salvar tarefa ${e.toString()}');
    }
  }

  Future<List<Task>> getAllTasks() async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyTaskTable));

    //Obtemos o usuário atual  armazenado localmente
    final parseUser = await ParseUser.currentUser() as ParseUser;

    queryBuilder.whereEqualTo(keyTaskOwner, parseUser.toPointer());
    queryBuilder.whereEqualTo(keyTaskIsActived, true);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((task) => Task.fromParse(task)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> delete(Task task) async {
    //Pegamos a referência do objeto que esta no banco
    final parseObject = ParseObject(keyTaskTable)..set(keyTaskId, task.id);
    //Mudamos o status para deletado
    parseObject.set(keyTaskIsActived, false);

    //Mandamos salvar e aguardamos a resposta
    final response = await parseObject.save();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
