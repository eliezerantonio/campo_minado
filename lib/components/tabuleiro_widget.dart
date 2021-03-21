import 'package:campo_minado/components/campo_wisget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {
  const TabuleiroWidget({
    Key key,
    @required this.tabuleiro,
    @required this.onAbrir,
    @required this.onAlternarMarcacao,
  }) : super(key: key);

  final Tabuleiro tabuleiro;

  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((e) {
          return CampoWidget(
              campo: e,
              onAbrir: onAbrir,
              onAlternarMarcacao: onAlternarMarcacao);
        }).toList(),
      ),
    );
  }
}
