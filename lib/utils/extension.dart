import 'package:intl/intl.dart';

extension StringExtension on String {
  bool isEmailValid() {
    final RegExp regex = RegExp(
        r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
    return regex.hasMatch(this);
  }

  bool isNameValid() {
    final RegExp regex = RegExp(
        "^([A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]{2,}\\s[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]{0,}'?-?[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]{0,}\\s?([A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]{1,})?)");
    return regex.hasMatch(this);
  }
}

//formatar texto no formato de data (usa pacote intl) -- uso ex: anuncio.createDate!.formattedDate()
extension DateTimeExtension on DateTime {
  String formattedDate() {
    return DateFormat('dd/MM/yyyy', 'pt-BR').format(this);
  }
}

extension NumberExtension on num {
  String formatPeso() {
    return NumberFormat('###,##0.00', 'pt-BR').format(this);
  }

  String formatNumber() {
    return NumberFormat('###,###,##0', 'pt-BR').format(this);
  }

  String formattedMoney() {
    return NumberFormat('R\$ ###,##0.00', 'pt-BR').format(this);
  }
}
