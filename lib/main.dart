// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/Tela_de_boas-vindas.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz PLanetário',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const WelcomeScreen(),
    );
  }
}