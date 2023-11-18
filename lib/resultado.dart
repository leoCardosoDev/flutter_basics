import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoResetarQuestionario;
  Resultado(this.pontuacao, this.quandoResetarQuestionario);

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Parabéns';
    } else if (pontuacao < 16) {
      return 'Você é bom!';
    } else if (pontuacao < 20) {
      return 'Impressionante';
    } else {
      return 'Você está no nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pontuação: ${pontuacao}',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            fraseResultado,
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextButton(
              onPressed: quandoResetarQuestionario,
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: Text('Jogar novamente'),
            ),
          ),
        ],
      ),
    );
  }
}
