// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    String _titulo = "Últimas transferências";
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: ((context, transferencias, child) {
          final _ultimasTransferencias = transferencias.transferencias.reversed.toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = 2;
          if(_quantidade == 0) {
            return SemTransferenciasRealizadas();
          }
          if (_quantidade < 2) {
            tamanho = _quantidade;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemTransferencia(_ultimasTransferencias[index]);
            },
          );
        })),
        ElevatedButton(
          child: Text('Ver todas as transferências'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaTranferencias();
              }),
            );
          },
        ),
      ],
    );
  }
}

class SemTransferenciasRealizadas extends StatelessWidget {
  const SemTransferenciasRealizadas({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Você não realizou nenhuma transferência!",
          textAlign: TextAlign.center,
         ),
      ),
    );
  }
}
