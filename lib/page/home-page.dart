import 'package:flutter/material.dart';
import 'resultados.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int contadorEdad = 10;
  int contadorPeso = 50;
  String sexo = "";
  int codeColorFemenino = 0xFFFF4081;
  int codeColorMasculino = 0xFF2196F3;
  int _counter = 0;
  List<Map<String, dynamic>> categorias = [
    {
      "textoIMC": "Bajo Peso",
      "valorMinimoRango": 0,
      "valorMaximoRango": 18.4,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.orange,
    },
    {
      "textoIMC": "Normal Peso",
      "valorMinimoRango": 18.5,
      "valorMaximoRango": 24.9,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.green,
    },
    {
      "textoIMC": "Sobre Peso",
      "valorMinimoRango": 25.0,
      "valorMaximoRango": 29.9,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.orange,
    },
    {
      "textoIMC": "Obesidad Grado 1",
      "valorMinimoRango": 30.0,
      "valorMaximoRango": 34.5,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.orange[700],
    },
    {
      "textoIMC": "Obesidad Grado 2",
      "valorMinimoRango": 35.0,
      "valorMaximoRango": 39.9,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.orange[900],
    },
    {
      "textoIMC": "Obesidad Grado 3",
      "valorMinimoRango": 40.0,
      "valorMaximoRango": 100.1,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.red,
    },
  ];

  void _incrementPeso() {
    setState(() {
      contadorPeso++;
    });
  }

  void _incrementEdad() {
    setState(() {
      contadorEdad++;
    });
  }

  void _decrementPeso() {
    setState(() {
      contadorPeso--;
    });
  }

  void _decrementEdad() {
    setState(() {
      contadorEdad--;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  dynamic getResultado() {
    double resultadoIMC =
        contadorPeso / ((_estaturaValue / 100) * (_estaturaValue / 100));
    var resultado;

    categorias.forEach((categoria) {
      double min = categoria['valorMinimoRango'];
      double max = categoria['valorMaximoRango'];
      if (min <= resultadoIMC && max >= resultadoIMC) {
        resultado = {
          "resultadoIMC": resultadoIMC,
          "mensajeIMC": categoria['mensajeIMC'],
          "textoIMC": categoria['textoIMC'],
          "color": categoria['color']
        };
      }
    });

    return resultado;
  }

  double _estaturaValue = 166;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  sexo = "Femenino";
                  codeColorFemenino = 0xFFFF4081;
                  codeColorMasculino = 0xFFFE3F2FD;
                });
              },
              child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Color(codeColorFemenino),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              new Tab(
                                  icon: new Image.asset("assets/female.png",
                                      height: 40),
                                  text: "Femenino")
                            ])
                      ])),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  sexo = "Masculino";
                  codeColorFemenino = 0xFFFCE4EC;
                  codeColorMasculino = 0xFF448AFF;
                });
              },
              child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Color(codeColorMasculino),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              new Tab(
                                  icon: new Image.asset("assets/male.png",
                                      height: 40),
                                  text: "Masculino")
                            ])
                      ])),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF212122),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 160,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Estatura",
                                style: TextStyle(
                                    color: Colors.white30, fontSize: 20),
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _estaturaValue.round().toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 50),
                              ),
                              Text("   centímetros",
                                  style: TextStyle(
                                      color: Colors.white30, fontSize: 20))
                            ]),
                        SliderTheme(
                          data: SliderThemeData(
                              activeTrackColor: Colors.white,
                              thumbColor: Colors.purpleAccent,
                              overlayColor:
                                  Colors.purpleAccent.withOpacity(0.2),
                              inactiveTrackColor: Colors.white24,
                              valueIndicatorColor: Colors.purpleAccent),
                          child: Slider(
                            value: _estaturaValue,
                            min: 50,
                            max: 200,
                            divisions: 150,
                            label: _estaturaValue.round().toString() +
                                "   centímetros",
                            onChanged: (double value) {
                              setState(() {
                                _estaturaValue = value;
                              });
                            },
                          ),
                        ),
                      ]))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF212122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Peso",
                              style: TextStyle(
                                  color: Colors.white30, fontSize: 20),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              contadorPeso.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: _decrementPeso,
                              child: Icon(Icons.remove,
                                  color: Colors.white, size: 32),
                            ),
                            FloatingActionButton(
                              onPressed: _incrementPeso,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 32),
                            )
                          ])
                    ])),
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF212122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Edad",
                              style: TextStyle(
                                  color: Colors.white30, fontSize: 20),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              contadorEdad.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: _decrementEdad,
                              child: Icon(Icons.remove,
                                  color: Colors.white, size: 32),
                            ),
                            FloatingActionButton(
                              onPressed: _incrementEdad,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 32),
                            )
                          ])
                    ])),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultadosPage(resultado: getResultado())));
              });
            },
            child: Container(
                height: 80,
                color: Colors.purple,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Calcular IMC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ])
                ])),
          ),
        ),
      ],
    );
  }
}
