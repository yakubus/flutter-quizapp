import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.sumaryData});

  final List<Map<String, Object>> sumaryData;
  final double fontSize = 14;

  Widget verifyAnswerTextStyle(String userAnswer, String correctAnsware) {
    if (userAnswer == correctAnsware) {
      return Text(
        userAnswer,
        style: GoogleFonts.lato(color: Colors.green, fontSize: fontSize),
        textAlign: TextAlign.center,
      );
    } else {
      return Column(
        children: [
          Text(
            userAnswer,
            style: GoogleFonts.lato(
              color: Colors.red,
              fontSize: fontSize,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            correctAnsware,
            style: GoogleFonts.lato(color: Colors.green, fontSize: fontSize),
            textAlign: TextAlign.center,
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: sumaryData.map((data) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text((data['questionIndex']).toString()),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (data['question']).toString(),
                        style: GoogleFonts.lato(
                            fontSize: fontSize, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      verifyAnswerTextStyle((data['userAnswer']).toString(),
                          (data['correctAnswer']).toString())
                    ],
                  ),
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
