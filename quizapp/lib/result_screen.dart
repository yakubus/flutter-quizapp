import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choseAnswere, required this.restart});

  final void Function() restart;

  final List<String> choseAnswere;

  List<Map<String, Object>> getSumaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < choseAnswere.length; i++) {
      summary.add({
        'questionIndex': i + 1,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': choseAnswere[i],
        'trueAnswer':
            (questions[i].answers[0] == choseAnswere[i]) ? true : false
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final sumarryData = getSumaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = sumarryData.where((data) {
      return data['userAnswer'] == data['correctAnswer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$numCorrectQuestion / $numTotalQuestions ",
                    style: GoogleFonts.lato(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    )),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(sumaryData: sumarryData),
                const SizedBox(
                  height: 6,
                ),
                TextButton(
                    onPressed: restart,
                    child: const Text(
                      'restart quiz',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )));
  }
}
