// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_final_fields

import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/saldo.dart';

void main() => runApp(ChangeNotifierProvider(
      create: ((context) => Saldo(0)),
      child: Bytebankapp(),
    ));

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
      home: Dashboard(),
    );
  }
}
/// StatefulWidget é possível modificar o conteúdo */
/// StatelessWidget não é possível editar o conteúdo */
/**
 * Vamos a uma pequena revisão do Dart. 
 * Começamos a semana desenvolvimento uma aplicativo de transferencias de valores, chamamos de Bytebank
 * Desenvolvemos um arquivo principal chamado main.dart, na pasta lib do projeto
 * As pastas com nome de sistema operacionais carregam códigos específicos de cada sistema, apenas em situações muito especificas será necessário alterar esses arquivos, por isso, focamos só no código da aplicação, no main.dart
 * Utilizamos a biblioteca de recursos Material Design, do Flutter para estilizar nosso aplicativo.
 * Separamos nosso projetos em pastas, muito similar ao que fazemos no padrão MVC, criamos uma pasta components (que poderia ser controllers), screens (que poderia ser views) e models (que seguiu o padrão xD).
 * Geralmente utilizamos StatelessWidget, para componentes que não deverão mudar de estado e StatefulWidget para componentes que podem mudar de estado.
 * Nossa lista de transferência é um StateFulWidget, afinal, precisa ser mutável. 
 * Nossa lista de transferências carrega uma classe principal que define o estilo do Material Design, chamada Scaffold. 
 * Nosso Scaffold recebeu 3 atributos para definir nossa página
 *  - appbar: contem as informações da barra superior 
 *  - body: contem as informações do corpo da tela, basicamente carrega mais widgets.  
 *  - floatingActionButton: um botão de ação, que abre nosso formulário de transferências. 
 * Criamos classe chamada ListaTranferencias que estende StatefulWidget
 * Nessa classe definimo "@override", @ indica que é uma anotação, a palavra "override" indica que esta subscrevendo um método, que nesse caso é o createState(), que por sua vez carrega ListaTransferenciasState().
 * ListaTransferenciasState, é onde acontece a mágica, aqui estamos subscrevendo o método build(), 
 * 
 */