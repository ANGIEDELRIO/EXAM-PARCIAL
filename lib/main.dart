import 'package:examen_parcial/pages/formulario.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainFligthApp());

class MainFligthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(body: FormularioPage()),
    );
  }
}
