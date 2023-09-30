import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_project/components/card_screens.dart';
import 'package:front_project/components/dialogs.dart';
import 'package:front_project/constants.dart';
import 'package:front_project/stores/edit_account_store.dart';
import '../../components/text_form_field.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({Key? key}) : super(key: key);

  final EditAccountStore editAccountStore = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: verde_escuro,
        body: Observer(
          builder: (context) => SafeArea(
              child: CardPageAll(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //VOLTAR A PÁGINA INICIAL
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

                //
                const SizedBox(height: 10),

                //Nome
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFormField(
                    onChanged: editAccountStore.setName,
                    initialvalue: editAccountStore.name,
                    error: editAccountStore.nameError,
                    icon: Icons.person,
                    text_label: 'Nome',
                  ),
                ),

                //Email
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFormField(
                    onChanged: editAccountStore.setEmail,
                    initialvalue: editAccountStore.email,
                    error: editAccountStore.emailError,
                    icon: Icons.email,
                    text_label: 'E-mail',
                  ),
                ),

                //BOTAO EDITAR DADOS DO USUARIO
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: GestureDetector(
                    onTap: editAccountStore.invalidSendPressed,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: laranja,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: editAccountStore.sendPressed != null ? () async {
                        if (await editAccountStore.sendPressed()) {
                          dialogSucess(context: context, txt: 'Dados atualizados com sucesso!');
                        }  else {
                          dialogError(context: context, txt: editAccountStore.error!);
                        }
                      } : null,
                      child: Center(
                        child: editAccountStore.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Salvar',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
