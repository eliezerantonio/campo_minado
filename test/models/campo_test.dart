import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('campo', () {
    test('Abrir campo com explosao', () {
      Campo campo = new Campo(linha: 0, coluna: 0);
      campo.minar();

      expect(campo.abrir, throwsException);
    });

    test('Abrir campo sem explosao', () {
      Campo campo = new Campo(linha: 0, coluna: 0);
      campo.abrir();

      expect(campo.aberto, isTrue);
    });
    test('Adicionaro Nao vizinho', () {
      Campo campo1 = new Campo(linha: 0, coluna: 0);
      Campo campo2 = new Campo(linha: 1, coluna: 3);

      campo1.adicionarVizinho(campo2);

      expect(campo1.vizinhos.isEmpty, isTrue);
    });

    test('Adicionaro  vizinho', () {
      Campo campo1 = new Campo(linha: 3, coluna: 3);
      Campo campo2 = new Campo(linha: 3, coluna: 4);
      Campo campo3 = new Campo(linha: 2, coluna: 2);
      Campo campo4 = new Campo(linha: 4, coluna: 4);

      campo1.adicionarVizinho(campo2);
      campo1.adicionarVizinho(campo3);
      campo1.adicionarVizinho(campo4);

      expect(campo1.vizinhos.length, 3);
    });
  });
}
