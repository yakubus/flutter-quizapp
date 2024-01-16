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
        textAlign: TextAlign.left,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userAnswer,
            style: GoogleFonts.lato(
              color: Colors.red,
              fontSize: fontSize,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            correctAnsware,
            style: GoogleFonts.lato(color: Colors.green, fontSize: fontSize),
            textAlign: TextAlign.left,
          )
        ],
      );
    }
  }

  List<Card> generateListView() {
    List<Card> itemlist = [];
    sumaryData.map((data) {
      itemlist.add(
        Card(
          color: Color.fromARGB(255, 17, 26, 125),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.green.shade300,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(
              (data['question']).toString(),
              style: GoogleFonts.lato(fontSize: fontSize, color: Colors.white),
              textAlign: TextAlign.left,
            ),
            isThreeLine: true,
            subtitle: verifyAnswerTextStyle((data['userAnswer']).toString(),
                (data['correctAnswer']).toString()),
            leading: Text(
              (data['questionIndex']).toString(),
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }).toList();

    return itemlist;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 500,
        child: ListView(
          children: generateListView(),
        ),
      ),
    );
  }
}
