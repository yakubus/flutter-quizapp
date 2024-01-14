import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            // przezroczystość
            opacity: 0.3,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            'Kliknij aby odpocząć',
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 1)),
            icon: const Icon(Icons.arrow_right),
            label: Text(
              'Rozpocznij grę',
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
