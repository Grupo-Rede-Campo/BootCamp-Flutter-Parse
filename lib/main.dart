import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:front_project/screens/login/login_screen.dart';
import 'package:front_project/stores/home_store.dart';
import 'package:front_project/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void setupLocators() {
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(HomeStore());
}

//Para inicializar o Parse Server no aplicativo
Future<void> inicializeParse() async {
  await Parse().initialize(
    'TesteApp', //Nome da sua aplicação Parse
    'http://192.168.30.127:1337/parse', //Esta é a URL onde o servidor Parse está hospedado.
    clientKey: "123456789", //clientKey é usado para autenticação com o servidor Parse.
    autoSendSessionId: true, // Necessário para autenticação e ACL. Quando definido como true, o Parse Server incluirá automaticamente o sessionId em todas as solicitações.
    debug: true, // Quando habilitado, imprime logs no console
  );
/*
  //Escrevendo dados no banco
  final category = ParseObject('Categories');
  //Coluna e o dado que queremos armazenar neste campo
  category.set<String>('Title', 'Lanches');
  category.set<int>('Position', 2);

  final response = await category.save();
  debugPrint("${response.success}");
  */
/*
  //Atualizando dados no banco
  final category = ParseObject('Categories');
  //precisamos especificar o id do objeto que queremos atualizar
  category.objectId = 'GITXIXtd0M';
  //Coluna e o dado que queremos atualizar
  category.set<int>('Position', 2);

  final response = await category.save();
  debugPrint("${response.success}");
  */
/*
  //Removando dados do banco
  final category = ParseObject('Categories');
  //precisamos especificar o id do objeto que queremos excluir
  category.objectId = 'GITXIXtd0M';

  final response = await category.delete();
  debugPrint("${response.success}");
  */
/*
  //Buscando um dado no banco
  //Criamos um ParseObject definindo a classe "Tabela" e passamos o id do objeto
  final response = await ParseObject('Categories').getObject('tbvO4gYYEr');
  if(response.success){
    debugPrint("${response.result}");
  }
*/
/*
  //Buscando todos os dados de uma classe "tabela"
  //Criamos um ParseObject definindo a classe "Tabela"
  final response = await ParseObject('Categories').getAll();
  if(response.success){
    for(final category in response.result){
      debugPrint("$category");
    }
  }
*/
/*
  //Consulta personalizada
  //Indicar em qual tabela fazer a busca = ParseObject(Categories)
  final query = QueryBuilder(ParseObject('Categories'));
  query.whereEqualTo('Position', 1);

  final response = await query.query();

  if(response.success){
    debugPrint("${response.result}");
  }
  */
/*
  //Consulta personalizada
  //Indicar em qual tabela fazer a busca = ParseObject(Categories)
  final query = QueryBuilder(ParseObject('Categories'));
  //Adicionar as regras que desejamos
  query.whereContains('Title', 'Lan');
  query.whereEqualTo('Position', 2);

  final response = await query.query();

  if(response.success){
    debugPrint("${response.result}");
  }
  */
}


Future<void> main() async {
  /*
  Método no Flutter que garante que a infraestrutura fundamental para a execução de widgets e a interação com o ambiente Flutter esteja configurada 
  corretamente antes de qualquer outra operação.
  */
  //WidgetsFlutterBinding.ensureInitialized();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //inicializando o ParseServer
  await inicializeParse();

  //Funcao setupLocators() para que os objetos contidos nela possam ser acessados de qualquer local do app. GetIt
  setupLocators();

  //Impede de virar o celular de lado
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Retirar marca do debug
      debugShowCheckedModeBanner: false,
      title: 'Teste app',
      theme: ThemeData(
        fontFamily: 'SFPro',
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}
