import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.sumaryData});

  final List<Map<String, Object>> sumaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: sumaryData.map((data) {
          return Row(
            children: [
              Text((data['questionIndex']).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text((data['question']).toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    Text((data['userAnswer']).toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    Text((data['correctAnswer']).toString()),
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
