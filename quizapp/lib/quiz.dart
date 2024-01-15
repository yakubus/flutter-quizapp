import 'package:quizapp/question_screen.dart';
import 'package:quizapp/result_screen.dart';

import './start_screen.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'quesstion-screen';
    });
  }

  void choseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  Widget choseScreen() {
    if (activeScreen == "start-screen") {
      return StartScreen(switchScreen);
    } else if (activeScreen == "result-screen") {
      return ResultScreen(
        choseAnswere: selectedAnswers,
        restart: restartQuiz,
      );
    } else {
      return QuestionScrean(onSelectAnswer: choseAnswer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 44, 11, 144),
                    Color.fromARGB(255, 165, 119, 246)
                  ]),
            ),
            child: choseScreen()),
      ),
    );
  }
}
