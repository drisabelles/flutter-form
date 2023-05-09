import 'package:flutter/material.dart';
import 'package:flutter_app/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo da Isabelle',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Register(),
    );
  }
}
