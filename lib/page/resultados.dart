import 'package:flutter/material.dart';
import 'home-page.dart';

class ResultadosPage extends StatelessWidget {
  var resultado;

  ResultadosPage({required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado De Operaciones"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          margin: EdgeInsets.all(15),
          child: Row(
            children: [
              Text("Resultado",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),


        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(
                          title: 'Calculadora IMC',
                        )));
          },
          child: Container(
              height: 80,
              color: Colors.pink,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Calcular",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                    ])
              ])),
        ),
      ]),
    );
  }
}
