import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_project/components/card_screens.dart';
import 'package:front_project/models/Task.dart';
import 'package:front_project/stores/home_store.dart';
import 'package:front_project/stores/tasks_store.dart';
import 'package:get_it/get_it.dart';

import '../../components/dialogs.dart';
import '../../constants.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key, this.task}) : super(key: key);

  final Task? task;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TasksStore tasksStore;
  late bool editing;

  @override
  void initState() {
    super.initState();
    editing = widget.task != null;
    tasksStore = TasksStore(widget.task ?? Task(description: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: verde_escuro,
      body: Observer(
        builder: (context) => SafeArea(
          child: CardPageAll(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  //SAIR DO APLICATIVO
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.red,
                        ),
                        Text(
                          'Voltar',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //TEXT DESCRIÇÃO
                  const Text(
                    'Descrição',
                    style: TextStyle(
                      color: verde_escuro,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //
                  const SizedBox(height: 5),

                  //FORMS DESCRIÇÃO
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      initialValue: tasksStore.description,
                      onChanged: tasksStore.setDescription,
                      maxLines: 20,
                      decoration: InputDecoration(
                        errorText: tasksStore.descriptionError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //BOTÃO FINALIZAR
                  GestureDetector(
                    onTap: tasksStore.invalidSendPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: tasksStore.sendPressed != null
                            ? () async {
                                if (await tasksStore.sendPressed()) {
                                  GetIt.I<HomeStore>().getTaskList(); //atualiza a lista de task, na HomePage
                                  dialogSucess(
                                    context: context,
                                    txt: editing ? 'Task atualizada com sucesso!' : 'Task salva com sucesso!',
                                    onClose: (){
                                      Navigator.of(context).pop();
                                    }
                                  );
                                } else {
                                  dialogError(context: context, txt: tasksStore.error!);
                                }
                              }
                            : null,
                        child: Center(
                          child: Text(
                            editing ? 'Editar' : 'Cadastrar',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //BOTAO DELETAR SOMENTE SE A TAREFA EXISTIR
                  if (editing) ...{
                    const SizedBox(height: 10),
                    //BOTAO
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () async {
                          if (await tasksStore.deletePressed()) {
                            GetIt.I<HomeStore>().getTaskList(); //atualiza a lista de task, na HomePage
                            dialogSucess(
                                context: context,
                                txt: 'Task removida com sucesso!',
                                onClose: (){
                                  Navigator.of(context).pop();
                                }
                            );
                          } else {
                            dialogError(context: context, txt: tasksStore.error!);
                          }
                        },
                        child: const Center(
                          child: Text(
                            'Excluir',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
