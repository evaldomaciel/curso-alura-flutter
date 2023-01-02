// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(Bytebankapp());

class Bytebankapp extends StatelessWidget {
  const Bytebankapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fazendo uma transferência"),
      ),
      body: Column(children: <Widget>[
        Editor(
          controlador: _controladorCampoNumeroConta,
          rotulo: "Numero da conta",
          dica: "0000",
        ),
        Editor(
          controlador: _controladorCampoValor,
          rotulo: "Numero da conta",
          dica: "0.00",
          icone: Icons.monetization_on,
        ),
        ElevatedButton(
            onPressed: () => _criaTransferencia(), child: Text("Confirmar")),
      ]),
    );
  }

  void _criaTransferencia() {
    final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
    }
  }
}

/// StatefulWidget é possível modificar o conteudo */
/// StatelessWidget não é possível editar o conteudo */
class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.00, 1001)),
          ItemTransferencia(Transferencia(200.00, 1005)),
          ItemTransferencia(Transferencia(300.00, 2003)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print({'teste'});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;
  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final icone;

  const Editor(
      {super.key,
      required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: TextField(
        style: TextStyle(
          fontSize: 24.0,
        ),
        controller: controlador,
        decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
            icon: icone != null ? Icon(icone) : null),
        keyboardType: TextInputType.number,
      ),
    );
  }
}