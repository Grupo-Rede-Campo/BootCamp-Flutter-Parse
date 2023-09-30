import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../repositories/table_keys.dart';

class User{
  User({
    this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.password,
    this.createdAt,
  });

  String? id;
  late String name;
  late String email;
  late String cpf;
  late String password;
  DateTime? createdAt;

  //MAPEIA UM ParseUser em um objeto User
  User.fromParse(ParseUser parseUser){
    id = parseUser.objectId!;
    name = parseUser.get<String>(keyUserName)!;
    email = parseUser.get<String>(keyUserEmail)!;
    cpf = parseUser.get<String>(keyUserCpf)!;
    createdAt = parseUser.createdAt;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, cpf: $cpf}';
  }
}