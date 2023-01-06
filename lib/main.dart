// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields

import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(Bytebankapp());

class Bytebankapp extends StatelessWidget {
  const Bytebankapp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      theme: theme.copyWith(
        brightness: Brightness.light,
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.blue[900],
          primary: Colors.green[900],
        ),
      ),
      home: ListaTranferencias(),
    );
  }
}
/// StatefulWidget é possível modificar o conteúdo */
/// StatelessWidget não é possível editar o conteúdo */