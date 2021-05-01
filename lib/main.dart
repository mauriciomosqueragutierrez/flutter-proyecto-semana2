import 'package:flutter/material.dart';
import 'package:imc/page/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white24,
        canvasColor: Colors.black,
      ),
      home: MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}
