import 'package:flutter/material.dart';
import './components/question.dart';
import './components/Character.dart';
import '../Loading/LoadingPage.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4EC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Question(
              overlayText: '今日はどうだった？',
            ),

            const Character(),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoadingPage()),
                );
              },
              child: Text('会話をやめる'),
            )
          ],
        )
      ),
    );
  }
}
