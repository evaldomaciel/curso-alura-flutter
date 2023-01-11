import 'package:flutter/foundation.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adiciona(double valor) {
    this.valor += valor;
    /** Função avisa para a aplicação que algo foi alterado  */
    notifyListeners();
  }

  void subtrai(double valor) {
    this.valor -= valor;
    notifyListeners();
  }

  @override
  String toString() {
    String novoValor = valor.toStringAsFixed(2);
    novoValor = novoValor.replaceAll(".", ",");
    return 'R\$ $novoValor';
  }
}
