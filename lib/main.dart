import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(PerguntasApp());

class _PerguntasAppState extends State<PerguntasApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua COR favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 7},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu ANIMAL favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 4},
        {'texto': 'Cobra', 'pontuacao': 6},
        {'texto': 'Elefante', 'pontuacao': 2},
        {'texto': 'Leão', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual o seu INSTRUTOR favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 6},
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 2},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _resetarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada => _perguntaSelecionada < _perguntas.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _resetarQuestionario),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  _PerguntasAppState createState() => _PerguntasAppState();
}
