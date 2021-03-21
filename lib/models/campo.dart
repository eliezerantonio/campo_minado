import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/foundation.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({@required this.linha, @required this.coluna});

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

//Coluna
    if (deltaLinha <= 1 && deltaColuna >= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }
    _aberto = true;
    if (_minado) {
      _explodido = true;

      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      vizinhos.forEach((vizinho) {
        return vizinho.abrir();
      });
    }
  }

  void revelarBombas() {
    if (_minado) {
      _aberto = true;
    }
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  void minar() {
    _minado = true;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoEMarcado = marcado && minado;
    bool seguroEAberto = !minado && aberto;

    return minadoEMarcado || seguroEAberto;
  }

  int get qtdeMinasNaVizinhanca {
    return vizinhos.where((vizinho) => vizinho.minado).length;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((vizinho) => !vizinho.minado);
  }
}
