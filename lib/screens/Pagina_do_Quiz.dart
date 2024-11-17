import 'package:flutter/material.dart';
import 'dart:async';
import 'Tela_de_Pontos.dart';
import 'Tela_de_Tempo.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _feedbackMessage = '';
  Color _feedbackColor = Colors.transparent;
  double _timerProgress = 1.0;
  late Timer _timer;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Qual é o planeta mais próximo do sol?',
      'options': [
        {
          'text': 'Terra',
          'image': 'lib/assests/Terra.png',
        },
        {
          'text': 'Vênus',
          'image': 'lib/assests/Vênus.png',
        },
        {
          'text': 'Mercúrio',
          'image': 'lib/assests/Mercúrio.png',
        },
        {
          'text': 'Marte',
          'image': 'lib/assests/Marte.png',
        },
      ],
      'answer': 2
    },
    {
      'question': 'Qual planeta é conhecido como o "Planeta Vermelho"?',
      'options': [
        {
          'text': 'Vênus',
          'image': 'lib/assests/Vênus.png',
        },
        {
          'text': 'Marte',
          'image': 'lib/assests/Marte.png',
        },
        {
          'text': 'Júpiter',
          'image': 'lib/assests/Júpiter.png',
        },
        {
          'text': 'Saturno',
          'image': 'lib/assests/Saturno.png',
        },
      ],
      'answer': 1
    },
    {
      'question': 'Qual é o maior planeta do Sistema Solar?',
      'options': [
        {
          'text': 'Júpiter',
          'image': 'lib/assests/Júpiter.png',
        },
        {
          'text': 'Saturno',
          'image': 'lib/assests/Saturno.png',
        },
        {
          'text': 'Netuno',
          'image': 'lib/assests/Netuno.png',
        },
        {
          'text': 'Terra',
          'image': 'lib/assests/Terra.png',
        },
      ],
      'answer': 0
    },
    {
      'question': 'Qual planeta tem um sistema de anéis mais proeminente?',
      'options': [
        {
          'text': 'Urano',
          'image': 'lib/assests/Urano.png',
        },
        {
          'text': 'Netuno',
          'image': 'lib/assests/Netuno.png',
        },
        {
          'text': 'Júpiter',
          'image': 'lib/assests/Júpiter.png',
        },
        {
          'text': 'Saturno',
          'image': 'lib/assests/Saturno.png',
        },
      ],
      'answer': 3
    },
    {
      'question':
          'Qual planeta é conhecido por ter uma atmosfera extremamente densa e ácida?',
      'options': [
        {
          'text': 'Terra',
          'image': 'lib/assests/Terra.png',
        },
        {
          'text': 'Marte',
          'image': 'lib/assests/Marte.png',
        },
        {
          'text': 'Vênus',
          'image': 'lib/assests/Vênus.png',
        },
        {
          'text': 'Júpiter',
          'image': 'lib/assests/Júpiter.png',
        },
      ],
      'answer': 2
    },
    {
      'question':
          'Qual planeta tem o dia mais longo (tempo de rotação mais lento)?',
      'options': [
        {
          'text': 'Júpiter',
          'image': 'lib/assests/Júpiter.png',
        },
        {
          'text': 'Marte',
          'image': 'lib/assests/Marte.png',
        },
        {
          'text': 'Terra',
          'image': 'lib/assests/Terra.png',
        },
        {
          'text': 'Vênus',
          'image': 'lib/assests/Vênus.png',
        },
      ],
      'answer': 3
    },
    {
      'question':
          'Qual planeta é famoso por ter grandes tempestades, incluindo a "Grande Mancha Vermelha"?',
      'options': [
        {
          'text': 'Saturno',
          'image': 'lib/assests/Saturno.png',
        },
        {
          'text': 'Netuno',
          'image': 'lib/assests/Netuno.png',
        },
        {
          'text': 'Marte',
          'image': 'lib/assests/Marte.png',
        },
        {
          'text': 'Júpiter',
          'image': 'lib/assests/Júpiter.png',
        },
      ],
      'answer': 3
    },
    {
      'question':
          'Qual planeta tem a maior quantidade de água em forma de gelo?',
      'options': [
        {
          'text': 'Marte',
          'image': 'lib/assests/Marte.png',
        },
        {
          'text': 'Urano',
          'image': 'lib/assests/Urano.png',
        },
        {
          'text': 'Netuno',
          'image': 'lib/assests/Netuno.png',
        },
        {
          'text': 'Terra',
          'image': 'lib/assests/Terra.png',
        },
      ],
      'answer': 3
    },
    {
      'question':
          'Qual planeta é conhecido por seus ventos extremamente fortes, podendo chegar a 2.000 km/h?',
      'options': [
        {
          'text': 'Júpiter',
          'image': 'lib/assests/Júpiter.png',
        },
        {
          'text': 'Netuno',
          'image': 'lib/assests/Netuno.png',
        },
        {
          'text': 'Vênus',
          'image': 'lib/assests/Vênus.png',
        },
        {
          'text': 'Terra',
          'image': 'lib/assests/Terra.png',
        },
      ],
      'answer': 1
    },
    {
      'question': 'Qual planeta possui a lua chamada "Titã"?',
      'options': [
        {
          'text': 'Terra',
          'image': 'lib/assests/Terra.png',
        },
        {
          'text': 'Netuno',
          'image': 'lib/assests/Netuno.png',
        },
        {
          'text': 'Saturno',
          'image': 'lib/assests/Saturno.png',
        },
        {
          'text': 'Marte',
          'image': 'lib/assests/Marte.png',
        },
      ],
      'answer': 2
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _timerProgress = 1.0;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _timerProgress -= 0.01;
      });

      if (_timerProgress <= 0) {
        timer.cancel();
        _showTimeoutScreen();
      }
    });
  }

  void _answerQuestion(int selectedOption) {
    final correctAnswer = _questions[_currentQuestionIndex]['answer'];
    _timer.cancel();

    setState(() {
      if (selectedOption == correctAnswer) {
        _score++;
        _feedbackMessage = 'Resposta Correta!';
        _feedbackColor = Colors.green;
      } else {
        _feedbackMessage = 'Resposta Errada!';
        _feedbackColor = Colors.red;
      }
    });

    Future.delayed(const Duration(milliseconds: 10), _nextQuestion);
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _feedbackMessage = '';
      _feedbackColor = Colors.transparent;
      _startTimer();
    });

    if (_currentQuestionIndex >= _questions.length) {
      _showScoreScreen();
    }
  }

  void _showTimeoutScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => TimeoutScreen(onRetry: _resetQuiz),
      ),
    );
  }

  void _showScoreScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ScoreScreen(
          score: _score,
          totalQuestions: _questions.length,
          onRetry: _resetQuiz,
        ),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
      _feedbackMessage = '';
      _feedbackColor = Colors.transparent;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Planetário'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1B0035), 
              Color(0xFF00072D), 
              Color(0xFF2D004B), 
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _currentQuestionIndex < _questions.length
            ? _buildQuizQuestion()
            : Container(),
      ),
    );
  }

  Widget _buildQuizQuestion() {
    final question = _questions[_currentQuestionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinearProgressIndicator(
          value: _timerProgress,
          color: Colors.black,
          backgroundColor: Colors.grey[300],
          minHeight: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Questão ${_currentQuestionIndex + 1} / ${_questions.length}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'lib/assests/Quiz Time.png',
                  height: 250,
                  fit: BoxFit.contain,
                ),
                Text(
                  question['question'],
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 30),
                ...List.generate(question['options'].length, (index) {
                  final option = question['options'][index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () => _answerQuestion(index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            option['image'],
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              option['text'],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Text(
                  _feedbackMessage,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _feedbackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}