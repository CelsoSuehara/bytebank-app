class Transferencia{
  final double valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);

  String toStringValor(){
    return 'R\$ $valor';
  }

  String toStringConta(){
    return 'Conta: $numeroConta';
  }

  @override
  String toString() {
    return 'Transferencia{valor $valor, numeroConta: $numeroConta}';
  }
}