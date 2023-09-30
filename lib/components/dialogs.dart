import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void dialogError({required BuildContext context, required String txt, Function? onClose}) {
  AwesomeDialog(
    context: context,
    title: 'ERRO',
    desc: txt,
    animType: AnimType.bottomSlide,
    btnOkText: 'Ok',
    btnOkColor: Colors.red,
    btnOkOnPress: () {
      // Execute a função de retorno quando o botão "Ok" for pressionado
      if (onClose != null) {
        onClose();
      }
    },
    // Configure o onDismissCallback para executar o onClose quando o diálogo for fechado
   onDismissCallback: (type) {
     if (onClose != null) {
       onClose();
     }
   },
    showCloseIcon: true,
    dialogType: DialogType.error,
  ).show();
}

dialogSucess({required BuildContext context, required String txt, Function? onClose}) {
  AwesomeDialog(
    context: context,
    title: 'Concluído!',
    desc: txt,
    animType: AnimType.bottomSlide,
    btnOkText: 'Continuar',
    btnOkColor: Colors.green,
    dismissOnTouchOutside: false,
    btnOkOnPress: () {
      // Execute a função de retorno quando o botão "Ok" for pressionado
      if (onClose != null) {
        onClose();
      }
    },
    showCloseIcon: false,
    dialogType: DialogType.success,
  ).show();
}
