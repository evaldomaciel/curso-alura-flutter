// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields

import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = "Transferências";

class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child) {
          return ListView.builder(
            itemCount: transferencias.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = transferencias.transferencias[indice];
              return ItemTransferencia(transferencia);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  /* 
 O método setState é um método da classe State que informa ao framework que o estado do widget associado à instância de State mudou. Isso faz com que o widget seja redesenhado na tela. A função anônima passada como argumento para o método setState define a lógica que atualiza o estado do widget. No caso específico desse trecho de código, o estado do widget é atualizado adicionando um item à lista _transferencias.

  O símbolo _ antes do nome do método indica que ele é um método privado da classe. Isso significa que o método só pode ser acessado dentro da própria classe ou por outras classes no mesmo pacote. Isso é um padrão de projeto comum em Dart para indicar que um método não deve ser chamado diretamente por código externo.
 
 */
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.toStringValor()),
        subtitle: Text(_transferencia.toStringConta()),
      ),
    );
  }
}
