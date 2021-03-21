import 'package:campo_minado/components/campo_wisget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key key}) : super(key: key);

  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
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
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          onReiniciar: _reiniciar,
        ),
        body: TabuleiroWidget(
            tabuleiro: Tabuleiro(linhas: 8, colunas: 15, qtdBombas: 10),
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao),
      ),
    );
  }
}
