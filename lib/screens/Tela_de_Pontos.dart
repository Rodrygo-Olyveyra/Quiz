import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRetry;

  const ScoreScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRetry,
  });

  String getScoreMessage() {
    double percentage = (score / totalQuestions) * 100;

    if (percentage < 50) {
      return 'Você não sabe nada sobre planetas';
    } else if (percentage >= 50 && percentage < 70) {
      return 'Você manja um pouco de planetas';
    } else if (percentage >= 80 && percentage < 100) {
      return 'Você sabe bastante sobre planetas';
    } else {
      return 'Você é um expert em planetas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pontuação Final'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1B0035), // Roxo escuro
              Color(0xFF00072D), // Azul escuro
              Color(0xFF2D004B), // Roxo mais claro
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assests/Quiz Time.png',
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                'Sua Pontuação: $score / $totalQuestions',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                getScoreMessage(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Volta para a tela anterior
                  onRetry(); // Reinicia o quiz
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Tentar novamente',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
