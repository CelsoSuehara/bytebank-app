
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transferência';

class FormularioTransferencia extends StatelessWidget {
  
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          
          Editor(
            controlador: _controladorCampoNumeroConta, 
            rotulo: 'Número da Conta', 
            dica: '000000'),

          Editor(
            controlador: _controladorCampoValor, 
            rotulo: 'Valor', 
            dica: '0.00', 
            icone: Icons.monetization_on),
                    
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () =>_criaTransferencia(context),
          ),
        ],
      ),
      )
    );
  }
  
  void _criaTransferencia(BuildContext context){
    //debugPrint('Clicou no confirmar.');
    final String numeroConta = _controladorCampoNumeroConta.text;
    final double valor = double.tryParse(_controladorCampoValor.text);
    
    final transferenciaValida = _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida){
      final novaTransferencia = Transferencia(valor, numeroConta);
      //debugPrint(transferencia.toString());
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor){
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente = valor <= Provider.of<Saldo>(context, listen: false).valor;
    return _camposPreenchidos && _saldoSuficiente;
  }

  _atualizaEstado(context, novaTransferencia, valor){
    Provider.of<Transferencias>(context, listen: false).adicionar(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).substrair(valor);
  }
}