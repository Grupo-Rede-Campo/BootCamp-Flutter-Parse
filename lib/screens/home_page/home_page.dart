import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_project/components/card_screens.dart';
import 'package:front_project/constants.dart';
import 'package:front_project/screens/edit_account/edit_account_screen.dart';
import 'package:front_project/screens/home_page/widgets/data_user.dart';
import 'package:front_project/screens/login/login_screen.dart';
import 'package:front_project/screens/task/task_screen.dart';
import 'package:front_project/stores/home_store.dart';
import 'package:get_it/get_it.dart';

import '../../stores/user_manager_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore homeStore = GetIt.I<HomeStore>();
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: verde_escuro,
      body: Observer(builder: (_) {
        return SafeArea(
          child: CardPageAll(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SAIR DO APLICATIVO
                TextButton(
                  onPressed: () async {
                    await userManagerStore.logout().then(
                          (value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                        );
                  },
                  child: userManagerStore.loading ? Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ) : Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.red,
                      ),
                      Text(
                        'Sair do aplicativo',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //DADOS DO USUÁRIO
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Suas informações',
                      style: TextStyle(
                        fontSize: 20,
                        color: verde_escuro,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                //NOME
                Card(
                  child: data_user(
                    data_name: 'NOME: ',
                    data: userManagerStore.user!.name,
                  ),
                ),
                //E-MAIL
                Card(
                  child: data_user(
                    data_name: 'E-MAIL: ',
                    data: userManagerStore.user!.email,
                  ),
                ),
                //CPF
                Card(
                  child: data_user(data_name: 'CPF: ', data: userManagerStore.user!.cpf),
                ),

                //
                const SizedBox(height: 10),

                //BOTAO EDITAR DADOS DO USUARIO
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: laranja,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountScreen()));
                    },
                    child: const Center(
                      child: Text(
                        'Editar Dados',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                //DIVISOR ENTRE O BOTAO E A TAREFAS
                const Divider(
                  thickness: 1,
                ),

                //TAREFAS
                const Center(
                  child: Text(
                    'Tarefas',
                    style: TextStyle(
                      fontSize: 20,
                      color: verde_escuro,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 3),

                //BOTAO ADICIONAR TAREFA
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TaskScreen(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Adicionar Tarefa',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                //
                const SizedBox(height: 10),

                //LISTA DE TAREFAS

                if (homeStore.error != null) ...[
                  Expanded(
                    child: Center(
                      child: Text(
                        '${homeStore.error}',
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                  ),
                ] else if (homeStore.showProgress) ...[
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ] else if (homeStore.taskList.isEmpty) ...[
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Nenhuma tarefa encontrada',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                  )
                ] else ...[
                  Expanded(
                    child: ListView.builder(
                      itemCount: homeStore.taskList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //NUMERO DA TAREFA
                                    Text(
                                      'Tarefa ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: laranja,
                                      ),
                                    ),
                                    //DESCRIÇÃO DA TAREFA
                                    Container(
                                      width: 250,
                                      child: Text(
                                        homeStore.taskList[index].description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: verde_escuro,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //BOTAO EDITAR
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TaskScreen(
                                              task: homeStore.taskList[index],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: verde_escuro,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      }),
    );
  }
}
