import 'dart:math';

import 'package:campo_minado/models/campo.dart';
import 'package:flutter/widgets.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdBombas;

  final List<Campo> _campos = [];

  Tabuleiro(
      {@required this.linhas,
      @required this.colunas,
      @required this.qtdBombas}) {
    _criarCampos();
    _realcionarVizinhos();
    _sortearMinas();
  }

  void reiniciar() {
    _campos.forEach((campo) {
      campo.reiniciar();
    });

    _sortearMinas();
  }

  void revelarBomas() {
    _campos.forEach((campo) {
      campo.revelarBombas();
    });
  }

  void _criarCampos() {
    for (int linha = 0; linha < linhas; linha++) {
      for (int coluna = 0; coluna < colunas; coluna++) {
        _campos.add(Campo(linha: linha, coluna: coluna));
      }
    }
  }

  void _realcionarVizinhos() {
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;

    if (qtdBombas > linhas * colunas) {
      return;
    }

    while (sorteadas < qtdBombas) {
      int i = Random().nextInt(_campos.length);

      if (!_campos[i].minado) {
        sorteadas++;
        _campos[i].minar();
      }
    }
  }

  List<Campo> get campos {
    return _campos;
  }

  bool get resolvido {
    return _campos.every((campo) => campo.resolvido);
  }
}
