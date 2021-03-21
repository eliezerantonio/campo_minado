import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Campo Minado"),
        ),
        body: Container(
          child: Text("Tabuleiro"),
        ),
      ),
    );
  }
}
