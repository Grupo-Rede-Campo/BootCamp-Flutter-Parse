import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_project/constants.dart';
import 'package:front_project/stores/signup_store.dart';
import 'package:mobx/mobx.dart';

import '../../components/dialogs.dart';
import '../../components/text_form_field.dart';

class SignUpScreen extends StatefulWidget {

  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupStore signUpStore = SignupStore();
  late ReactionDisposer disposer;

  @override
  void initState() {
    disposer = reaction((_) => signUpStore.error, (erro) {
      if (erro != null) {
        dialogError(
          context: context,
          txt: signUpStore.error.toString(),
          onClose: () {
            signUpStore.setError(null);
          },
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: verde_escuro,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Observer(
            builder: (_) {
              return Stack(
                children: [
                  Column(
                    children: [
                      //TEXTO
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Cadastro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      //FORMULARIO
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 40),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(45)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //Nome
                            CustomFormField(
                              onChanged: signUpStore.setName,
                              initialvalue: signUpStore.name,
                              error: signUpStore.nameError,
                              icon: Icons.person,
                              text_label: 'Nome',
                            ),

                            //Email
                            CustomFormField(
                              onChanged: signUpStore.setEmail,
                              initialvalue: signUpStore.email,
                              error: signUpStore.emailError,
                              icon: Icons.email,
                              text_label: 'E-mail',
                            ),

                            //Senha
                            CustomFormField(
                              set_visible: signUpStore.setObscurePassword,
                              visible: signUpStore.obscurePassword,
                              onChanged: signUpStore.setPassword,
                              initialvalue: signUpStore.password,
                              error: signUpStore.passwordError,
                              icon: Icons.lock,
                              text_label: 'Senha',
                              secret: true,
                            ),

                            //CPF
                            CustomFormField(
                              typeKeyboard: TextInputType.number,
                              onChanged: signUpStore.setCpf,
                              initialvalue: signUpStore.cpf,
                              error: signUpStore.cpfError,
                              icon: Icons.file_copy,
                              text_label: 'CPF',
                              input: [
                                FilteringTextInputFormatter.digitsOnly,
                                //Utilizando a biblioteca Brasil fields para configurar o formato do que deve ser escrito.
                                CpfInputFormatter()
                              ],
                            ),

                            //Botao cadastrar
                            SizedBox(
                              height: 50,
                              child: GestureDetector(
                                onTap: signUpStore.invalidSendPressed,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: signUpStore.signUpPressed,
              /*signUpStore.isRegisterValid ==
                                              false ||
                                          signUpStore.loading == true
                                      ? null
                                      : () async {
                                          if (await signUpStore.RegisterUser(
                                              context)) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          }
                                        },*/
                                  child: signUpStore.loading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          'Finalizar',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: SafeArea(
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
