// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields

import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/editor.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

const _tituloAppBar = "Fazendo uma transferência";
const _rotuloNumeroDaConta = "Numero da conta";
const _dicaNumeroDaConta = "0000";
const _rotuloValor  = "Valor";
const _dicaValor  = "0.00";
const _textoBotaoConfirmar  = "Confirmar";

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: _rotuloNumeroDaConta,
            dica: _dicaNumeroDaConta,
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: _rotuloValor,
            dica: _dicaValor,
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar)),
        ]),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}