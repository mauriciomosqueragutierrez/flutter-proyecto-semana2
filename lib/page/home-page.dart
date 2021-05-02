import 'package:flutter/material.dart';

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
  int codeColorFemenino = 0xFF101227;
  int codeColorMasculino = 0xFF101227;
  int _counter = 0;
  var categorias = {
    {
      "textoIMC": "Bajo Peso",
      "valorMinimoRango": 0,
      "valorMaximoRango": 18.4,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.red,
    },
    {
      "textoIMC": "Normal Peso",
      "valorMinimoRango": 18.5,
      "valorMaximoRango": 24.9,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.red,
    },
    {
      "textoIMC": "Sobre Peso",
      "valorMinimoRango": 25.0,
      "valorMaximoRango": 29.9,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.red,
    },
    {
      "textoIMC": "Obesidad Grado 1",
      "valorMinimoRango": 30.0,
      "valorMaximoRango": 34.5,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.red,
    },
    {
      "textoIMC": "Obesidad Grado 2",
      "valorMinimoRango": 35.0,
      "valorMaximoRango": 39.9,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.red,
    },
    {
      "textoIMC": "Obesidad Grado 3",
      "valorMinimoRango": 40.0,
      "valorMaximoRango": 100.1,
      "mensajeIMC": "Verificar con nutricionista para aumentar peso.",
      "color": Colors.red,
    },
  };

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  double _currentSliderValue = 166;

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
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4081),
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
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF448AFF),
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
                                _currentSliderValue.round().toString(),
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
                            value: _currentSliderValue,
                            min: 50,
                            max: 200,
                            divisions: 150,
                            label: _currentSliderValue.round().toString() +
                                "   centímetros",
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
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
                              "90",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: _incrementCounter,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 32),
                            ),
                            FloatingActionButton(
                              onPressed: _incrementCounter,
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
                              "34",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: _incrementCounter,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 32),
                            ),
                            FloatingActionButton(
                              onPressed: _incrementCounter,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 32),
                            )
                          ])
                    ])),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
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
      ],
    );
  }
}
