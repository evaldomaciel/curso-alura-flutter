// ignore_for_file: use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/editor.dart';
import '../../models/saldo.dart';

class FormularioDeposito extends StatelessWidget {
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
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);
    if (depositoValido) {
      _atualizaEstado(context, valor);
      // Fecha a tela
      Navigator.pop(context);
    } 
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor) {
    /** 
     * Para não recriar o componente todo vez que o estado mudar, vamos utilizar o provider.of
     * listen:false indica que não vamos ficar escutando tudo o que for mudar 
     * Por fim, adicionamos o valor. 
     */
    Provider.of<Saldo>(context, listen:false).adiciona(valor);
  }
}
