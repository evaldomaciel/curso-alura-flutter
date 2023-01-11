// ignore_for_file: prefer_const_constructors

import 'package:bytebank/components/saldo.dart';
import 'package:bytebank/screens/desposito/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/saldo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bytebank"),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          Consumer<Saldo>(builder: (context, saldo, child) {
            return ElevatedButton(
              child: Text('Adiciona'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }),
                );
              },
            );
          })
        ],
      ),
    );
  }
}
