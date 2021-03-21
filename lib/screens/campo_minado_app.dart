import 'package:campo_minado/components/resultado_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key key}) : super(key: key);
  _reiniciar() {
    print('Reiniciar...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: Text("Tabuleiro"),
        ),
      ),
    );
  }
}
