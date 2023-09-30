import 'package:front_project/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Task {
  Task({this.id, required this.description, this.isActived = true});

  String? id;
  late String description;
  late bool isActived;
  DateTime? createdAt;
  DateTime? updatedAt;

  //MAPEIA UM ParseObject em um objeto Task
  Task.fromParse(ParseObject parseObject){
    id = parseObject.objectId;
    description = parseObject.get<String>(keyTaskDescription)!;
    isActived = parseObject.get<bool>(keyTaskIsActived)!;
    createdAt = parseObject.createdAt;
    updatedAt = parseObject.updatedAt;
  }

  @override
  String toString() {
    return 'Tasks{id: $id, description: $description}';
  }
}
