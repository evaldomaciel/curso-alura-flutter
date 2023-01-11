import 'package:flutter/material.dart';

import '../../components/editor.dart';

class FormularioDeposito extends StatelessWidget {
  // const FormularioDeposito({super.key});
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const _tituloAppBar = 'Receber deposito';
    var _rotuloValor = 'Valor';
    var _dicaValor = '0.00';
    var _textoBotaoConfirmar = 'Confirmar';
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView garante que a página não gere erro de exibição se a página tela for pequena
        child: Column(children: <Widget>[
          Editor(
            controlador: _controladorCampoValor,
            rotulo: _rotuloValor,
            dica: _dicaValor,
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
              onPressed: () => _criaDeposito(context),
              child: Text(_textoBotaoConfirmar)),
        ]),
      ),
    );
  }

  _criaDeposito(context) {
    Navigator.pop(context);
  }
}
