import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:front_project/constants.dart';
import 'package:front_project/screens/home_page/home_page.dart';
import 'package:front_project/screens/signup/signup_screen.dart';
import 'package:front_project/stores/home_store.dart';
import 'package:front_project/stores/login_store.dart';
import 'package:front_project/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../components/dialogs.dart';
import '../../components/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore loginStore = LoginStore();
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    disposer = autorun((_) async {
      if (userManagerStore.isLoggedIn) {
        _loginSucesso();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });

    disposer = reaction((_) => loginStore.error, (erro) {
      if (erro != null) {
        dialogError(
          context: context,
          txt: loginStore.error.toString(),
          onClose: () {
            loginStore.setError(null);
          },
        );
      }
    });
    FlutterNativeSplash.remove();
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
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: size.height,
          child: Observer(
            builder: (_) {
              return Column(
                children: [
                  //Design de cima + Imagem
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(redecampo_logo, height: 45),
                        const Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 25,
                            ),
                            children: [
                              TextSpan(
                                text: 'O sabor do campo em um',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' clique',
                                style: TextStyle(
                                  color: laranja,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Formulário
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
                        //Email
                        CustomFormField(
                          initialvalue: loginStore.email,
                          onChanged: loginStore.setEmail,
                          error: loginStore.emailError,
                          icon: Icons.email,
                          text_label: 'E-mail',
                        ),

                        //Senha
                        CustomFormField(
                          set_visible: loginStore.setObscurePassword,
                          visible: loginStore.obscurePassword,
                          initialvalue: loginStore.password,
                          onChanged: loginStore.setPassword,
                          error: loginStore.passwordError,
                          icon: Icons.lock,
                          text_label: 'Senha',
                          secret: true,
                        ),

                        //Botao entrar
                        SizedBox(
                          height: 50,
                          child: GestureDetector(
                            onTap: loginStore.invalidSendPressed,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: loginStore.loginPressed,
                              child: loginStore.loading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        //Botão esqueceu senha
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),

                        //Divisão
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text('Ou'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Criar Conta
                        SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.green,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                            },
                            child: const Text(
                              'Criar Conta',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  _loginSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Logado com sucesso!'),
        backgroundColor: Colors.grey.shade800,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
