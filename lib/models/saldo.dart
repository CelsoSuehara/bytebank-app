import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier{
  double valor;

  Saldo(this.valor);

  void adicionar(double valor){
    this.valor += valor;

    notifyListeners();
  }

  void substrair(double valor){
    this.valor -= valor;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}