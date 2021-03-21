import 'package:campo_minado/components/campo_wisget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key key}) : super(key: key);
  void _reiniciar() {
    print('Reiniciar...');
  }

  void _abrir(Campo campo) {
    print("abrir");
  }

  void _alternarMarcacao(Campo campo) {
    print("marcacao");
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();
    Campo vizinho2 = Campo(linha: 1, coluna: 1);
    vizinho2.minar();
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho1);
    campo.adicionarVizinho(vizinho2);
    try {
      //   campo.minar();
      campo.alternarMarcacao();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
          appBar: ResultadoWidget(
            venceu: true,
            onReiniciar: _reiniciar,
          ),
          body: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          )),
    );
  }
}
