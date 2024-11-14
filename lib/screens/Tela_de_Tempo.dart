import 'package:flutter/material.dart';

class TimeoutScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const TimeoutScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempo Esgotado'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assests/Quiz Time.png',
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Você demorou muito para responder, comece novamente!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                onRetry(); 
              },
              child: const Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}