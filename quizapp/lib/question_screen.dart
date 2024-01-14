import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScrean extends StatefulWidget {
  const QuestionScrean({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScrean> createState() {
    return _QuestionScreanState();
  }
}

class _QuestionScreanState extends State<QuestionScrean> {
  var curQuestiunIndex = 0;

  void answerQuestion(String secesterAnswer) {
    widget.onSelectAnswer(secesterAnswer);
    setState(() {
      curQuestiunIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currQuetion = questions[curQuestiunIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQuetion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currQuetion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answetText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
