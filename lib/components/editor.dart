// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final icone;

  const Editor({
    super.key,
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
  });

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
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
